import connexion
import six

from swagger_server.models.allfeature import ALLFEATURE  # noqa: E501
from swagger_server.models.depparsed import DEPPARSED  # noqa: E501
from swagger_server.models.entity import ENTITY  # noqa: E501
from swagger_server.models.tagged import TAGGED  # noqa: E501
from swagger_server import util
import sys
sys.path.insert(0,"/Users/master/Documents/e516 engineering cloud computing/hid-sp18-405")
from nlps.ling import LING


def all_input_get(input):  # noqa: E501
    """all_input_get

     # noqa: E501

    :param input: Sentence to be analyzed
    :type input: str

    :rtype: ALLFEATURE
    """
    ling = LING(input)
    return ALLFEATURE(tokens=ling.tokens(), parsetree=ling.depparse(),
                      entities=ling.entity(), tags=ling.pos())


def depparse_input_get(input):  # noqa: E501
    """depparse_input_get

     # noqa: E501

    :param input: Sentence to be dependency-parsed
    :type input: str

    :rtype: DEPPARSED
    """
    ling = LING(input)
    return DEPPARSED(tokens=ling.tokens(), parsetree=ling.depparse())


def entity_input_get(input):  # noqa: E501
    """entity_input_get

     # noqa: E501

    :param input: Sentence to be parsed
    :type input: str

    :rtype: ENTITY
    """
    ling = LING(input)
    return ENTITY(tokens=ling.tokens(), entities=ling.entity())


def pos_input_get(input):  # noqa: E501
    """pos_input_get

     # noqa: E501

    :param input: Sentence to be tagged
    :type input: str

    :rtype: TAGGED
    """
    ling = LING(input)
    return TAGGED(tokens=ling.tokens(), tags=ling.pos())

