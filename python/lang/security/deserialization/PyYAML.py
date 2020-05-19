import yaml

#ruleid:avoid-pyyaml-load
yaml.load("!!python/object/new:os.system [echo EXPLOIT!]")