import { useEffect, useState } from "react";
import { AdventuresCollection } from "services/Adventure.service";

export default function useAdventures() {
  const [adventures, setAdventures] = useState([]);
  const [loading, setLoading] = useState(true);
  const [selectedAdventure, setSelectedAdventure] = useState(null);

  async function fetchAdventures() {
    setLoading(true);
    AdventuresCollection.fetch().then((adventures) => {
      console.log(adventures);
      setAdventures(adventures);
    }).finally(() => {
      setLoading(false);
    });
  }

  async function createAdventure(params) {
    console.log(params)
    AdventuresCollection.create(params).then((adventure) => {
      setAdventures([...adventures, adventure]);
    });
  }

  useEffect(() => {
    fetchAdventures();
  }, []);

  return { adventures, loading, selectedAdventure, createAdventure, setSelectedAdventure };
}
