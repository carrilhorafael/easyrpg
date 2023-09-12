BARBARIAN = {
  title: 'Barbarian',
  source: 'Player\'s Handbook',
  description: 'A fierce warrior of primitive background who can enter a battle rage',
  abilities_hint: 'Strength and Constitution',
  hit_dice: '1d12',
  proficiencies: {
    armor: ['Light armor', 'Medium armor', 'Shields'],
    weapons: ['Simple weapons', 'Martial weapons'],
    tools: [],
    saving_throws: ['Strength', 'Constitution'],
    skills: {
      choose: 2,
      options: ['Animal Handling', 'Athletics', 'Intimidation', 'Nature', 'Perception', 'Survival']
    }
  },
  multiclassing: {
    prerequisites: {
      ability: 'Strength',
      minimum: 13
    },
    proficiencies_gained: {
      armor: ['Light armor', 'Medium armor', 'Shields'],
      weapons: ['Simple weapons', 'Martial weapons']
    }
  },
  initial_equipment: {
    mandatory: [
      {
        choose: 1,
        options: [
          'Greataxe',
          'Any martial melee weapon'
        ]
      },
      {
        choose: 1,
        options: [
          'Two handaxes',
          'Any simple weapon'
        ]
      },
      {
        item: 'Explorer\'s Pack'
      },
      {
        item: 'Javelins'
      }
    ],
    gold_option: '2d4 * 10 gp'
  },
  spellcasting: nil,
  features: {
    1 => {
      'Rage': {
        description: 'In battle, you fight with primal ferocity. On your turn, you can enter a rage as a bonus action.',
      },
      'Unarmored Defense': {
        description: 'While you are not wearing any armor, your Armor Class equals 10 + your Dexterity modifier + your Constitution modifier. You can use a shield and still gain this benefit.'
      }
    },
    2 => {
      'Danger Sense': {
        description: 'You gain an uncanny sense of when things nearby aren\'t as they should be, giving you an edge when you dodge away from danger. You have advantage on Dexterity saving throws against effects that you can see, such as traps and spells. To gain this benefit, you can\'t be blinded, deafened, or incapacitated.'
      },
      'Reckless Attack': {
        description: 'When you make your first attack on your turn, you can decide to attack recklessly. Doing so gives you advantage on melee weapon attack rolls using Strength during this turn, but attack rolls against you have advantage until your next turn.'
      }
    },
    3 => {
      'Primal Path': {
        description: 'At 3rd level, you choose a path that shapes the nature of your rage. Your choice grants you features at 3rd level and again at 6th, 10th, and 14th levels.'
      },
      'Knowlege of the Ages': {
        optional: true,
        description: 'You receive proficiency in a skills of your choice within the following list: Animal Handling, Athletics, Intimidation, Nature, Perception, Survival',
        selectable: true,
        type: 'proficiency',
        options: ['Animal Handling', 'Athletics', 'Intimidation', 'Nature', 'Perception', 'Survival']
      }
    },
    4 => {
      'Ability Score Improvement': {
        description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
        selectable: true,
        type: 'ability_score_improvement'
      }
    },
    5 => {
      'Extra Attack': {
        description: 'Beginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn.'
      },
      'Fast Movement': {
        description: 'Your speed increases by 10 feet while you aren\'t wearing heavy armor.'
      }
    },
    6 => {
      'Path Feature': {
        description: 'At 6th level, you gain a feature based on the path you choose at 3rd level.'
      }
    },
    7 => {
      'Feral Instinct': {
        description: 'By 7th level, your instincts are so honed that you have advantage on initiative rolls.'
      }
    },
    8 => {
      'Ability Score Improvement': {
        description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
        selectable: true,
        type: 'ability_score_improvement'
      }
    },
    9 => {
      'Brutal Critical': {
        description: 'Beginning at 9th level, you can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack.',
      }
    },
    10 => {
      'Path Feature': {
        description: 'At 10th level, you gain a feature based on the path you choose at 3rd level.'
      },
      'Knowlege of the Ages': {
        optional: true,
        description: 'You receive proficiency in a skill of your choice within the following list: Animal Handling, Athletics, Intimidation, Nature, Perception, Survival',
        selectable: true,
        type: 'proficiency',
        options: ['Animal Handling', 'Athletics', 'Intimidation', 'Nature', 'Perception', 'Survival']
      }
    },
    11 => {
      'Relentless Rage': {
        description: 'Starting at 11th level, your rage can keep you fighting despite grievous wounds. If you drop to 0 hit points while you\'re raging and don\'t die outright, you can make a DC 10 Constitution saving throw. If you succeed, you drop to 1 hit point instead. Each time you use this feature after the first, the DC increases by 5. When you finish a short or long rest, the DC resets to 10.',
      }
    },
    12 => {
      'Ability Score Improvement': {
        description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
        selectable: true,
        type: 'ability_score_improvement'
      }
    },
    13 => {
      'Brutal Critical': {
        description: 'Beginning at 13th level, you can roll two additional weapon damage dice when determining the extra damage for a critical hit with a melee attack.',
      }
    },
    14 => {
      'Path Feature': {
        description: 'At 14th level, you gain a feature based on the path you choose at 3rd level'
      }
    },
    15 => {
      'Persistent Rage': {
        description: 'Beginning at 15th level, your rage is so fierce that it ends early only if you fall unconscious or if you choose to end it.'
      }
    },
    16 => {
      'Ability Score Improvement': {
        description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score',
        selectable: true,
        type: 'ability_score_improvement'
      }
    },
    17 => {
      'Brutal Critical': {
        description: 'Beginning at 17th level, you can roll three additional weapon damage dice when determining the extra damage for a critical hit with a melee attack.',
      }
    },
    18 => {
      'Indomitable Might': {
        description: 'Beginning at 18th level, if your total for a Strength check is less than your Strength score, you can use that score in place of the total.'
      }
    },
    19 => {
      'Ability Score Improvement': {
        description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score',
        selectable: true,
        type: 'ability_score_improvement'
      }
    },
    20 => {
      'Primal Champion': {
        description: 'At 20th level, you embody the power of the wilds. Your Strength and Constitution scores increase by 4. Your maximum for those scores is now 24.'
      },
      'Legendary Rage': {
        description: "
          While you're raging, you gain the some benefits:

          - You have resistance to bludgeoning, piercing, and slashing damage.
          - When you drop a creature to 0 hit points with a melee weapon attack on your turn, you can move half of your Move Speed and make 2 another melee weapon attacks.
          - Once per turn, you can reroll a failed Strength, Dexerity, or Constitution saving throw. If you do so, you must use the new roll.
          - Your max hit points cannot be reduced.
          - When you is dropped to 0 hit points, you can use your reaction to make a melee weapon attack. If you hit, you drop to 1 hit point instead.
        "
      }
    }
  },
  subclasses: {
    name: 'Primal Paths',
    level: 3,
    options: [
      {
        name: 'Path of the Berserker',
        source: 'PHB',
        description: 'Bersekers are warriors who channel their rage to become stronger, more resilient and more ferocious in combat.',
        features: {
          3 => {
            'Frenzy': {
              description: 'Starting when you choose this path at 3rd level, you can go into a frenzy when you rage. If you do so, for the duration of your rage you can make a single melee weapon attack as a bonus action on each of your turns after this one. When your rage ends, you suffer one level of exhaustion.'
            }
          },
          6 => {
            'Mindless Rage': {
              description: 'Beginning at 6th level, you can\'t be charmed or frightened while raging. If you are charmed or frightened when you enter your rage, the effect is suspended for the duration of the rage.'
            }
          },
          10 => {
            'Intimidating Presence': {
              description: "
                Beginning at 10th level, you can use your action to frighten someone with your menacing presence. When you do so, choose one creature that you can see within 30 feet of you. If the creature can see or hear you, it must succeed on a Wisdom saving throw (DC equal to 8 + your proficiency bonus + your Charisma modifier) or be frightened of you until the end of your next turn. On subsequent turns, you can use your action to extend the duration of this effect on the frightened creature until the end of your next turn. This effect ends if the creature ends its turn out of line of sight or more than 60 feet away from you.

                If the creature succeeds on its saving throw, you can't use this feature on that creature again for 24 hours.
              "
            }
          },
          14 => {
            'Retaliation': {
              description: 'Starting at 14th level, when you take damage from a creature that is within 5 feet of you, you can use your reaction to make a melee weapon attack against that creature.'
            }
          }
        }
      }
    ]
  }
}
