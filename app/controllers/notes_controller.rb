class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.create(note: params[:note], teacher_id: @current_user.id, student_id: params[:student_id], subject_id: params[:subject_id], test_id: params[:test_id])

    respond_to do |format|
      if @note.save
        format.html { redirect_to test_grade_path(params[:test_id]), notice: 'La note a été insérée' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html {redirect_to test_grade_path(params[:test_id]) }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update note: params[:note], teacher_id: @current_user.id, student_id: params[:student_id], subject_id: params[:subject_id], test_id: params[:test_id]
        format.html { redirect_to test_grade_path(params[:test_id]), notice: 'La note a été actualisée' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { test_grade_path(params[:test_id]) }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'La note a été suprimée' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.where(test_id: params[:test_id], student_id: params[:student_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:index, :new, :create, :show, :update, :delete)
    end
end
