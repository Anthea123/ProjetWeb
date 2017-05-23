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
      redirect_to '/users/login'
    end
  end

  def login
    not_logged_in
  end

  def check
    @current_user = User.where(username: params[:username], password: params[:password]).first
    if @current_user
      session[:user_id] = @current_user.id
      flash[:notice] = "Bienvenue #{@current_user.username} !"
      redirect_to "/users/home"
    else
      flash[:notice] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end

  def inscription
    not_logged_in
    @new_user = PermitedTeacher.new 
  end

  def logout
    logged_in
    session[:user_id] = nil
    redirect_to "/users/login"
  end

  def index
    admin_exclusive
    @users = User.all
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @current_user.update username: params[:username], password: params[:password], surname: params[:surname], name: params[:name]
        format.html { redirect_to user_path(@current_user), notice: "Votre profil a été modifié" }
        format.json { render :show, status: :ok, location: @current_user }
      else
        format.html { render :edit }
        format.json { render json: @current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    User.find(params[:id]).delete
    if !@current_user
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Le compte a été supprimé" }
        format.json { head :no_content }
      end
    else
       respond_to do |format|
        format.html { redirect_to users_path, notice: "Le compte a été supprimé" }
        format.json { head :no_content }
      end
    end
  end
end
