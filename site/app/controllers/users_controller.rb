class UsersController < ApplicationController
  def home
  end

  def login
  end

  def check
    @current_user = User.where(username: params[:username], password: params[:password]).first
    if @current_user
      flash[:info] = "Bienvenue #{@current_user.username} !"
      redirect_to "/users/home"
    else
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end

  def inscription

  end
end
