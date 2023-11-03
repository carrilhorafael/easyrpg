class GameClasses::Templates::Cleric < GameClasses::Base
  def initialize
    @title = 'Cleric',
    @source = 'Player\'s Handbook'
    @description = 'A priestly champion who wields divine magic in service of a higher power'
    @abilities_hint = 'Wisdom fuels Cleric spells. Since they sometimes have a front line role in combat as well, Clerics benefit from high Strength and Constitution.'
    @hit_dice = '1d8'
    @proficiencies = {
      armor: ['Light armor', 'Medium armor', 'Shields'],
      weapons: ['Simple weapons'],
      tools: [],
      saving_throws: ['Wisdom', 'Charisma'],
      skills: {
        choose: 2,
        options: ['History', 'Insight', 'Medicine', 'Persuasion', 'Religion']
      }
    }
    @multiclassing = {
      prerequisites: {
        ability: 'Wisdom',
        minimum: 13
      }
    }
    @initial_equipment = {
      mandatory: [
        {
          choose: 1,
          options: [
            'Mace',
            'Warhammer'
          ]
        },
        {
          choose: 1,
          options: [
            'Scale mail',
            'Leather armor',
            'Chain mail'
          ]
        },
        {
          choose: 1,
          options: [
            'Light crossbow and 20 bolts',
            'Any simple weapon'
          ]
        },
        {
          choose: 1,
          options: [
            'Priest\'s Pack',
            'Explorer\'s Pack'
          ]
        },
        {
          item: 'Shield'
        },
        {
          item: 'Holy Symbol'
        }
      ],
      gold_option: '5d4 * 10gp'
    }
    @spellcasting = {
      spellcaster_type: 'full',
      ability: 'wisdom',
      cantrips_known: [3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5],
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
      ritual_caster: true,
      prepared_spells: 'wisdom modifier + cleric level / 2 rounded down',
      ritual_unprepared_spells: false
    }
    @features = {
      1 => {
        'Spellcasting': {
          description: '
            As a conduit for divine power, you can cast Cleric Spells.

            Cantrips
            At 1st level, you know three Cantrips of your choice from the Cleric spell list. You learn additional Cleric Cantrips of your choice at higher levels, as shown in the Cantrips Known column of the Cleric table.

            Preparing and Casting Spells
            The Cleric table shows how many Spell Slots you have to cast your Spells of 1st level and higher. To cast one of these Spells, you must expend a slot of the spell\'s level or higher. You regain all expended Spell Slots when you finish a Long Rest. You prepare the list of Cleric Spells that are available for you to cast, choosing from the Cleric spell list. When you do so, choose a number of Cleric Spells equal to your Wisdom modifier + your Cleric level (minimum of one spell). The Spells must be of a level for which you have Spell Slots. For example, if you are a 3rd-level Cleric, you have four 1st-level and two 2nd-level Spell Slots. With a Wisdom of 16, your list of prepared Spells can include six Spells of 1st or 2nd level, in any combination. If you prepare the 1st-level spell Cure Wounds, you can cast it using a 1st-level or 2nd-level slot. Casting the spell doesn\'t remove it from your list of prepared Spells.

            Spellcasting Ability
            Wisdom is your Spellcasting Ability for your Cleric Spells, since their power derives from the devotion to your deity. You use your Wisdom whenever a Cleric spell refers to your Spellcasting Ability. In addition, you use your Wisdom modifier when Setting the saving throw DC for a Cleric spell you cast and when Making an Attack roll with one.

            Spell save DC = 8 + your proficiency bonus + your Wisdom modifier
            Spell attack modifier = your proficiency bonus + your Wisdom modifier

            Ritual Casting
            You can cast a Cleric spell as a ritual if that spell has the ritual tag and you have the spell prepared.

            Spellcasting Focus
            You can use a holy Symbol (see "Equipment") as a Spellcasting focus for your Cleric Spells.
          '
        },
        'Divine Domain': {
          description: 'Choose one domain related to your deity from the list of available domains. Each domain is detailed in their own feature, and each one provides examples of gods associated with it. Your choice grants you domain spells and other features when you choose it at 1st level. It also grants you additional ways to use Channel Divinity when you gain that feature at 2nd level, and additional benefits at 6th, 8th, and 17th levels.'
        },
        'Domain Spells': {
          description: 'Each domain has a list of spells - its domain spells - that you gain at the Cleric levels noted in the domain description. Once you gain a domain spell, you always have it prepared, and it doesn\'t count against the number of Spells you can prepare each day. If you have a domain spell that doesn\'t appear on the Cleric spell list, the spell is nonetheless a Cleric spell for you.'
        }
      },
      2 => {
        'Channel Divinity': {
          description: 'At 2nd level, you gain the ability to channel divine energy directly from your deity, using that energy to fuel magical effects. You start with two such effects: Turn Undead and an effect determined by your domain. Some domains grant you additional effects as you advance in levels, as noted in the domain description.

          When you use your Channel Divinity, you choose which effect to create. You must then finish a short or long rest to use your Channel Divinity again.

          Some Channel Divinity effects require saving throws. When you use such an effect from this class, the DC equals your cleric spell save DC.

          Beginning at 6th level, you can use your Channel Divinity twice between rests, and beginning at 18th level, you can use it three times between rests. When you finish a short or long rest, you regain your expended uses.',
        },
        'Channel Divinity: Turn Undead': {
          description: 'As an action, you present your holy Symbol and speak a prayer censuring the Undead. Each Undead that can see or hear you within 30 feet of you must make a Wisdom saving throw. If the creature fails its saving throw, it is turned for 1 minute or until it takes any damage. A turned creature must spend its turns trying to move as far away from you as it can, and it can\'t willingly move to a space within 30 feet of you. It also can\'t take reactions. For its action, it can use only the Dash action or try to escape from an effect that prevents it from moving. If there\'s nowhere to move, the creature can use the Dodge action.'
        },
        'Divine Domain Feature': {
          description: 'At 2nd level, you gain a feature granted by your domain.'
        },
      },
      3 => {},
      4 => {
        'Ability Score Improvement': {
          description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
          selectable: true,
          type: 'ability_score_improvement'
        }
      },
      5 => {
        'Destroy Undead': {
          description: 'Starting at 5th level, when an Undead of CR 1/2 or lower fails its saving throw against your Turn Undead feature, the creature is instantly destroyed.'
        }
      },
      6 => {
        'Channel Divinity': {
          description: 'At 6th level, you gain the ability to use Channel Divinity twice between rests.',
        },
        'Divine Domain Feature': {
          description: 'At 6th level, you gain a feature granted by your domain.'
        }
      },
      7 => {},
      8 => {
        'Ability Score Improvement': {
          description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
          selectable: true,
          type: 'ability_score_improvement'
        },
        'Destroy Undead (CR 1 or lower)': {
          description: 'Starting at 8th level, when an Undead of CR 1 or lower fails its saving throw against your Turn Undead feature, the creature is instantly destroyed.'
        },
        'Divine Domain Feature': {
          description: 'At 8th level, you gain a feature granted by your domain.'
        }
      },
      9 => {},
      10 => {
        'Divine Intervention': {
          description: 'Beginning at 10th level, you can call on your deity to intervene on your behalf when your need is great. Imploring your deity\'s aid requires you to use your action. Describe the assistance you seek, and roll percentile dice. If you roll a number equal to or lower than your Cleric level, your deity intervenes. The DM chooses the nature of the intervention; the effect of any Cleric spell or Cleric domain spell would be appropriate. If your deity intervenes, you can\'t use this feature again for 7 days. Otherwise, you can use it again after you finish a Long Rest. At 20th level, your call for intervention succeeds automatically, no roll required.'
        }
      },
      11 => {
        'Destroy Undead (CR 2 or lower)': {
          description: 'Starting at 11th level, when an Undead of CR 2 or lower fails its saving throw against your Turn Undead feature, the creature is instantly destroyed.'
        }
      },
      12 => {
        'Ability Score Improvement': {
          description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
          selectable: true,
          type: 'ability_score_improvement'
        }
      },
      13 => {},
      14 => {
        'Destroy Undead (CR 3 or lower)': {
          description: 'Starting at 14th level, when an Undead of CR 3 or lower fails its saving throw against your Turn Undead feature, the creature is instantly destroyed.'
        },
      },
      15 => {},
      16 => {
        'Ability Score Improvement': {
          description: 'When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can\'t increase an ability score above 20 using this feature.',
          selectable: true,
          type: 'ability_score_improvement'
        },
      },
      17 => {
        'Destroy Undead (CR 4 or lower)': {
          description: 'Starting at 17th level, when an Undead of CR 4 or lower fails its saving throw against your Turn Undead feature, the creature is instantly destroyed.'
        },
        'Divine Domain Feature': {
          description: 'At 17th level, you gain a feature granted by your domain.'
        }
      },
      18 => {
        'Channel Divinity': {
          description: 'At 18th level, you gain the ability to use Channel Divinity three times between rests.'
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
        'Divine Intervention Improvement': {
          description: 'At 20th level, your call for intervention succeeds automatically, no roll required.'
        }
      }
    }
    @subclasses = {
      name: 'Divine Domain',
      level: 1,
      options: []
    }
  end
end
