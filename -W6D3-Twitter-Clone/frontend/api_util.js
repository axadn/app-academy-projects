const APIUtil = {
  fetchTweets(maxCreatedAt) {
    return $.ajax({
      method: 'get',
      dataType: 'JSON',
      url: '/feed',
      data: {
        max_created_at: maxCreatedAt
      }
    });
  },

  followUser: function(id){
    return $.ajax(`/users/${id}/follow`, {
      method: "post",
      dataType: 'JSON',
      success: (res) => {
        this.$el.data('follow-state', 'followed');
        this.followState = 'followed';
      },
      error: (e) => {
        console.log(e);
      }
    });
  },

  unfollowUser: function(id) {
    return $.ajax(`/users/${id}/follow`, {
      method: "delete",
      dataType: 'JSON',
      success: (res) => {
        this.$el.data('follow-state', 'unfollowed');
        this.followState = 'unfollowed';
      },
      error: (e) => {
        console.log(e);
      }
    });
  },
  searchUsers(queryVal, success){
    return $.ajax({
      method: "get",
      url: "/users/search/",
      dataType: "JSON",
      data: { query: queryVal },
      success: success,
      error: (e) => {
        console.log(e);
      }
    });
  },

  createTweet(data) {

    return $.ajax({
      method: 'post',
      dataType: "JSON",
      url: '/tweets',
      data: data,
      error: (err) => console.log(err)
    });
  }
};

module.exports = APIUtil;
