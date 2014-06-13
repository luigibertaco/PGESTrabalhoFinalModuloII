class UserSessionsController < ApplicationController
  skip_before_action :require_authentication, only: [:new, :create]
  skip_before_action :usuario_responsavel
  before_action :require_no_authentication, only: [:new, :create]
#	before_action :require_authentication, only: :destroy
	def new
		@user_session = UserSession.new(session)
    render layout: false
	end

	def create
		@user_session = UserSession.new(session, params[:user_session])
		
		if @user_session.authenticate!
			#não esqueça de adicionar a chave no i18n!
      redirect_to root_path, notice: 'Logado com sucesso'
		else
      render :new, layout: false
		end
	end

	def destroy
		user_session.destroy
    redirect_to root_path, notice: 'Desconectado'
	end
end