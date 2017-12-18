const APIUtil = require("./api_util.js");
const FollowToggle = require('./follow_toggle.js');

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find('input');
    this.$ul = this.$el.find("ul");
    this.$input.on("input", this.handleInput.bind(this));
  }

  handleInput(){
    APIUtil.searchUsers
           .bind(this)(this.$input.val(), this.renderResults.bind(this));
  }
  renderResults(res){
    this.$ul.empty();
    res.forEach((user) => {
      this.$ul.append($(
        `<li>
          <a href="/users/${user.id}">${user.username}</a>
          <form>
            <input class="follow-toggle" data-user-id="${user.id}"
              data-follow-state="${user.followed ? 'followed' : 'unfollowed'}"
              type="submit">
          </form>
        </li>`
      ));
      new FollowToggle(this.$ul.find(`input[data-user-id=${user.id}]`));
    });
  }
}

module.exports = UsersSearch;
