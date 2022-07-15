import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
  Redirect,
  useParams
} from "react-router-dom";

function App() {
  return (
    <Route exact path="/">
      {loggedIn ? <Redirect to="/dashboard" /> : <PublicHomePage />}
    </Route>
  );
}

function App2() {
  return (
    <Route exact path="/">
      {loggedIn ? <Redirect to={{
        pathname: "/login",
        search: "?utm=your+face",
        state: { referrer: currentLocation }
      }} /> : <PublicHomePage />}
    </Route>
  );
}

function App3({userInput}) {
  return (
    <Route exact path="/">
// ok: react-router-redirect
      {loggedIn ? <Redirect to={userInput} /> : <PublicHomePage />}
    </Route>
  );
}
