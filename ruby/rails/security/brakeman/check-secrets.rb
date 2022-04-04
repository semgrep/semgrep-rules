# ruleid: check-secrets
PASSWORD = "superdupersecret"
http_basic_authenticate_with :name => "superduperadmin", :password => PASSWORD, :only => :create
# ok: check-secrets
secret = get_from_store('somepass')
# ok: check-secrets
rest_auth_site_key = ""
