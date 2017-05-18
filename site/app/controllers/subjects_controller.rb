class SubjectsController < ApplicationController
	def index
		teacher_exclusive
		@subjects = Subject.where(teacher_id: @current_user.id)
	end

	def new
		teacher_exclusive
		@subject = Subject.new
	end

	def create
		teacher_exclusive
		@subject = Subject.create title: params[:title], start_date: params[:start_date], end_date: params[:end_date], teacher_id: @current_user.id
	end

	def show

	end 

	def update
		teacher_exclusive
		@subject = Subject.find(params[:id]).update title: params[:title], start_date: params[:start_date], end_date: params[:end_date], teacher_id: @current_user.id
		redirect_to subjects_path
	end

	def edit
		teacher_exclusive
		@subject = Subject.find(params[:id])
	end

	def destroy
		teacher_exclusive
	end
end
