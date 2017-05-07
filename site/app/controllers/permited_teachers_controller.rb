class PermitedTeachersController < ApplicationController
  def create
    @permitedteacher = PermitedTeacher.create username: params[:username], password: params[:password], name: params[:name], surname: params[:surname], email: params[:email]
    if @permitedteacher
      redirect_to "users/home"
    else
      redirect_to permited_teachers_create_path
    end
  end
end
