import { BrowserRouter, Routes, Route } from "react-router-dom"
import { AdventuresList } from "./pages"
import { useAuthentication } from "./contexts/AuthenticationContext/AuthenticationContext"
import { Header } from "./modules"
// import { AdventuresList } from "./pages"



const Router = () => {
  // const { authenticated } = useAuthentication()

  return (
    <BrowserRouter>
      <Header />
      <Routes>
        <Route path="/" />
        <Route path="/adventures" element={<AdventuresList />} />
      </Routes>
    </BrowserRouter>
  )
}

export default Router
