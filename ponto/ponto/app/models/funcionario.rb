class Funcionario < ActiveRecord::Base
  belongs_to :setor
  has_many :ferias_funcionarios
  has_many :batidas
  has_many :divergencias

  validates_presence_of :nome, :setor

  def todasferias
  	todasferias ||= []
  	ferias_funcionarios.each do |ferias|
  		todasferias = todasferias.concat(ferias.dias)
  	end
  	todasferias
  end

end
