#!/usr/bin/env python
"""
    Export data in a CSV spreadsheet.

    Marina von Steinkirch - 2017

    Need to have argparse installed:
    $ pip install argparse
"""

import sys
import argparse
from pandas import DataFrame


def read_data(data):
    lines = data.readlines()

    feature, precision, recall, f1 = [], [], [], []
    for line in lines:
        line_clean = line.strip().split(",")
        feature.append(line_clean[0])
        precision.append(line_clean[1])
        recall.append(line_clean[4])
        f1.append(line_clean[6])
    return feature, precision, recall, f1


def save_to_spreadsheet(resultfile, data):
    try:
        df = DataFrame({'Feature': data[0], 'Precision': data[1], 'Recall': data[2], 'f1-score': data[3]})
        df.to_csv(resultfile, index=False)
        print("Spreadsheet saved at {0}".format(resultfile))
    except:
        print("Error: {0}".format(sys.exc_info()[0]))


def menu():
    parser = argparse.ArgumentParser(description='Copy data results into a spreadsheet.')
    parser.add_argument('-s', dest='input', type=argparse.FileType('r'), required=True, help="File with the results.")
    parser.add_argument('-d', dest='output', required=True, help="The name of the file to save the spreadsheet.")
    args = parser.parse_args()
    args.input, args.output
    return args.input, args.output


if __name__ == "__main__":
    datafile, resultfile = menu()
    data = read_data(datafile)
    save_to_spreadsheet(resultfile, data)
