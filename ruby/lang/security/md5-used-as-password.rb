require 'digest'

#### True Positives ####
def ex1 (user, pwtext)
    # ruleid: md5-used-as-password
    user.set_password Digest::MD5.hexdigest pwtext
end

def ex2 (user, pwtext)
    md5 = Digest::MD5.new
    md5.update pwtext
    md5 << salt(pwtext)
    dig = md5.hexdigest
    # ruleid: md5-used-as-password
    user.set_password dig
end

#### True Negatives ####
def ok1 (user, pwtext)
    # ok: md5-used-as-password
    user.set_password Digest::SHA256.hexdigest pwtext
end

def ok2 (user, pwtext)
    sha = Digest::SHA256.new
    sha.update pwtext
    sha << salt(pwtext)
    dig = sha.hexdigest
    # ok: md5-used-as-password
    user.set_password dig
end
