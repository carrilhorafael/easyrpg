import { useAuthentication } from "contexts";

const List = () => {
  const { user } = useAuthentication();

  return (
    <div>
      <h1>Adventures</h1>
      <h2>Welcome, {user.name}!</h2>
      <ul>
        <li>Adventure 1</li>
        <li>Adventure 2</li>
        <li>Adventure 3</li>
      </ul>
    </div>
  );
};

export default List;
