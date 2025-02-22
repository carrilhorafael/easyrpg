import React from 'react';
import ReactDOM from 'react-dom/client';
import reportWebVitals from './reportWebVitals';
import Router from './Router.js';
import 'stylesheets/reset.css';
import 'stylesheets/variables.css';
import { AuthenticationProvider } from 'contexts/index.js';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <AuthenticationProvider>
    <Router />
  </AuthenticationProvider>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
