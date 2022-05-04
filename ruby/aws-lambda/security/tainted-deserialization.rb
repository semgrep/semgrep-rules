def handler(event:, context:)
	foobar = event['smth']

    # ruleid: tainted-deserialization
    obj1 = Marshal.load(foobar)

    data = event['body']['object']
    # ruleid: tainted-deserialization
    obj2 = YAML.load(data)

    # ruleid: tainted-deserialization
    obj3 = CSV.load("o:" + event['data'])
end

def ok_handler(event:, context:)

    # ok: tainted-deserialization
    obj1 = Marshal.load(Marshal.dump(Foobar.new))

    data = "hardcoded_value"
    # ok: tainted-deserialization
    obj2 = YAML.load(data)

    # ok: tainted-deserialization
    obj3 = CSV.load(get_safe_data())
end
