class DteDirectionsController < ApplicationController
  before_action :set_dte_direction, only: [:show, :edit, :update, :destroy]

  # GET /dte_directions
  # GET /dte_directions.json
  def index
    @dte_directions = DteDirection.all
  end

  # GET /dte_directions/1
  # GET /dte_directions/1.json
  def show
  end

  # GET /dte_directions/new
  def new
    @dte_direction = DteDirection.new
  end

  # GET /dte_directions/1/edit
  def edit
  end

  # POST /dte_directions
  # POST /dte_directions.json
  def create
    @dte_direction = DteDirection.new(dte_direction_params)

    respond_to do |format|
      if @dte_direction.save
        format.html { redirect_to @dte_direction, notice: 'Dte direction was successfully created.' }
        format.json { render :show, status: :created, location: @dte_direction }
      else
        format.html { render :new }
        format.json { render json: @dte_direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dte_directions/1
  # PATCH/PUT /dte_directions/1.json
  def update
    respond_to do |format|
      if @dte_direction.update(dte_direction_params)
        format.html { redirect_to @dte_direction, notice: 'Dte direction was successfully updated.' }
        format.json { render :show, status: :ok, location: @dte_direction }
      else
        format.html { render :edit }
        format.json { render json: @dte_direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dte_directions/1
  # DELETE /dte_directions/1.json
  def destroy
    @dte_direction.destroy
    respond_to do |format|
      format.html { redirect_to dte_directions_url, notice: 'Dte direction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dte_direction
      @dte_direction = DteDirection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dte_direction_params
      params.require(:dte_direction).permit(:direction, :user_id, :direction_id)
    end
end
