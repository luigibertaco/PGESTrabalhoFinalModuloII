class RelatoriosController < ApplicationController
  skip_before_action :usuario_responsavel
  
  def index
    @setors = Setor.all
  end
  
  def executa
  	@setors = Setor.all
    render :bancohoras, layout: false
  end
  
end