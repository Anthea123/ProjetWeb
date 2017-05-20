class PermitedTeachersController < ApplicationController
  def create
    @permitedteacher = PermitedTeacher.create username: params[:username], password: params[:password], name: params[:name], surname: params[:surname], email: params[:email]
    if @permitedteacher.save
      flash[:notice] = "Demande d'inscription envoyée"
      redirect_to "users/home"
    else
      flash[:notice] = "Erreur"
      redirect_to users_inscription_path
    end
  end

  def index
    @permited_teachers = PermitedTeacher.all
  end

  def show
  end

  def destroy
    PermitedTeacher.find(params[:id]).delete
    redirect_to permited_teachers_index_path
  end
end
