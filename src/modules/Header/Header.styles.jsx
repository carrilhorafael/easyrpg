import styled from 'styled-components'

export const HeaderContainer = styled.div`
  background-color: var(--blue-800);
  color: white;
  padding: var(--spacing-xs) var(--spacing-l);
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  position: sticky;
`

export const HeaderTitle = styled.h1`
  margin: 0;
  font-size: var(--font-size-xxxl);
  color: var(--gray-100);
`

export const HeaderSubtitle = styled.h2`
  margin: 0;
`
