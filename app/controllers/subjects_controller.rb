class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    teacher_exclusive
		@subjects = Subject.where(teacher_id: @current_user.id)
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    if @current_user
      @students = Student.all
      @relations = Relation.where(subject: @subject.id)
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
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update title: params[:title], start_date: params[:start_date], end_date: params[:end_date], teacher_id: @current_user.id
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
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
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
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
