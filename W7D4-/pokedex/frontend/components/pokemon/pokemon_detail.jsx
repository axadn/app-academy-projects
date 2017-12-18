import React from 'react';
import {Route, NavLink} from "react-router-dom";
import ItemDetailContainer from "./item_detail_container";

class PokemonDetail extends React.Component{
  render(){
    if(this.props.loading){
      return (<div>loading...</div>)
    }
    const itemLis = Object.keys(this.props.items).map(itemId => (

      <li key={`item${itemId}`}>
          <NavLink to={`/pokemon/${this.props.pokemon.id}/items/${itemId}`}>
            <div className="item"><img src={this.props.items[itemId].image_url}></img></div>
        </NavLink>
      </li>

    ));
    return(<div>
      <ul>
        <h1> {this.props.pokemon.name}</h1>
        <img height="180px" src={this.props.pokemon.image_url}></img>
        <li>Attack {this.props.pokemon.attack}</li>
        <li>Defense {this.props.pokemon.defense}</li>
        <ul>
          {itemLis}
        </ul>
      </ul>

      <Route path={`/pokemon/${this.props.pokemon.id}/items/:itemId`}
        component ={ItemDetailContainer}></Route>
    </div>);
  }
}


export default PokemonDetail;
