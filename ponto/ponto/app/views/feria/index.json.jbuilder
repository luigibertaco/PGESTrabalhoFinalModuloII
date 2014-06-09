json.array!(@feria) do |ferium|
  json.extract! ferium, :id, :funcionario_id, :data_inicio, :data_fim
  json.url ferium_url(ferium, format: :json)
end
