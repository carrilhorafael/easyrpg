import styled from "styled-components";

export const IconButtonContainer = styled.button`
  ${({ theme }) => {
    switch(theme) {
      case "primary":
        return `
          background-color: var(--blue-600);
          color: white;

          &:hover {
            background-color: var(--blue-700);
          }
        `;
      case "secondary":
        return `
          background-color: var(--gray-600);
          color: white;

          &:hover {
            background-color: var(--gray-700);
          }
        `;
      case "negative":
        return `
          background-color: var(--red-600);
          color: white;

          &:hover {
            background-color: var(--red-700);
          }
        `;
      default:
        return `
          background-color: var(--gray-600);
          color: white;

          &:hover {
            background-color: var(--gray-700);
          }
        `;
    }
  }}

  // padding: var(--spacing-m);
  width: var(--spacing-l);
  height: var(--spacing-l);
  border: none;
  border-radius: var(--spacing-xxs);
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  // gap: var(--spacing-xs);
  transition: background-color 0.3s;

  &:disabled {
      background-color: var(--gray-400) !important;
      color: var(--gray-200) !important;
      cursor: not-allowed !important;
    }
`
