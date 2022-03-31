 def bad_deserialization

    o = Klass.new("hello\n")
    data = YAML.dump(o)
    # ruleid: bad-deserialization-yaml
    obj = YAML.load(data)

 end

 def ok_deserialization
    o = Klass.new("hello\n")
    data = YAML.dump(o)
    # ok: bad-deserialization-yaml
    obj = YAML.load(data, safe: true)

    filename = File.read("test.txt")
    data = YAML.dump(filename)
    # ok: bad-deserialization-yaml
    YAML.load(filename)

    # ok: bad-deserialization-yaml
    YAML.load(File.read("test.txt"))
 end
