import styled from "styled-components";

export const AdventuresListContainer = styled.div`
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--spacing-s);
  padding: 0 var(--spacing-l);
`;

export const AdventuresListTitle = styled.h1`
  font-size: var(--font-size-xxxl);
  margin-bottom: var(--spacings-m);
  padding: var(--spacing-m) var(--spacing-l);
`;

export const AdventuresList = styled.ul`
  list-style: none;
  padding: 0;
  margin: 0;
  width: 100%;
  overflow: auto;
  // overflow-y: scroll;
  max-height: calc(100vh - 128px);
`;

export const AdventuresListItem = styled.li`
  display: flex;
  justify-content: space-between;
  padding: var(--spacing-m) var(--spacing-l);
  border: 1px solid var(--gray-500);
  cursor: pointer;

  h3 {
    font-size: var(--font-size-xl);
    margin: 0;
  }

  ${({ selected }) => selected && `
    background-color: var(--blue-800);
  `}
`;

export const PreviewAdventureContainer = styled.div`
  display: flex;
  flex-direction: column;
  gap: var(--spacing-m);
  padding: var(--spacing-l) var(--spacing-m);
  border: 1px solid var(--gray-500);
  border-radius: var(--border-radius);
  height: calc(100vh - 194px);
  overflow: auto;
`;

export const AdventureTitle = styled.h3`
  font-size: var(--font-size-xxl);
  font-weight: bold;
  margin: 0;
`;

export const AdventureSessionsCount = styled.p`
  font-size: var(--font-size-m);
  margin: 0;
  padding-top: var(--spacing-s);
`;

export const AdventureHeroesList = styled.ul`
  list-style: none;
  padding: var(--spacing-xs) 0;
  margin: 0;
  display: flex;
  gap: var(--spacing-xs);

  p {
    font-weight: bold;
    margin: 0;
  }
`;

export const AdventureHero = styled.li`
  display: flex;
  align-items: center;
  gap: var(--spacing-xs);

  p {
    font-size: var(--font-size-m);
    margin: 0;
  }
`;

export const AdventuresListItemCreate = styled.li`
  display: flex;
  justify-content: space-between;
  padding: var(--spacing-m) var(--spacing-l);
  border: 1px solid var(--gray-500);
  cursor: pointer;
  font-style: italic;

  h3 {
    font-size: var(--font-size-xl);
    margin: 0;
  }

  ${({ selected }) => selected && `
    background-color: var(--blue-800);
  `}
`;
export const AdventuresListItemCreateLabel = styled.h3`
  display: flex;
  align-items: center;
  gap: var(--spacing-xs);
`;

export const InputContainer = styled.input`
  width: 100%;
  padding: var(--spacing-xs);
  background-color: var(--gray-700);
  color: var(--gray-100);
  font-family: var(--text-font-family-sans);
  font-size: var(--font-size-m);
  border: 1px solid var(--blue-600);
  border-radius: var(--spacing-xxs);

  &::placeholder {
    color: var(--gray-400);
    font-family: var(--text-font-family-sans);
  }
`;

export const ButtonsContainer = styled.div`
  display: flex;
  align-items: center;
  gap: var(--spacing-xxs);
  margin: 0 var(--spacing-xs);
`;
