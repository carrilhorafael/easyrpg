class BackstoriesController < ApplicationController
  before_action :set_backstory, only: [:show, :update, :destroy]

  # GET /backstories
  def index
    @backstories = Backstory.all

    render json: @backstories
  end

  # GET /backstories/1
  def show
    render json: @backstory
  end

  # POST /backstories
  def create
    action = Backstory::Create.call(performer: @current_player, backstory_params: backstory_params)

    if action.success?
      render json: action.backstory, status: :created
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /backstories/1
  def update
    action = Backstory::Update.call(performer: @current_player, backstory: @backstory, backstory_params: backstory_params)

    if action.success?
      render json: action.backstory
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /backstories/1
  def destroy
    @backstory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backstory
      @backstory = @current_player.backstories.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def backstory_params
      params.require(:backstory).permit!
    end
end
