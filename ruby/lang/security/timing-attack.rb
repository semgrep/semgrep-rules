class timing_attack
  http_basic_authenticate_with name: "Chris", password: "LimpBizkitRules420"
  http_basic_authenticate_with :name => ENV["NAME"], :password => ENV["PASSWORD"]
end
