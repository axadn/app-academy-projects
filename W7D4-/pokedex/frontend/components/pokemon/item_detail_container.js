import {connect} from "react-redux";
import ItemDetail from "./item_detail";
import {withRouter} from "react-router";

const mapStateToProps = (state, ownProps) => {
  return {
    item: state.entities.items[ownProps.match.params.itemId]
  };
};

export default withRouter(connect(mapStateToProps)(ItemDetail));
