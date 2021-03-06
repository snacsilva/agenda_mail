class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :validate_token
  before_action :validate_permission, only: [:update]
  before_action :set_user, except: [:index]

  # [API] update user info
  # [PATCH] /api/v1/users/:id
  def update
    if user_params[:password].blank? || user_params[:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      respond_to do |format|
        format.json { render :json => {status: 200, message: 'Perfil editado com sucesso.'}}
      end
    else
      respond_to do |format|
        format.json { render :json => {status: 422, message: 'Houve um erro.'}}
      end
    end
  end
 
  # [API] get all non archived messages
  # [GET] /api/v1/users/
  def index
    @users = User.normal
    respond_to do |format|
      format.json { render :json => @users }
    end
  end

  # [API] get all messages non archived of a user , sent and received
  # [GET] /api/v1/users/:id/messages
  def messages
    @user = User.find(params[:id])
    @sent = Message.sent_from(@user).ordered
    @received = Message.sent_to(@user).ordered
    respond_to do |format|
      format.json { render :json => {sent: @sent, received: @received} }
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
      )
  end

  def validate_token
    @user = params[:token].present? ? User.find_by_token(params[:token]) : nil
    if params[:permission] == 'master' || @user.try(:master?)
      render json: {erro: 'Não autorizado.'}, status: 401 unless params[:token] == Figaro.env.api_key
    else
      render json: {erro: 'Não autorizado.'}, status: 401 unless @user 
    end
  end

  def validate_permission
    render json: {erro: 'Não autorizado.'} if params[:permission] == 'master'
  end
end
 