#!/usr/bin/env python3
"""Update MongoDB via Python"""


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

    # Update operation to set the topics field
    update_operation = {"$set": {"topics": topics}}

    # Perform the update (update_one updates only the first matching document)
    result = mongo_collection.update_one(filter_query, update_operation)

    # Optionally, return the result if needed
    return result
