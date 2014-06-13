class RelatoriosController < ApplicationController
  skip_before_action :usuario_responsavel
  
  def index
  end
  
end