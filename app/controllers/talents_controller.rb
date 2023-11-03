class TalentsController < ApplicationController
  before_action :set_talent, only: [:show, :update, :destroy]

  # GET /talents
  def index
    @talents = Feats::Search.new(@current_player).filter_by_params(search_params).result

    render json: @talents
  end

  # GET /talents/1
  def show
    render json: @talent
  end

  # POST /talents
  def create
    action = Talent::Create.call(performer: @current_player, talent_params: talent_params)

    if action.success?
      render json: action.talent, status: :created
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /talents/1
  def update
    action = Talent::Update.call(talent: @talent, performer: @current_player, talent_params: talent_params)

    if action.success?
      render json: action.talent
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /talents/1
  def destroy
    @talent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talent
      @talent = @current_player.talents.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def talent_params
      params.require(:talent).permit!
    end

    def search_params
      params.permit(:title, :source, :adventure_id)
    end
end
