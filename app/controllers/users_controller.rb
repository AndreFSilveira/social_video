class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :make_admin]

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Bem vindo ao Social video!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Conta atualizada"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def make_admin
    user = User.find(params[:id])
    user.admin = true
    user.save
    redirect_to :back
  end

  def revoke_admin
    user = User.find(params[:id])
    user.admin = false
    user.save
    redirect_to :back
  end

  def friendship
    @user = current_user
  end

  def add_friend
    current_user.friend_request(User.find(params[:id]))
    flash[:success] = "Soliciacão enviada"
    redirect_to users_url
  end

  def confirm_friendship
    current_user.accept_request(User.find(params[:id]))
    flash[:success] = "Amizade confirmada"
    redirect_to :back
  end

  def block_friendship
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(user_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
