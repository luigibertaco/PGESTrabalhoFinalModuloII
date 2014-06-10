class Setor < ActiveRecord::Base
  has_many :funcionarios
  has_many :usuarios
end
