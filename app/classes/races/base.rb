class Races::Base
  attr_accessor :title, :source, :normal_size, :languages, :only_subraces,
                :caracteristics, :speeds, :features, :abilities

  def format
    self.as_json
  end

  def invalid_adventures
    []
  end
end
