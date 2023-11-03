class Races::Custom < Races::Base
  def initialize(
      title:,
      source:,
      only_subraces:,
      normal_size:,
      caracteristics:,
      abilities:,
      speeds:,
      languages:,
      features:,
      invalid_adventures:
    )
    @title = title
    @source = source
    @only_subraces = only_subraces
    @normal_size = normal_size
    @caracteristics = caracteristics
    @abilities = abilities
    @speeds = speeds
    @languages = languages
    @features = features
    @invalid_adventures = invalid_adventures || []
  end

  def invalid_adventures
    @invalid_adventures
  end
end
