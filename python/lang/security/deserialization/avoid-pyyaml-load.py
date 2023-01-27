import yaml

from http.server import BaseHTTPRequestHandler
import urllib.parse

class GetHandler(BaseHTTPRequestHandler):

    def do_GET(self, **kwargs):
        tainted = urlparse.urlparse(self.path).query

        #ruleid:avoid-pyyaml-load
        yaml.unsafe_load(tainted)
        
        #ruleid:avoid-pyyaml-load
        yaml.unsafe_load(tainted, **kwargs)
        
        #ruleid:avoid-pyyaml-load
        yaml.load(tainted, Loader=yaml.Loader, **kwargs)
        
        #ruleid:avoid-pyyaml-load
        yaml.load(tainted, Loader=yaml.UnsafeLoader, **kwargs)
        
        #ruleid:avoid-pyyaml-load
        yaml.load(tainted, Loader=yaml.CLoader, **kwargs)
        
        #ruleid:avoid-pyyaml-load
        yaml.load_all(tainted, Loader=yaml.Loader, **kwargs)
        
        #ruleid:avoid-pyyaml-load
        yaml.load_all(tainted, Loader=yaml.UnsafeLoader, **kwargs)
        
        #ruleid:avoid-pyyaml-load
        yaml.load_all(tainted, Loader=yaml.CLoader, **kwargs)
        
        #ok:avoid-pyyaml-load
        yaml.load(stream, Loader=yaml.CSafeLoader)
        
        #ok:avoid-pyyaml-load
        yaml.load(stream, Loader=yaml.SafeLoader)
        
        #ok:avoid-pyyaml-load
        yaml.load_all(stream, Loader=yaml.CSafeLoader)
        
        #ok:avoid-pyyaml-load
        yaml.load_all(stream, Loader=yaml.SafeLoader)
        
        #ok:avoid-pyyaml-load
        yaml.load(stream, Loader=yaml.BaseLoader)
        
        #ok:avoid-pyyaml-load
        yaml.load_all(stream, Loader=yaml.BaseLoader)
        
        
        from ruamel.yaml import YAML
        yaml = YAML(typ="rt")
        # ok: avoid-pyyaml-load
        yaml.load(tainted)
        # ok: avoid-pyyaml-load
        yaml.load_all(tainted)
