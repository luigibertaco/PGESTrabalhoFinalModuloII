class Usuario < ActiveRecord::Base
	belongs_to :setor
  
  TIPO = {0 => 'Administrador', 1 => 'Responsável por Setor', 2 => 'RH'}
  
  validates_inclusion_of :tipo, in: TIPO
  
  def responsavel?
    tipo.in? [0,1]
  end
  
  def administrador?
    tipo.in? [0]
  end
  
  def rh?
    tipo.in? [2]
  end
  
  def self.authenticate(username, password)
    user = Usuario.find_by(username: username, senha: password)
	end
end
