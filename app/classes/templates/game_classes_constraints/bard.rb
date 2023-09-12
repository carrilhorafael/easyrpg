BARD = {
  title: 'Bard',
  source: 'Player\'s Handbook',
  description: 'An inspiring magician whose power echoes the music of creation',
  abilities_hint: 'Charisma and Dexterity',
  hit_dice: '1d8',
  proficiencies: {
    armor: ['Light armor'],
    weapons: ['Simple weapons', 'Hand crossbows', 'Longswords', 'Rapiers', 'Shortswords'],
    tools: ['Three musical instruments of your choice'],
    saving_throws: ['Dexterity', 'Charisma'],
    skills: {
      choose: 3,
      options: ['Acrobatics', 'Animal Handling', 'Arcana', 'Athletics', 'Deception', 'History', 'Insight', 'Intimidation', 'Investigation', 'Medicine', 'Nature', 'Perception', 'Performance', 'Persuasion', 'Religion', 'Sleight of Hand', 'Stealth', 'Survival']
    }
  },
  multiclassing: {
    prerequisites: {
      ability: 'Charisma',
      minimum: 13
    }
  },
  initial_equipment: {
    mandatory: [
      {
        choose: 1,
        options: [
          'Rapier',
          'Longsword',
          'Any simple weapon'
        ]
      },
      {
        choose: 1,
        options: [
          'Diplomat\'s Pack',
          'Entertainer\'s Pack'
        ]
      },
      {
        choose: 1,
        options: [
          'Lute',
          'Any musical instrument'
        ]
      },
      {
        item: 'Leather armor'
      },
      {
        item: 'Dagger'
      }
    ],
    gold_option: '5d4 * 10 gp'
  },
  spellcasting: {
    spellcaster_type: 'full',
    ability: 'charisma',
    cantrips_known: [2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4],
    spells_known: [4,5,6,7,8,9,10,11,12,14,15,15,16,18,19,19,20,22,22,22],
    spell_slots_per_level: {
      1 => [2,0,0,0,0,0,0,0,0],
      2 => [3,0,0,0,0,0,0,0,0],
      3 => [4,2,0,0,0,0,0,0,0],
      4 => [4,3,0,0,0,0,0,0,0],
      5 => [4,3,2,0,0,0,0,0,0],
      6 => [4,3,3,0,0,0,0,0,0],
      7 => [4,3,3,1,0,0,0,0,0],
      8 => [4,3,3,2,0,0,0,0,0],
      9 => [4,3,3,3,1,0,0,0,0],
      10 => [4,3,3,3,2,0,0,0,0],
      11 => [4,3,3,3,2,1,0,0,0],
      12 => [4,3,3,3,2,1,0,0,0],
      13 => [4,3,3,3,2,1,1,0,0],
      14 => [4,3,3,3,2,1,1,0,0],
      15 => [4,3,3,3,2,1,1,1,0],
      16 => [4,3,3,3,2,1,1,1,0],
      17 => [4,3,3,3,2,1,1,1,1],
      18 => [4,3,3,3,3,1,1,1,1],
      19 => [4,3,3,3,3,2,1,1,1],
      20 => [4,3,3,3,3,2,2,1,1]
    },
    ritual_caster: true
  },
  features: {
    1 => {
      'Bardic Inspiration': {
        description: 'You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6. Once within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes. The creature can wait until after it rolls the d20 before deciding to use the Bardic Inspiration die, but must decide before the DM says whether the roll succeeds or fails. Once the Bardic Inspiration die is rolled, it is lost. A creature can have only one Bardic Inspiration die at a time. You can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain any expended uses when you finish a long rest. Your Bardic Inspiration die changes when you reach certain levels in this class. The die becomes a d8 at 5th level, a d10 at 10th level, and a d12 at 15th level.',
      },
      'Spellcasting': {
        description: '
          You have learned to untangle and reshape the fabric of reality in harmony with your wishes and music. Your spells are part of your vast repertoire, magic that you can tune to different situations. See chapter 10 for the general rules of spellcasting and chapter 11 for the bard spell list.

          Cantrip
          At 1st level, you know two cantrips of your choice from the bard spell list. You learn additional bard cantrips of your choice at higher levels, as shown in the Cantrips Known column of the Bard table.

          Spell Slots
          The Bard table shows how many spell slots you have to cast your bard spells of 1st level and higher. To cast one of these spells, you must expend a slot of the spell\'s level or higher. You regain all expended spell slots when you finish a long rest.

          Spells Known of 1st Level and Higher
          You know four 1st-level spells of your choice from the bard spell list. You learn an additional bard spell of your choice at each level except 12th, 16th, 19th, and 20th. Each of these spells must be of a level for which you have spell slots. For instance, when you reach 3rd level in this class, you can learn one new spell of 1st or 2nd level. Additionally, when you gain a level in this class, you can choose one of the bard spells you know and replace it with another spell from the bard spell list, which also must be of a level for which you have spell slots.

          Spellcasting Ability
          Charisma is your spellcasting ability for your bard spells. Your magic comes from the heart and soul you pour into the performance of your music or oration. You use your Charisma whenever a spell refers to your spellcasting ability. In addition, you use your Charisma modifier when setting the saving throw DC for a bard spell you cast and when making an attack roll with one.

          Spell save DC = 8 + your proficiency bonus + your Charisma modifier
          Spell attack modifier = your proficiency bonus + your Charisma modifier

          Ritual Casting
          You can cast any bard spell you know as a ritual if that spell has the ritual tag.

          Spellcasting Focus
          You can use a musical instrument (found in chapter 5) as a spellcasting focus for your bard spells.
        '
      }
    },
    2 => {
      'Jack of All Trades': {
        description: 'Starting at 2nd level, you can add half your proficiency bonus, rounded down, to any ability check you make that doesn\'t already include your proficiency bonus.',
        bonus: 'proficiency / 2'
      },
      'Song of Rest': {
        description: 'Beginning at 2nd level, you can use soothing music or oration to help revitalize your wounded allies during a short rest. If you or any friendly creatures who can hear your performance regain hit points at the end of the short rest by spending one or more Hit Dice, each of those creatures regains an extra 1d6 hit points.',
      }
    },
    3 => {
      'Bard College': {
        description: 'At 3rd level, you delve into the advanced techniques of a bard college of your choice. Your choice grants you features at 3rd level and again at 6th and 14th level.',
      },
      'Expertise': {
        description: 'At 3rd level, choose two of your skill proficiencies. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies. At 10th level, you can choose another two skill proficiencies to gain this benefit.',
        selectable: true,
        type: 'expertise',
        options: 'skills_proficiencies'
      }
    },
    4 => {
      'Ability Score Improvement': {
        description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
        selectable: true,
        type: 'ability_score_improvement',
      }
    },
    5 => {
      'Font of Inspiration': {
        description: 'Beginning when you reach 5th level, you regain all of your expended uses of Bardic Inspiration when you finish a short or long rest.',
      },
    },
    6 => {
      'Countercharm': {
        description: 'At 6th level, you gain the ability to use musical notes or words of power to disrupt mind-influencing effects. As an action, you can start a performance that lasts until the end of your next turn. During that time, you and any friendly creatures within 30 feet of you have advantage on saving throws against being frightened or charmed. A creature must be able to hear you to gain this benefit. The performance ends early if you are incapacitated or silenced or if you voluntarily end it (no action required).',
      },
      'Bard College Feature': {
        description: 'At 6th level, you delve into the advanced techniques of a bard college of your choice. Your choice grants you features at 3rd level and again at 6th and 14th level.',
      }
    },
    7 => {},
    8 => {
      'Ability Score Improvement': {
        description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
        selectable: true,
        type: 'ability_score_improvement',
      }
    },
    9 => {},
    10 => {
      'Magical Secrets': {
        description: 'At 10th level, choose two additional spells from any classes, including this one. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip. The chosen spells count as bard spells for you and are included in the number in the Spells Known column of the Bard table.',
      }
    },
    11 => {},
    12 => {
      'Ability Score Improvement': {
        description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
        selectable: true,
        type: 'ability_score_improvement'
      }
    },
    13 => {},
    14 => {
      'Magical Secrets': {
        description: 'At 14th level, choose two additional spells from any classes, including this one. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip. The chosen spells count as bard spells for you and are included in the number in the Spells Known column of the Bard table.',
      },
      'Bard College Feature': {
        description: 'At 6th level, you delve into the advanced techniques of a bard college of your choice. Your choice grants you features at 3rd level and again at 6th and 14th level.',
      }
    },
    15 => {},
    16 => {
      'Ability Score Improvement': {
        description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
        selectable: true,
        type: 'ability_score_improvement'
      }
    },
    17 => {},
    18 => {
      'Magical Secrets': {
        description: 'At 18th level, choose two additional spells from any classes, including this one. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip. The chosen spells count as bard spells for you and are included in the number in the Spells Known column of the Bard table.',
      },
      'Spell Mastery': {
        description: 'At 18th level, you have achieved such mastery over certain spells that you can cast them at will. Choose a 1st-level bard spell and a 2nd-level bard spell that are in your spellbook. You can cast those spells at their lowest level without expending a spell slot when you have them prepared. If you want to cast either spell at a higher level, you must expend a spell slot as normal.',
      }
    },
    19 => {
      'Ability Score Improvement': {
        description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
        selectable: true,
        type: 'ability_score_improvement'
      }
    },
    20 => {
      'Superior Inspiration': {
        description: 'At 20th level, when you roll initiative and have no uses of Bardic Inspiration left, you regain one use.',
      }
    }
  },
  subclasses: {
    name: 'Bard College',
    level: 3,
    options: [
      {
        name: 'College of Lore',
        source: 'Player\'s Handbook',
        description: 'Bards of the College of Lore know something about most things, collecting bits of knowledge from sources as diverse as scholarly tomes and peasant tales.',
        features: {
          3 => {
            'Bonus Proficiencies': {
              description: 'When you join the College of Lore at 3rd level, you gain proficiency with three skills of your choice.',
              selectable: true,
              type: 'proficiency',
              choose: 3,
              options: 'skills'
            },
            'Cutting Words': {
              description: "
                Also at 3rd level, you learn how to use your wit to distract, confuse, and otherwise sap the confidence and competence of others. When a creature that you can see within 60 feet of you makes an attack roll, an ability check, or a damage roll, you can use your reaction to expend one of your uses of Bardic Inspiration, rolling a Bardic Inspiration die and subtracting the number rolled from the creature's roll. You can choose to use this feature after the creature makes its roll, but before the DM determines whether the attack roll or ability check succeeds or fails, or before the creature deals its damage. The creature is immune if it can't hear you or if it's immune to being charmed.
              "
            },
          },
          6 => {
            'Additional Magical Secrets': {
              description: 'At 6th level, you learn two spells of your choice from any class. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip. The chosen spells count as bard spells for you and are included in the number in the Spells Known column of the Bard table.',
            }
          },
          14 => {
            'Peerless Skill': {
              description: 'Starting at 14th level, when you make an ability check, you can expend one use of Bardic Inspiration. Roll a Bardic Inspiration die and add the number rolled to your ability check. You can choose to do so after you roll the die for the ability check, but before the DM tells you whether you succeed or fail.'
            }
          }
        }
      }
    ]
  }
}
