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

   # ok: bad-deserialization-yaml
   obj = YAML::load(ERB.new(File.read("test.yml")).result)
   
   # ok: bad-deserialization-yaml
   obj = YAML::load(ERB.new(File.read("test.yml")))

   template = ERB.new(File.read("test.yml"))
   # ok: bad-deserialization-yaml
   obj = YAML::load(template)

   template = ERB.new(File.read("test.yml")).result
   # ok: bad-deserialization-yaml
   obj = YAML::load(template)

   template = ERB.new(File.read("test.yml"))
   # ok: bad-deserialization-yaml
   obj = YAML::load(template.result)

   # ok: bad-deserialization-yaml
   obj = YAML.load(File.read(File.join(Pathname.pwd, "hello.yml")))
end
