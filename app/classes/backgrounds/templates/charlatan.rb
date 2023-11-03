class Backgrounds::Templates::Charlatan < Backgrounds::Base
  def initialize
    @title = 'Charlatan'
    @description = "You have always had a way with people. You know what makes them tick, you can tease out their hearts’ desires after a few minutes of conversation, and with a few leading questions you can read them like they were children’s books. It’s a useful talent, and one that you’re perfectly willing to use for your advantage."
    @source = 'Dungeon World SRD'
    @proficiencies = {
      skills: {
        mandatory: ["Deception", "Sleight of Hand"],
      },
      tools: {
        mandatory: ["Disguise kit", "Forgery kit"],
      }
    }
    @initial_equipment = {
      mandatory: [
        {
          item: 'Fine clothes'
        },
        {
          item: 'Disguise kit'
        },
        {
          item: 'Playing cards'
        },
        {
          coins: 15,
          type: 'gold'
        }
      ]
    }
    @features = {
      "False Identity" => "You have created a second identity that includes documentation, established acquaintances, and disguises that allow you to assume that persona. Additionally, you can forge documents including official papers and personal letters, as long as you have seen an example of the kind of document or the handwriting you are trying to copy."
    }
    @invalid_adventures = []
  end

end
