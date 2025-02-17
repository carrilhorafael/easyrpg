import useAdventures from "hooks/useAdventures";
import { AdventuresList, AdventuresListContainer, AdventuresListItem, AdventuresListItemCreate, AdventuresListItemCreateLabel, AdventuresListTitle } from "./AdventuresList.styles";
import PreviewAdventure from "./components/PreviewAdventure";
import { useNavigate } from "react-router-dom";
import { useState } from "react";
import NewAdventureInput from "./components/NewAdventureInput";

export default function AdventuresListPage() {
  const { adventures, loading, selectedAdventure, createAdventure, setSelectedAdventure } = useAdventures();
  const [creating, setCreating] = useState(false);
  const navigate = useNavigate();

  const selectAdventure = (adventure) => {
    setSelectedAdventure(adventure);
    setCreating(false);
  }

  const initializeNewAdventure = () => {
    console.log('teste')
    setSelectedAdventure(null);
    setCreating(true);
  }

  return (
    <div>
      <AdventuresListTitle>Adventures</AdventuresListTitle>
      <AdventuresListContainer>
        <div>
          <AdventuresList>
            {loading
              ? <li>Loading...</li>
              : <>
                {(adventures ?? []).map((adventure) => (
                  <AdventuresListItem
                      key={adventure.id}
                      onClick={() => selectAdventure(adventure)}
                      onDoubleClick={() => navigate(`/adventures/${adventure.id}`)}
                      selected={!creating && selectedAdventure?.id === adventure.id}>
                    <h3>{adventure.name}</h3>
                  </AdventuresListItem>
                ))}
                {creating
                  ? <AdventuresListItemCreate
                      selected={creating}>
                      <NewAdventureInput  onCancel={() => setCreating(false)} onSave={createAdventure} />
                    </AdventuresListItemCreate>
                  : <AdventuresListItemCreate
                      onClick={initializeNewAdventure}
                      selected={creating}>
                      <AdventuresListItemCreateLabel>
                        <i className="fas fa-plus"></i>
                        Create new adventure
                      </AdventuresListItemCreateLabel>
                    </AdventuresListItemCreate>
                  }
              </>
            }
          </AdventuresList>
        </div>
        <div>
          <PreviewAdventure adventure={selectedAdventure} />
        </div>
      </AdventuresListContainer>
    </div>
  );
};
