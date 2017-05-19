class RelationsController < ApplicationController
  before_action :set_relation, only: [:show, :edit, :update, :destroy]

  # GET /relations
  # GET /relations.json
  def index
    @relations = Relation.all
  end

  # GET /relations/1
  # GET /relations/1.json
  def show
  end

  # GET /relations/new
  def new
    @relation = Relation.new
  end

  # GET /relations/1/edit
  def edit
  end

  # POST /relations
  # POST /relations.json
  def create
    @relation = Relation.create student_id: params[:student_id], subject_id: params[:subject_id]
    if @relation.save
      redirect_to subject_path(params[:subject_id])
    end
  end

  # PATCH/PUT /relations/1
  # PATCH/PUT /relations/1.json
  def update
    respond_to do |format|
      if @relation.update(relation_params)
        format.html { redirect_to @relation, notice: 'Relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @relation }
      else
        format.html { render :edit }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relations/1
  # DELETE /relations/1.json
  def destroy
    @relation.delete
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Relation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation
      @relation = Relation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relation_params
      params.require(:relation).permit(:index, :new, :create, :show, :update, :delete)
    end
end
