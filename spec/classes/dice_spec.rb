require 'rails_helper'

RSpec.describe "Dice" do
  describe "parse" do
    it "returns a hash with count and sides" do
      expect(Dice.parse("1d6")).to eq({ count: 1, sides: 6 })
    end

    it "returns a hash with count, sides, and modifier" do
      expect(Dice.parse("1d6+1")).to eq({ count: 1, sides: 6, modifier: 1 })
    end

    it "raises an error if the dice string is invalid" do
      expect { Dice.parse("1d7") }.to raise_error(ArgumentError)
    end
  end

  describe "roll" do
    it "returns an array of integers" do
      expect(Dice.new("1d6").roll).to all(be_an(Integer))
    end

    it "returns an array of integers between 1 and the number of sides" do
      expect(Dice.new("1d6").roll).to all(be_between(1, 6))
    end

    it "returns an array of integers with the same number of elements as the count" do
      expect(Dice.new("3d6").roll.size).to eq(3)
    end
  end

  describe "modifier" do
    it "returns 0 if there is no modifier" do
      expect(Dice.new("1d6").modifier).to eq(0)
    end

    it "returns the modifier if there is one" do
      expect(Dice.new("1d6+1").modifier).to eq(1)
    end
  end

  describe "reset" do
    it "resets the roll" do
      dice = Dice.new("1d6")
      expect(dice.roll).to eq(dice.roll)
      dice.reset
      expect(dice.instance_values["roll"]).to be_nil
    end
  end

  describe "roll_and_modifier_sum" do
    it "returns an integer" do
      expect(Dice.new("1d6").roll_and_modifier_sum).to be_an(Integer)
    end

    it "returns an integer between 1 and the number of sides" do
      expect(Dice.new("1d6").roll_and_modifier_sum).to be_between(1, 6)
    end

    it "returns an integer with the same number of elements as the count" do
      expect(Dice.new("3d6").roll_and_modifier_sum).to be_between(3, 18)
    end

    it "returns an integer with the modifier added" do
      expect(Dice.new("1d6+1").roll_and_modifier_sum).to be_between(2, 7)
    end

    it "returns an integer with the modifier subtracted" do
      expect(Dice.new("1d6-1").roll_and_modifier_sum).to be_between(0, 5)
    end
  end
end
