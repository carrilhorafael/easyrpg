const SYSTEMS = {
  DND5E: {
    name: "Dungeons & Dragons 5e",
    data: {
      abilities: [
        { name: 'Strength', default: 10, mod_formula: 'floor((value - 10) / 2)' },
        { name: 'Dexterity', default: 10, mod_formula: 'floor((value - 10) / 2)' },
        { name: 'Constitution', default: 10, mod_formula: 'floor((value - 10) / 2)' },
        { name: 'Intelligence', default: 10, mod_formula: 'floor((value - 10) / 2)' },
        { name: 'Wisdom', default: 10, mod_formula: 'floor((value - 10) / 2)' },
        { name: 'Charisma', default: 10, mod_formula: 'floor((value - 10) / 2)' }
      ],
      skills: [
        { name: 'Acrobatics', ability: 'Dexterity' },
        { name: 'Animal Handling', ability: 'Wisdom' },
        { name: 'Arcana', ability: 'Intelligence' },
        { name: 'Athletics', ability: 'Strength' },
        { name: 'Deception', ability: 'Charisma' },
        { name: 'History', ability: 'Intelligence' },
        { name: 'Insight', ability: 'Wisdom' },
        { name: 'Intimidation', ability: 'Charisma' },
        { name: 'Investigation', ability: 'Intelligence' },
        { name: 'Medicine', ability: 'Wisdom' },
        { name: 'Nature', ability: 'Intelligence' },
        { name: 'Perception', ability: 'Wisdom' },
        { name: 'Performance', ability: 'Charisma' },
        { name: 'Persuasion', ability: 'Charisma' },
        { name: 'Religion', ability: 'Intelligence' },
        { name: 'Sleight of Hand', ability: 'Dexterity' },
        { name: 'Stealth', ability: 'Dexterity' },
        { name: 'Survival', ability: 'Wisdom' }
      ]
    }
  }
}

export default SYSTEMS;
