class TalentsController < ApplicationController
  before_action :set_talent, only: [:show, :update, :destroy]

  # GET /talents
  def index
    @talents = Talent.all

    render json: @talents
  end

  # GET /talents/1
  def show
    render json: @talent
  end

  # POST /talents
  def create
    @talent = Talent.new(talent_params.as_json)

    if @talent.save
      render json: @talent, status: :created, location: @talent
    else
      render json: @talent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /talents/1
  def update
    if @talent.update(talent_params.as_json)
      render json: @talent
    else
      render json: @talent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /talents/1
  def destroy
    @talent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talent
      @talent = Talent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def talent_params
      params.require(:talent)
    end
end
