class Feats::Base
  attr_accessor :title, :prerequisites, :features

  def format
    self.as_json
  end

  def invalid_adventures
    []
  end
end
