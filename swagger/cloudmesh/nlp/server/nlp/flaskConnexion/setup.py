# coding: utf-8

import sys
from setuptools import setup, find_packages

NAME = "swagger_server"
VERSION = "1.0.0"

# To install the library, run the following
#
# python setup.py install
#
# prerequisite: setuptools
# http://pypi.python.org/pypi/setuptools

REQUIRES = ["connexion"]

setup(
    name=NAME,
    version=VERSION,
    description="Natural language processing REST service with Swagger",
    author_email="",
    url="",
    keywords=["Swagger", "Natural language processing REST service with Swagger"],
    install_requires=REQUIRES,
    packages=find_packages(),
    package_data={'': ['swagger/swagger.yaml']},
    include_package_data=True,
    entry_points={
        'console_scripts': ['swagger_server=swagger_server.__main__:main']},
    long_description="""\
    A simple service to get some nlp features such as part of speech tagging, lemmatization, consituency parsing etc given an input string as a sentence using swagger -2.0 specification and codegen
    """
)

