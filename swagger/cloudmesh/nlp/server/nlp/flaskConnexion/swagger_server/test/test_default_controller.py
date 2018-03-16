# coding: utf-8

from __future__ import absolute_import

from flask import json
from six import BytesIO

from swagger_server.models.allfeature import ALLFEATURE  # noqa: E501
from swagger_server.models.depparsed import DEPPARSED  # noqa: E501
from swagger_server.models.entity import ENTITY  # noqa: E501
from swagger_server.models.tagged import TAGGED  # noqa: E501
from swagger_server.test import BaseTestCase


class TestDefaultController(BaseTestCase):
    """DefaultController integration test stubs"""

    def test_all_input_get(self):
        """Test case for all_input_get

        
        """
        response = self.client.open(
            '/cloudmesh/nlp/all/{input}'.format(input='input_example'),
            method='GET',
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_depparse_input_get(self):
        """Test case for depparse_input_get

        
        """
        response = self.client.open(
            '/cloudmesh/nlp/depparse/{input}'.format(input='input_example'),
            method='GET',
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_entity_input_get(self):
        """Test case for entity_input_get

        
        """
        response = self.client.open(
            '/cloudmesh/nlp/entity/{input}'.format(input='input_example'),
            method='GET',
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_pos_input_get(self):
        """Test case for pos_input_get

        
        """
        response = self.client.open(
            '/cloudmesh/nlp/pos/{input}'.format(input='input_example'),
            method='GET',
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    import unittest
    unittest.main()
