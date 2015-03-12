#!/usr/bin/env bash
set -ex

# Script for testing if our requirements are up-to-date
rm -rf test_requirements/
mkdir test_requirements/
cd test_requirements/
virtualenv venv
. venv/bin/activate
pip install ../ -i https://pypi.yelpcorp.com/simple
pip freeze -l | grep -v '^styleguide==' > requirements.txt
diff -u ../requirements.txt requirements.txt
cd ../
rm -rf test_requirements/

echo -e '\033[42mSuccess!\033[0m'
