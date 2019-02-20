#!/usr/bin/env python

"""
    Run svm_light, parse its stdout, calculate
    ML scores, HDFS copy data to local.
"""

import sys
import os
import getpass
import subprocess
import shutil
import math


def delete_dir(dir_path):
    '''
        Remove a directory.

        Args:
            dir_path: full path to the directory.
    '''
    if os.path.isdir(dir_path):
        shutil.rmtree(dir_path)


def usage():
    '''
        Handle the CLI arguments.
    '''
    args = sys.argv
    if len(args) != 3:
        print("Usage: ./runEval <method> <version>")
        sys.exit(2)
    return args[1], args[2]


def create_dir(dir_path):
    '''
        Create a a directory.

        Args:
            dir_path: full path to the directory.
    '''
    if not os.path.exists(dir_path):
        os.makedirs(dir_path)


def run_svm_classify(test_data, svml_model, svml_eval):
    '''
        Spawn a subprocess to run svm_classify binary.

        From svm_classify.c, svm_light usage requires the following
        arguments: example_file model_file output_file.

        Args:
            test_data: path_to_feature/test.dat
            svml_model: something like ~/data/models/svmlight/method/version/model
            svml_eval: something like ~/data/models/svmlight/method/version/eval

        Returns:
            Strings with stdout and stderr so that it can be parsed later.
    '''
    p = subprocess.Popen(['./models/svm_classify', \
            '{0}'.format(test_data), \
            '{0}'.format(svml_model),\
            '{0}'.format(svml_eval)],\
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE)
    out, err = p.communicate()
    return out, err


def paste_data(test_data, svml_eval, final_eval, svml_alpha, final_alphas, out):
    '''
        Copy all eval and alpha data from results to local files.

        Args:
            src and dst paths.
    '''
    # Copy all eval data.
    with open(test_data, 'r') as ft:
        test_data = ft.readlines()

    with open(svml_eval, 'r') as fe:
        eval_data = fe.readlines()

    with open(final_eval, 'a') as f:
        for line in test_data:
            f.write('{0}\n'.format(line))
        for line in eval_data:
            f.write('{0}\n'.format(line))

    # Copy all alpha data.
    with open(svml_alpha, 'r') as fa:
        alpha_data = fa.readlines()

    with open(final_alphas, 'a') as f:
        for line in alpha_data:
            f.write('{0}     {1}\n'.format(line, out))


def parse_svmlight_output(out):
    '''
        Parse the svm_light stdout string for an example

        Returns:
            c: counts
            p: precision
            r: recall
    '''
    c = out.split('OK. (')[1].split(' support')[0]
    pr = out.split('Precision/recall on test set: ')[1].split(' support')[0].strip()
    p, r = pr.split('/')
    p = float(p.strip('%').strip()) / 100
    r = float(r.strip('%').strip()) / 100

    return c, p, r


def hdfs_copy_data(home_dir, method, version):
    '''
        Run CLI HDFS commands to clean up and save data.
    '''
    os.system('hdfs dfs -rm /data/shared/structdata/modelOutput/{0}/{1}/scores'.format(method, version))
    os.system('hdfs dfs -rm /data/shared/structdata/modelOutput/{0}/{1}/alphas'.format(method, version))

    os.system('hdfs dfs -mkdir /data/shared/structdata/modelOutput/{0}/{1}'.format(method, version))

    os.system('hdfs dfs -copyFromLocal {0}/data/eval/{1}/{2}/alphas \
            /data/shared/structdata/modelOutput/{3}/{4}/alphas'.format(home_dir, version, method, method, version))

    os.system('hdfs dfs -copyFromLocal {0}/data/eval/{1}/{2}/eval \
            /data/shared/structdata/modelOutput/{3}/{4}/scores'.format(home_dir, version, method, method, version))

def calculate_scores(list_of_scores):
    '''
        Calculate the mean of a given list of scores,
        taking care of any nan or 0 division.
    '''
    c, score = 0, 0
    for i in list_of_scores:
        if not math.isnan(i):
            c += 1
            score += i
    if c > 0:
        return score / c
    else:
        return 0


def calculate_f1(precision, recall):
    '''
        Calculates the f1-score as the harmonic
        mean of precision and recall.
    '''
    if precision + recall < 1:
        return 0
    else:
        return  2 / (1/precision + 1/recall)


if __name__ == '__main__':

    # Grab the CLI arguments.
    METHOD, VERSION = usage()

    # Setup output dirs.
    home_dir = os.path.join('/home', getpass.getuser())
    final_dir = os.path.join(home_dir, 'data/eval', VERSION, METHOD)
    final_alphas = os.path.join(final_dir, 'alphas')
    final_eval = os.path.join(final_dir, 'eval')

    delete_dir(final_alphas)
    delete_dir(final_eval)
    create_dir(final_dir)

    # Loop over the attributes and features.
    training_data_dir = os.path.join(home_dir, 'data/training_data/', VERSION, METHOD)

    for attribute in os.listdir(training_data_dir):

        attribute_path = os.path.join(training_data_dir, attribute)
        counts = 0
        precision, recall = [], []

        for feature in os.listdir(attribute_path):

            # Create all the paths in use.
            out = os.path.join(VERSION, METHOD, attribute, feature)
            svmlight = os.path.join(home_dir,'data/models/svmlight', out)
            svml_model =  os.path.join(svmlight, 'model')
            svml_eval = os.path.join(svmlight, 'eval')
            svml_alpha = os.path.join(svmlight, 'alphas')
            test_data = os.path.join(attribute_path, feature, 'test.dat')

            # Run svm_classify.
            out, err = run_svm_classify(test_data, svml_model, svml_eval)

            # Save current results.
            paste_data(test_data, svml_eval, final_eval, svml_alpha, final_alphas, out)

            # Parse output from svm_classify to print to stdout.
            if err:
                print('Error: {0}'.format(err))

            # Get Train counts, Test counts, Accuracy, Precision, Recall.
            c, p ,r = parse_svmlight_output(out)

            counts += int(c)
            precision.append(p)
            recall.append(r)

        attribute_precision = calculate_scores(precision)
        attribute_recall = calculate_scores(recall)
        attribute_f1 = calculate_f1(attribute_precision, attribute_recall)

        print("{: <20} Counts: {: <20} Precision: {: <20} Recall: {: <20} F1-score: {: <20}".format(attribute.title(), \
            counts, round(attribute_precision, 4), round(attribute_recall, 4), round(attribute_f1, 4)))


    # Copying results from remote hdfs.
    print("\nCopying results to hdfs")
    hdfs_copy_data(home_dir, METHOD, VERSION)
    print("\nDone!".format())

