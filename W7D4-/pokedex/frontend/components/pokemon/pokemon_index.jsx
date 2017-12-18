import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {

  componentDidMount () {
    this.props.requestAllPokemon();
  }

  render () {
    return(
    <div>
      <ul>
        {this.props.pokemon.map((poke) =>
          <PokemonIndexItem key={poke.id} pokemon={poke} />
        )}
      </ul>
    </div>
    );
  }
}

export default PokemonIndex;
