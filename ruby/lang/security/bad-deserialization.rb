 def bad_deserialization
    o = Klass.new("hello\n")
    data = params['data']
    # ruleid: bad-deserialization
    obj = Marshal.load(data)

    o = Klass.new("hello\n")
    data = YAML.dump(o)
    # ok: bad-deserialization
    obj = YAML.load(data)

    o = Klass.new(params['hello'])
    data = CSV.dump(o)
    # ruleid: bad-deserialization
    obj = CSV.load(data)

    o = Klass.new("hello\n")
    data = cookies['some_field']
    # ruleid: bad-deserialization
    obj = Oj.object_load(data)
    # ruleid: bad-deserialization
    obj = Oj.load(data)
   # ok: bad-deserialization
   obj = Oj.load(data,options=some_safe_options)
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
