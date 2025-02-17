import { BrowserRouter, Routes, Route } from "react-router-dom"
import { AdventuresList } from "./pages"
import { Header } from "./modules"
// import { AdventuresList } from "./pages"



const Router = () => {
  // const { authenticated } = useAuthentication()

  return (
    <BrowserRouter>
      <Header />
      <Routes>
        <Route path="/adventures">
          <Route index element={<AdventuresList />} />
        </Route>
      </Routes>
    </BrowserRouter>
  )
}

export default Router
