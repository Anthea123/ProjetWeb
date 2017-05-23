class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy, :grade]

  # GET /tests
  # GET /tests.json
  def index
    if @current_user
      if @current_user.teacher?
        @tests = Test.where(teacher_id: @current_user.id)
      elsif @current_user.student?
        @tests = Test.where(subject_id: Relation.select(:subject_id).where(student_id: @current_user.id))
      else
        @tests = Test.all
      end      
    else
      redirect_to request.referrer || root_path
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    if @current_user.student?
      if !@note = Note.where(student_id: @current_user.id, test_id: @test.id).first
        @message = "Pas de note"
      end  
    end
  end

  # GET /tests/new
  def new
    teacher_exclusive
    @test = Test.new
    @subjects = Subject.where(teacher_id: @current_user.id)
  end

  # GET /tests/1/edit
  def edit
    teacher_exclusive
  end

  # POST /tests
  # POST /tests.json
  def create
    teacher_exclusive
    @test = Test.create title: params[:title], test_date: params[:test_date], subject_id: params[:subject_id],teacher_id: @current_user.id

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: "L'épreuve a été créée"}
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    teacher_exclusive
    respond_to do |format|
      if @test.update title: params[:title], test_date: params[:test_date], teacher_id: @current_user.id
        format.html { redirect_to @test, notice: "L'épreuve a été modifiée" }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def grade
    teacher_exclusive
    @note = Note.new
    @relation = Relation.select("student_id").where(subject_id: @test.subject_id)
    @students = Student.where(id: @relation).order(:surname)
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    teacher_exclusive
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: "L'épreuve a été supprimée" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:index, :new, :create, :show, :update, :delete)
    end
end
