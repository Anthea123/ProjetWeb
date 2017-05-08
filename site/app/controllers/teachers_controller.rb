class TeachersController < ApplicationController

  def create
    @teacher = Teacher.create username: params[:username], password: params[:password], name: params[:name], surname: params[:surname], type: "Teacher"
    if @teacher.save
      PermitedTeacher.where(username: params[:username], password: params[:password]).first.destroy
    end
    redirect_to '/permited_teachers/index'
  end

  def home

  end

  def show

  end

  def invite

  end
end
