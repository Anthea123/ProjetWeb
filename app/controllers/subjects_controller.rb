class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy, :exams]

  # GET /subjects
  # GET /subjects.json
  def index
    logged_in
    if @current_user.teacher?
      @subjects = Subject.where(teacher_id: @current_user.id)
    elsif @current_user.student?
      @subjects = Subject.where(id: Relation.select(:subject_id).where(student_id: @current_user.id))
    else
      @subjects = Subject.all
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    if @current_user
      @students = Student.where.not(id: Relation.select(:student_id).where(subject_id: @subject.id))
      @inscrits = Student.where(id: Relation.select(:student_id).where(subject_id: @subject.id))
    else
      redirect_to request.referrer || root_path
    end
  end

  # GET /subjects/new
  def new
    teacher_exclusive
		@subject = Subject.new
  end

 # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    teacher_exclusive
    @subject = Subject.create title: params[:title], start_date: params[:start_date], end_date: params[:end_date], teacher_id: @current_user.id
	

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'La matière a été insérée' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def exams
    @exams = Test.where(subject_id: @subject.id)
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update title: params[:title], start_date: params[:start_date], end_date: params[:end_date], teacher_id: @current_user.id
        format.html { redirect_to @subject, notice: 'La matière a été modifiée' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.delete
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'La matière a été supprimée' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:index, :new, :create, :show, :update, :delete)
    end
end
