import yaml


#ruleid:avoid-pyyaml-load
yaml.unsafe_load("!!python/object/new:os.system [echo EXPLOIT!]")

def thing(**kwargs):
    #ruleid:avoid-pyyaml-load
    yaml.unsafe_load("!!python/object/new:os.system [echo EXPLOIT!]", **kwargs)

def other_thing(**kwargs):
    #ruleid:avoid-pyyaml-load
    yaml.load("!!python/object/new:os.system [echo EXPLOIT!]", Loader=yaml.Loader, **kwargs)

def other_thing_two(**kwargs):
    #ruleid:avoid-pyyaml-load
    yaml.load("!!python/object/new:os.system [echo EXPLOIT!]", Loader=yaml.UnsafeLoader, **kwargs)

def other_thing_three(**kwargs):
    #ruleid:avoid-pyyaml-load
    yaml.load("!!python/object/new:os.system [echo EXPLOIT!]", Loader=yaml.CLoader, **kwargs)

def other_thing_four(**kwargs):
    #ruleid:avoid-pyyaml-load
    yaml.load_all("!!python/object/new:os.system [echo EXPLOIT!]", Loader=yaml.Loader, **kwargs)

def other_thing_five(**kwargs):
    #ruleid:avoid-pyyaml-load
    yaml.load_all("!!python/object/new:os.system [echo EXPLOIT!]", Loader=yaml.UnsafeLoader, **kwargs)

def other_thing_six(**kwargs):
    #ruleid:avoid-pyyaml-load
    yaml.load_all("!!python/object/new:os.system [echo EXPLOIT!]", Loader=yaml.CLoader, **kwargs)

def this_is_ok(stream):
    #ok:avoid-pyyaml-load
    return yaml.load(stream, Loader=yaml.CSafeLoader)

def this_is_also_ok(stream):
    #ok:avoid-pyyaml-load
    return yaml.load(stream, Loader=yaml.SafeLoader)

def this_is_additionally_ok(stream):
    #ok:avoid-pyyaml-load
    return yaml.load_all(stream, Loader=yaml.CSafeLoader)

def this_is_ok_too(stream):
    #ok:avoid-pyyaml-load
    return yaml.load_all(stream, Loader=yaml.SafeLoader)

def this_is_ok_as_well(stream):
    #ok:avoid-pyyaml-load
    return yaml.load(stream, Loader=yaml.BaseLoader)

def this_is_ok_too_two(stream):
    #ok:avoid-pyyaml-load
    return yaml.load_all(stream, Loader=yaml.BaseLoader)

def check_ruamel_yaml():
    from ruamel.yaml import YAML
    yaml = YAML(typ="rt")
    # ok:avoid-pyyaml-load
    yaml.load("thing.yaml")
    # ok:avoid-pyyaml-load
    yaml.load_all("thing.yaml")

# --- #4135: unsafe_load_all + positional Loader ---

def unsafe_load_all_stream(stream):
    #ruleid:avoid-pyyaml-load
    return yaml.unsafe_load_all(stream)

def positional_unsafe_loader(stream):
    #ruleid:avoid-pyyaml-load
    return yaml.load(stream, yaml.UnsafeLoader)

def positional_loader(stream):
    #ruleid:avoid-pyyaml-load
    return yaml.load(stream, yaml.Loader)

def positional_cloader(stream):
    #ruleid:avoid-pyyaml-load
    return yaml.load(stream, yaml.CLoader)

def positional_load_all_unsafe(stream):
    #ruleid:avoid-pyyaml-load
    return yaml.load_all(stream, yaml.UnsafeLoader)

def positional_load_all_loader(stream):
    #ruleid:avoid-pyyaml-load
    return yaml.load_all(stream, yaml.Loader)

def positional_load_all_cloader(stream):
    #ruleid:avoid-pyyaml-load
    return yaml.load_all(stream, yaml.CLoader)

def positional_safe_loader_ok(stream):
    #ok:avoid-pyyaml-load
    return yaml.load(stream, yaml.SafeLoader)

def positional_csafe_loader_ok(stream):
    #ok:avoid-pyyaml-load
    return yaml.load(stream, yaml.CSafeLoader)

def positional_base_loader_ok(stream):
    #ok:avoid-pyyaml-load
    return yaml.load(stream, yaml.BaseLoader)

def positional_full_load_ok(stream):
    #ok:avoid-pyyaml-load
    return yaml.full_load(stream)

def from_import_positional():
    from yaml import load, UnsafeLoader
    payload = "!!python/object/new:os.system [echo EXPLOIT!]"
    #ruleid:avoid-pyyaml-load
    return load(payload, UnsafeLoader)

def from_import_load_all_cloader():
    from yaml import load_all, CLoader
    payload = "!!python/object/new:os.system [echo EXPLOIT!]"
    #ruleid:avoid-pyyaml-load
    return load_all(payload, CLoader)

def from_import_unsafe_load_all(stream):
    from yaml import unsafe_load_all
    #ruleid:avoid-pyyaml-load
    return unsafe_load_all(stream)
