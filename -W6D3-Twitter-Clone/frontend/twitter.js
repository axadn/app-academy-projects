const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require("./users_search.js");
const TweetCompose = require('./tweet_compose.js');
const InfiniteTweets = require('./infinite_tweets.js');

$(() => {
  new InfiniteTweets($('.infinite-tweets'));

  new TweetCompose($('.tweet-compose'));

  const $nav = $("nav.users-search");
  new UsersSearch($nav[0]);

  const $followButtons = $('.follow-toggle');
  console.log($followButtons);
  $followButtons.each(function (index, el) {
    const followToggle = new FollowToggle(el);
  });
});
