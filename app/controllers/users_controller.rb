class UsersController < ApplicationController
  def home
    if @current_user
      if @current_user.admin?
        redirect_to '/administrators/home'
      else
        if @current_user.teacher?
          redirect_to '/teachers/home'
        else
          redirect_to '/students/home'
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def login
  end

  def check
    @current_user = User.where(username: params[:username], password: params[:password]).first
    if @current_user
      flash[:info] = "Bienvenue #{@current_user.username} !"
      session[:user_id] = @current_user.id
      redirect_to "/users/home"
    else
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end

  def inscription
  end

  def logout
    session[:user_id] = nil
    redirect_to "/users/login"
  end
end
