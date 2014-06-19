class InconsistenciasController < ApplicationController
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]
  helper DiaHelper
  
  def index
    
  end
end
  