class Races::Templates::List
  def self.all
    [
      Races::Templates::Elf.new,
      Races::Templates::Dwarf.new,
    ]
  end
end
