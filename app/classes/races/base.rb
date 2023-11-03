class Races::Base
  attr_accessor :title, :description, :source, :proficiencies, :initial_equipment, :features

  def format
    self.as_json
  end

  def invalid_adventures
    []
  end
end
