json.array!(@feriados) do |feriado|
  json.extract! feriado, :id, :descricao, :data
  json.url feriado_url(feriado, format: :json)
end
