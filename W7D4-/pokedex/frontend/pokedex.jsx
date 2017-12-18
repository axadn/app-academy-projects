import React from "react";
import ReactDOM from  "react-dom";
import { HashRouter, Route } from "react-router-dom";
import {receiveAllPokemon, requestAllPokemon} from "./actions/pokemon_actions";
import configureStore from "./store/store";
import * as APIUtil from "./util/api_util";
import selectAllPokemon from "./reducers/selectors";
import Root from './components/root';

document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById("root");
  window.receiveAllPokemon = receiveAllPokemon;
  const store = configureStore();
  ReactDOM.render(<Root store = {store}/>, root);
  window.requestAllPokemon = requestAllPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.selectAllPokemon = selectAllPokemon;
});
