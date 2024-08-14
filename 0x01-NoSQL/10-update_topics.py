#!/usr/bin/env python3
"""Update mongodb via python"""


def update_topics(mongo_collection, name, topics):
    """update mongodb via python"""

    results = mongo_collection.update_one(
        {"name": name}, {'$set': {"topics": topics}})
    if results:
        return results
    return None
