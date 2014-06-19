class Usuario < ActiveRecord::Base
	belongs_to :setor
  
  TIPO = {0 => 'Administrador', 1 => 'Responsável por Setor', 2 => 'RH'}
  
  validates_presence_of :username, :senha, :ativo
  validates_presence_of :setor, if: :somente_responsavel?
  validate :setor_nao_responsavel

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

  def somente_responsavel?
    responsavel? && !administrador?
  end
  
  def self.authenticate(username, password)
    user = Usuario.find_by(username: username, senha: password, ativo: true)
	end

  def setor_nao_responsavel
    errors.add(:base, 'Somente responsável pode ter setor vinculado') if !somente_responsavel? && setor
  end
end
