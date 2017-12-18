import React from 'react';

import GiphysIndex from './giphys_index';

export default class GiphysSearch extends React.Component{
  constructor(props){
    super(props);
    this.state = {searchTerm: ""};
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handlechange = this.handleChange.bind(this);
  }
  handleChange(key){
     return e =>{
        this.setState({[key]: e.currentTarget.value});
      }

   }

  render(){
    return(
    <div>
      <form >
        <label>
          Query
          <input type="text" onChange={this.handleChange("searchTerm")}
            value={this.state.searchTerm}></input>
        </label>
        <button type="submit" onClick={this.handleSubmit}>Search</button>
      </form>
      <GiphysIndex giphys={this.props.giphys} />
    </div>);
  };

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
  };
};
