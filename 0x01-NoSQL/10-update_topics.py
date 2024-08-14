#!/usr/bin/env python3
"""Update mongodb via python"""


def update_topics(mongo_collection, name, topics):
    """
    Updates the topics of a school document based on the name.

    Args:
        mongo_collection: The pymongo collection object.
        name (str): The name of the school to update.
        topics (list of str): The list of topics to set.
    """
    # Filter to find the document with the given name
    filter_query = {"name": name}

    if filter_query:
        # Update operation to set the topics field
        update_operation = {"$set": {"topics": topics}}
        # Perform the update
        result = mongo_collection.update_one(filter_query, update_operation)
        return result
    return ""
