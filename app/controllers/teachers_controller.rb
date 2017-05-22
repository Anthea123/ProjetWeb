class TeachersController < ApplicationController

  def create
    admin_exclusive
    @teacher = Teacher.create username: params[:username], password: params[:password], name: params[:name], surname: params[:surname], type: "Teacher"
    if @teacher.save
      PermitedTeacher.where(username: params[:username], password: params[:password]).first.destroy
    end
    redirect_to '/permited_teachers/index'
  end

  def home
    teacher_exclusive
  end

  def show

  end

  def invite
    teacher_exclusive
  end
end
