class FeriasFuncionario < ActiveRecord::Base
  belongs_to :funcionario
  validates_presence_of :funcionario

  def dias
  	(data_inicio..data_fim).to_a
  end
end
