json.array!(@ferias_funcionarios) do |ferias_funcionario|
  json.extract! ferias_funcionario, :id, :funcionario_id, :data_inicio, :data_fim
  json.url ferias_funcionario_url(ferias_funcionario, format: :json)
end
