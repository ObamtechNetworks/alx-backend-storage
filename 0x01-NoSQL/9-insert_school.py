#!/usr/bin/env python3
"""Insert into mongodb document in a collection based on the kwargs"""


def insert_school(mongo_collection, **kwargs):
    """Inserts into a mongo_collection based on the kwargs"""

    result = mongo_collection.insert_one({**kwargs})
    if result:
        for item in result:
            return item.get('_id')
    return []
