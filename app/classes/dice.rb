class Dice
  REGEX = /(\d+)d(\d+)/
  REGEX_WITH_MODIFIER = /(\d+)d(\d+)([+-]\d+)/
  TYPES = [4, 6, 8, 10, 12, 20, 100]

  def initialize(dice_string) # "1d6"
    @dice = Dice.parse(dice_string)
  end

  def roll
    @dice[:count].times.map { rand(1..@dice[:sides]) }
  end

  def modifier
    @dice[:modifier] || 0
  end

  def roll_and_sum
    roll.sum + modifier
  end

  def self.parse(dice_string)
    if dice_string =~ REGEX_WITH_MODIFIER && TYPES.include?($2.to_i) && $3.to_i != 0
      { count: $1.to_i, sides: $2.to_i, modifier: $3.to_i }
    elsif dice_string =~ REGEX && TYPES.include?($2.to_i)
      { count: $1.to_i, sides: $2.to_i }
    else
      raise ArgumentError, "Invalid dice string: #{dice_string}"
    end
  end
end
