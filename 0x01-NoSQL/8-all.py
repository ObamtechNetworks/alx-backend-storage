#!/usr/bin/env python3
"""List all documents in pymongo"""


def list_all(mongo_collection: object) -> object:
    """A function that lists all documents in a mongodb collection

    Args:
        mongo_collection (object): collection object

    Returns:
        object: returns each object
    """

    result = mongo_collection.find()
    if result:
        return result
    return []
