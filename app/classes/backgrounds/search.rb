class Backgrounds::Search
  def initialize(current_player)
    @current_player = current_player
    @backgrounds = all.flatten
  end

  def filter_by_params(params)
    filter_by_title(params[:title])
    filter_by_source(params[:source])
    filter_by_adventure(params[:adventure_id])

    self
  end

  def result
    @backgrounds
  end

  private

  def all
    [
      Backgrounds::Templates::List.all,
      Background.where(creator: @current_player).map{|b| Backgrounds::Parser.parse(b) }
    ]
  end

  def filter_by_title(title)
    @backgrounds = @backgrounds.select{|b| b.title.downcase.include?(title.downcase) } if title.present?
  end

  def filter_by_source(source)
    @backgrounds = @backgrounds.select{|b| b.source.downcase.include?(source.downcase) } if source.present?
  end

  def filter_by_adventure(adventure_id)
    @backgrounds = @backgrounds.select{|b| b.invalid_adventures.include?(adventure_id) } if adventure_id.present?
  end
end
