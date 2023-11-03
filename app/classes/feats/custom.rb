class Feats::Custom < Feats::Base
  def initialize(
      title:,
      prerequisites:,
      features:,
      invalid_adventures:
    )
    @title = title
    @prerequisites = prerequisites
    @features = features
    @invalid_adventures = invalid_adventures || []
  end

  def invalid_adventures
    @invalid_adventures
  end
end
