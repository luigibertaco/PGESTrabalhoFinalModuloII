class Funcionario < ActiveRecord::Base
  belongs_to :setor
  has_many :ferias_funcionarios
  has_many :batidas

  validates_presence_of :nome, :setor
end
