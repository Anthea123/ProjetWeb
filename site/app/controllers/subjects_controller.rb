class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
	def index
		teacher_exclusive
		@subjects = Subject.where(teacher_id: @current_user.id)
	end

	def new
		teacher_exclusive
<<<<<<< Updated upstream
=======
		@subject = Subject.new
    @students = Student.all
>>>>>>> Stashed changes
	end

	def create
		teacher_exclusive
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
	end

	def destroy
		teacher_exclusive
    @subject.destroy
	end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end
end
