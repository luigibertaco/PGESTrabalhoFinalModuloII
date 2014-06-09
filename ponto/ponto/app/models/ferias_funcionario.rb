class FeriasFuncionario < ActiveRecord::Base
  belongs_to :funcionario
  validates_presence_of :funcionario
end
