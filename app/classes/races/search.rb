class Races::Search
  def initialize(current_player)
    @current_player = current_player
    @races = all.flatten
  end

  def filter_by_params(params)
    filter_by_title(params[:title])
    filter_by_source(params[:source])
    filter_by_adventure(params[:adventure_id])

    self
  end

  def result
    @races
  end

  private

  def all
    [
      Races::Templates::List.all,
      Race.where(creator: @current_player).map{|b| Races::Parser.parse(b) }
    ]
  end

  def filter_by_title(title)
    @races = @races.select{|b| b.title.downcase.include?(title.downcase) } if title.present?
  end

  def filter_by_source(source)
    @races = @races.select{|b| b.source.downcase.include?(source.downcase) } if source.present?
  end

  def filter_by_adventure(adventure_id)
    @races = @races.select{|b| b.invalid_adventures.include?(adventure_id) } if adventure_id.present?
  end
end
