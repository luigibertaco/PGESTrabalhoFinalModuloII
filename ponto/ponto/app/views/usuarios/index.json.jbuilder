json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :username, :senha
  json.url usuario_url(usuario, format: :json)
end
