 def bad_deserialization
   data = request.env[:name]
   # ruleid: bad-deserialization-env
   obj = Marshal.load(data)

   o = Klass.new(request.env[:name])
   data = CSV.dump(o)
   # ruleid: bad-deserialization-env
   obj = CSV.load(data)

   o = Klass.new("hello\n")
   data = request.env[:name]
   # ruleid: bad-deserialization-env
   obj = Oj.object_load(data)
   # ruleid: bad-deserialization-env
   obj = Oj.load(data)
   # ok: bad-deserialization-env
   obj = Oj.load(data,options=some_safe_options)
 end

 def ok_deserialization
    o = Klass.new("hello\n")
    data = CSV.dump(o)
    # ok: bad-deserialization-env
    obj = CSV.load(data)
    
    data = get_safe_data()
    # ok: bad-deserialization-env
    obj = Marshal.load(data)
 end
