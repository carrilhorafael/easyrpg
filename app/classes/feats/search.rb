class Feats::Search
  def initialize(current_player)
    @current_player = current_player
    @feats = all.flatten
  end

  def filter_by_params(params)
    filter_by_title(params[:title])
    filter_by_source(params[:source])
    filter_by_adventure(params[:adventure_id])

    self
  end

  def result
    @feats
  end

  private

  def all
    [
      Feats::Templates::List.all,
      Talent.where(creator: @current_player).map{|b| Feats::Parser.parse(b) }
    ]
  end

  def filter_by_title(title)
    @feats = @feats.select{|b| b.title.downcase.include?(title.downcase) } if title.present?
  end

  def filter_by_source(source)
    @feats = @feats.select{|b| b.source.downcase.include?(source.downcase) } if source.present?
  end

  def filter_by_adventure(adventure_id)
    @feats = @feats.select{|b| b.invalid_adventures.include?(adventure_id) } if adventure_id.present?
  end
end
