const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('follow-state');
    this.render();
    this.$el.click(this.handleClick.bind(this));
  }

  render(){
    this.$el.prop('disabled', false);
    if(this.followState === "followed"){
      this.$el.val("Unfollow");
    }
    else if(this.followState === "unfollowed"){
      this.$el.val("Follow");
    }
  }

  handleClick(event){
    event.preventDefault();
    let utilFunction;
    if(this.followState === "followed"){
      this.$el.val("Unfollowing");
      this.followState = "Unfollowing";
      this.$el.prop('disabled', true);
      utilFunction = APIUtil.unfollowUser;
    }
    else if (this.followState === "unfollowed"){
      this.$el.val("Following");
      this.followState = "Following";
      this.$el.prop('disabled', true);
      utilFunction = APIUtil.followUser;
    }
    utilFunction.bind(this)(this.userId).then(() => this.render());
  }
}

module.exports = FollowToggle;
