class BackgroundsController < ApplicationController
  before_action :set_background, only: [:show, :update, :destroy]

  # GET /backgrounds
  def index
    @backgrounds = Backgrounds::Search.new(@current_player).filter_by_params(search_params).result

    render json: @backgrounds, each_serializer: BackgroundSerializer
  end

  # GET /backgrounds/1
  def show
    render json: @background
  end

  # POST /backgrounds
  def create
    action = Background::Create.call(performer: @current_player, background_params: background_params)

    if action.success?
      render json: action.background, status: :created
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /backgrounds/1
  def update
    action = Background::Update.call(performer: @current_player, background: @background, background_params: background_params)

    if action.success?
      render json: action.background
    else
      render json: action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /backgrounds/1
  def destroy
    @background.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_background
      @background = @current_player.backgrounds.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def background_params
      params.require(:background).permit!
    end

    def search_params
      params.permit(:name, :source, :adventure_id)
    end
end
