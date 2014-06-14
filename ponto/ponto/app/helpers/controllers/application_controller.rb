class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  delegate :current_user, :user_signed_in?, to: :user_session
  helper_method :current_user, :user_signed_in?
  
  before_action :require_authentication, :usuario_responsavel

  def user_session
  	UserSession.new(session)
  end
  
  def require_authentication
  	unless user_signed_in?
      redirect_to new_user_sessions_path, alert: 'Você precisa estar logado no sistema'
  	end
  end

  def require_no_authentication
  	if user_signed_in?
      redirect_to root_path, notice: 'Você já está logado'
  	end
  end
  
  def usuario_responsavel
    unless current_user.responsavel?
      redirect_to relatorios_path, alert: 'Você foi redirecionado para os relatórios pois não possui permissão para a ação executada'
    end
  end
  
  def usuario_administrador
    unless current_user.administrador?
      redirect_to relatorios_path, alert: 'Você foi redirecionado para os relatórios pois não possui permissão para a ação executada'
    end
  end
  
end
