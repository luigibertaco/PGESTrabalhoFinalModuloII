class RelatoriosController < ApplicationController
  skip_before_action :usuario_responsavel
  
  def index
    
    if current_user.administrador? || current_user.rh?
      @setors = Setor.all
    else  
      # Aqui tem que carregar somente o setor do responsável
      @setors = Setor.all
    end
  end
  
  def executa
    redirect_to 'www.globo.com.br'
  end;
  
end