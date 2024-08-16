#!/usr/bin/env python3
"""Redis Basics"""

import uuid
from typing import Union
import redis


class Cache:
    """Writing strings to Redis"""
    def __init__(self) -> None:
        """Instantiates the class instance
        """
        self.__redis = redis.Redis()
        self.__redis.flushdb()

    def store(self, data: Union[str | bytes | int | float]) -> str:
        """Store data into the cache (in -memory)

        Args:
            data (Union[str  |  bytes  |  int  |  float]):
            data could be string, bytes, int or float

        Returns:
            str: returns a string -> key of the data
        """
        key = str(uuid.uuid4())
        self.__redis.set(key, data)
        return key
