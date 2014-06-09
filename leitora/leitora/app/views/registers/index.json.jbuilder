json.array!(@registers) do |register|
  json.extract! register, :id, :data, :hora, :funcionario
  json.url register_url(register, format: :json)
end
