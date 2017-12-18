import React from "react";
import {connect} from "react-redux";
import {selectSinglePokemon} from "../../reducers/selectors";
import {requestSinglePokemon, setLoadingSinglePokemon} from "../../actions/pokemon_actions";
import PokemonDetail from "./pokemon_detail";
import {withRouter} from "react-router";

const containerMapDispatchToProps = (dispatch) => ({
  fetchPokemon: (id) => dispatch(requestSinglePokemon(id)),
  setLoadingPokemon: () => dispatch(setLoadingSinglePokemon())
});
const containerMapStateToProps = (state, ownProps) => ({
  pokemonId: ownProps.match.params.pokemonId
});

const mapStateToProps = (state, ownProps) => {
  return{
  loading: state.ui.loading.singlePokemon,
  pokemon: selectSinglePokemon(state, ownProps.pokemonId),
  items: state.entities.items
}};
const ConnectedPokemonDetail = withRouter(connect(mapStateToProps)(PokemonDetail));
class PokemonDetailContainer extends React.Component{
  componentWillMount(){
    this.props.fetchPokemon(this.props.pokemonId);
    this.props.setLoadingPokemon();
  }
  componentWillReceiveProps(newProps){
    if(newProps.pokemonId !== this.props.pokemonId ){
      this.props.fetchPokemon(newProps.pokemonId);
      this.props.setLoadingPokemon();
    }
  }
  render() {
    return(
      < ConnectedPokemonDetail pokemonId={
        this.props.pokemonId}></ConnectedPokemonDetail>
    );
  }
}

export default withRouter(connect(containerMapStateToProps,
    containerMapDispatchToProps)(PokemonDetailContainer));
