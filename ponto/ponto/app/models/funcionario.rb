class Funcionario < ActiveRecord::Base
  belongs_to :setor
  has_many :ferias_funcionarios

  validates_presence_of :nome, :setor
end
