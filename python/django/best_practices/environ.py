import environ
import django
import os
import environ

# this is false positive due to pattern-not acting as non-filter
# OK
my_variable = os.environ["TESTING"]
