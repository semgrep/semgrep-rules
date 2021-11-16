 def bad_deserialization
    o = Klass.new("hello\n")
    data = Marshal.dump(o)
    # ruleid: bad-deserialization
    obj = Marshal.load(data)

    o = Klass.new("hello\n")
    data = YAML.dump(o)
    # ruleid: bad-deserialization
    obj = YAML.load(data)

    o = Klass.new("hello\n")
    data = CSV.dump(o)
    # ruleid: bad-deserialization
    obj = CSV.load(data)

    o = Klass.new("hello\n")
    data = CSV.dump(o)
    # ruleid: bad-deserialization
    obj = data.object_load()
 end

 def ok_deserialization
    o = Klass.new("hello\n")
    data = YAML.dump(o)
    # ok: bad-deserialization
    obj = YAML.load(data, safe: true)

    filename = File.read("test.txt")
    data = YAML.dump(filename)
    # ok: bad-deserialization
    YAML.load(filename)

    # ok: bad-deserialization
    YAML.load(File.read("test.txt"))
 end
