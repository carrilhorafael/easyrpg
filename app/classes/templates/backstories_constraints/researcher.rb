RESEARCHER = {
  title: 'Researcher',
  description: "You have an innate ability to derive information from an item using simple tests and observation.",
  source: 'Xanathar\'s Guide to Everything',
  proficiencies: {
    skills: {
      mandatory: ['Investigation', 'History']
    },
    languages: {
      optional: {
        choose: 2
      }
    }
  },
  initial_equipment: {
    mandatory: [
      {
        item: 'a bottle of black ink',
      },
      {
        item: 'a quill',
      },
      {
        item: 'a small knife',
      },
      {
        item: 'a small notebook',
      },
      {
        item: 'commum clothes',
      },
      {
        coins: 10,
        type: 'gold'
      }
    ]
  },
  features: {
    "Scientific Analysis": "You have an innate ability to derive information from an item using simple tests and observation."
  }
}
