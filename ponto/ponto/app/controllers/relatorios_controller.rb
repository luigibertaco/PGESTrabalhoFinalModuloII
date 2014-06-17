class RelatoriosController < ApplicationController
  skip_before_action :usuario_responsavel
  helper DiaHelper
  
  def index
    @setors = Setor.all
  end
  
  def executa
  	@datainicial = params[:datainicial]
  	@datafinal = params[:datafinal]
  	@setors = Setor.all
    render :bancohoras, layout: false
  end
  
end