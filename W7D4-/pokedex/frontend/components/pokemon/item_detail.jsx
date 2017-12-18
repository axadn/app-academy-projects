import React from "react";

export default class ItemDetail extends React.Component{
  render(){
    return(
      <div>{this.props.item.name}</div>
    );
  }
}
