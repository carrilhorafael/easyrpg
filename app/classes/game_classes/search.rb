class GameClasses::Search
  def initialize(current_player)
    @current_player = current_player
    @game_classes = all.flatten
  end

  def filter_by_params(params)
    filter_by_title(params[:title])
    filter_by_source(params[:source])
    filter_by_adventure(params[:adventure_id])
  end

  def result
    @game_classes
  end

  private

  def all
    [
      GameClasses::Templates::List.all,
      GameClass.where(creator: @current_player).map{|b| GameClasses::Parser.parse(b) }
    ]
  end

  def filter_by_title(title)
    @game_classes = @game_classes.select{|b| b.title.downcase.include?(title.downcase) } if title.present?
  end

  def filter_by_source(source)
    @game_classes = @game_classes.select{|b| b.source.downcase.include?(source.downcase) } if source.present?
  end

  def filter_by_adventure(adventure_id)
    @game_classes = @game_classes.select{|b| b.invalid_adventures.include?(adventure_id) } if adventure_id.present?
  end
end
