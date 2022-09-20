# Importing the library
import psutil

def memory_total():
    # get available memory in GIGABYTE
    value = psutil.virtual_memory().total
    total_in_GB = value / (1024 ** 3)
    return total_in_GB