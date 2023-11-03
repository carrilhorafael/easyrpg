class Races::Base
  attr_accessor :title, :source, :normal_size, :proficiencies, :only_subraces,
                :caracteristics, :speeds, :features

  def format
    self.as_json
  end

  def invalid_adventures
    []
  end
end
