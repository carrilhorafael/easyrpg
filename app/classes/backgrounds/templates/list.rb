class Backgrounds::Templates::List
  def self.all
    [
      Backgrounds::Templates::Charlatan.new,
      Backgrounds::Templates::Researcher.new,
    ]
  end
end
