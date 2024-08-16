#!/usr/bin/env python3
"""Redis Basics"""

import uuid
from typing import Union, Callable, Optional
import redis


class Cache:
    """Writing strings to Redis"""
    def __init__(self) -> None:
        """Instantiates the class instance
        """
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Store data into the cache (in -memory)

        Args:
            data (Union[str  |  bytes  |  int  |  float]):
            data could be string, bytes, int or float

        Returns:
            str: returns a string -> key of the data
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str,
            fn: Optional[Callable] = None
            ) -> Optional[Union[str, int, float, bytes]]:
        """Get's the data for a given key

        Args:
            key (str): the key string to get data
            fn (Callable, optional): function to convert the data.
            Defaults to None.

        Returns:
            Optional[Union[str, int, float, bytes]]:
            the data in its original or converted form
        """
        # Retrieve the data from Redis
        data = self._redis.get(key)

        # If data is not found, return None
        if data is None:
            return None

        # If a callable fn is provided, use it to process the data
        if fn is not None:
            return fn(data)

        # If no callable is provided, return the raw data
        return data

    def get_str(self, key: str) -> Optional[str]:
        """Get the data as a string

        Args:
            key (str): the key string to get data

        Returns:
            Optional[str]: the data as a string
        """
        return self.get(key, fn=lambda d: d.decode("utf-8"))

    def get_int(self, key: str) -> Optional[int]:
        """Get the data as an integer

        Args:
            key (str): the key string to get data

        Returns:
            Optional[int]: the data as an integer
        """
        return self.get(key, fn=int)


# Testing the implementation
cache = Cache()

TEST_CASES = {
    b"foo": None,
    123: int,
    "bar": lambda d: d.decode("utf-8")
}

for value, fn in TEST_CASES.items():
    key = cache.store(value)
    assert cache.get(key, fn=fn) == value

# print("All tests passed!")
