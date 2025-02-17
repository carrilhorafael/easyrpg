import { AdventureHero, AdventureHeroesList, AdventureSessionsCount, AdventureTitle, PreviewAdventureContainer } from "../AdventuresList.styles";

export default function PreviewAdventureComponent ({ adventure }) {

  if (!adventure) {
    return (
      <PreviewAdventureContainer>
        <div>
          <AdventureTitle>No adventure selected</AdventureTitle>
        </div>
      </PreviewAdventureContainer>
    )
  }
  return (
    <PreviewAdventureContainer>
      <div>
        <AdventureTitle>{adventure?.name}</AdventureTitle>
        <AdventureSessionsCount>{adventure?.sessions?.length} sessions</AdventureSessionsCount>
      </div>
      <div>
        <AdventureHeroesList>
          <p>Adventure's Heroes</p>
          {adventure?.heroes?.map((hero) => (
            <AdventureHero key={hero.id}>
              {hero.name}
            </AdventureHero>
          ))}
        </AdventureHeroesList>
      </div>
    </PreviewAdventureContainer>

  );
}
