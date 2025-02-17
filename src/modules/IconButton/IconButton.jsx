import { IconButtonContainer } from "./IconButton.styles";

export default function IconButtonComponent({ icon, theme, disabled, onClick }) {
  return (
    <IconButtonContainer onClick={onClick} theme={theme} disabled={disabled}>
      <i className={`fa-solid fa-${icon}`}></i>
    </IconButtonContainer>
  );
}
