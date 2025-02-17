import api from "./Api.service";

export class Adventure {
  constructor({ id, name, data, sessions, heroes, gamemaster }) {
    this.id = id;
    this.name = name;
    this.data = data;
    this.sessions = sessions;
    this.heroes = heroes;
    this.gamemaster = gamemaster;
  }

  static fromJson(data) {
    return new Adventure(data);
  }
}

export class AdventuresCollection {

  static async fetch() {
    const response = await api.get('/adventures')

    return response.data.map((data) => Adventure.fromJson(data));
  }

  static async create(adventure) {
    const response = await api.post('/adventures', adventure)

    return Adventure.fromJson(response)
  }
}



