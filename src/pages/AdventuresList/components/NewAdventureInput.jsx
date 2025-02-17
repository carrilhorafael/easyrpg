import { IconButton } from "modules";
import { ButtonsContainer, InputContainer } from "../AdventuresList.styles";
import { useState } from "react";
import SYSTEMS from "../systems/SYSTEMS";

export default function NewAdventureInputComponent({ onCancel, onSave }) {
  const [name, setName] = useState('')
  const [data, setData] = useState(null)

  const handleSave = () => {
    onSave({ name, data })
    setName('')
    setData({})
  }

  const handleCancel = () => {
    onCancel()
    setName('')
    setData({})
  }

  return (
    <>
      <InputContainer type="text" placeholder="New adventure name" value={name} onChange={(e) => setName(e.target.value)} />
      <ButtonsContainer >
        <IconButton icon='globe' theme='secondary' onClick={() => setData(SYSTEMS.DND5E.data)} />
        <IconButton icon='ban' theme='negative' onClick={handleCancel} />
        <IconButton icon='check' theme='primary' disabled={!name || !data } onClick={handleSave} />
      </ButtonsContainer>
    </>
  );
}
