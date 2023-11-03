class Backgrounds::Custom < Backgrounds::Base
  def initialize(title:, description:, source:, proficiencies:, initial_equipment:, features:, invalid_adventures:)
    @title = title
    @description = description
    @source = source
    @proficiencies = proficiencies
    @initial_equipment = initial_equipment
    @features = features
    @invalid_adventures = invalid_adventures || []
  end

  def invalid_adventures
    @invalid_adventures
  end
end
