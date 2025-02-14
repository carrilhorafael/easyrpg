import { createContext, useContext, useState } from "react";

const AuthenticationContext = createContext();

export default function AuthenticationProvider({ children }) {
  const [user, setUser] = useState({ name: "Teste 1", email: "teste1@email.com" })

  return (
    <AuthenticationContext.Provider value={{
      user
    }}>
      {children}
    </AuthenticationContext.Provider>
  );
}

const useAuthentication = () => {
  const context = useContext(AuthenticationContext);
  if (context === undefined) {
    throw new Error("useAuthentication must be used within a AuthenticationProvider");
  }
  return { ...context };
}

export { AuthenticationProvider, useAuthentication };
