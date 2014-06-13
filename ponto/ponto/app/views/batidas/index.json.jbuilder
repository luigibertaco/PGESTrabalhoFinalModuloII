json.array!(@batidas) do |batida|
  json.extract! batida, :id, :funcionario_id, :data, :hora
  json.url batida_url(batida, format: :json)
end
