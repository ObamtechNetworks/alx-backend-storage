#!/usr/bin/env python3
"""List topics"""


def schools_by_topic(mongo_collection, topic):
    """
    Returns the list of schools having a specific topic

    :param mongo_collection: pymongo collection object
    :param topic: topic string to search
    for in the "topics" field
    :return: list of schools (documents) that have
    the topic in their "topics" field
    """
    # Use the find method to filter documents where 'topics'
    # contains the specified topic
    schools = mongo_collection.find({"topics": topic})

    # Return the list of matching documents
    return list(schools)
