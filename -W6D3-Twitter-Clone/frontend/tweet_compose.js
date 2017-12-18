const APIUtil = require("./api_util.js");
const InfiniteTweets = require('./infinite_tweets.js');

class TweetCompose {
  constructor(el) {
    this.$el = el;
    this.$ul = $(this.$el.data("tweets-ul"));
    this.$textArea = this.$el.find("textarea");
    this.$button = this.$el.find('input[type=submit]');
    this.$addMentionLink = this.$el.find('.add-mentioned-user');
    this.$addMentionDiv = this.$el.find('.mentioned-users');

    this.$textArea.on("input", this.handleCharsLeft.bind(this));

    this.$el.on('submit', this.handleSubmit.bind(this));

    this.$addMentionLink.on('click', this.addMentionedUser.bind(this));
  }

  addMentionedUser (event) {
    const $scriptTag = $('script[type="text/template"]');
    const $mentionSelect = $($scriptTag.html());
    this.$addMentionDiv.append($mentionSelect);
    $mentionSelect.on("click", "a", function(e){
      $mentionSelect.remove();
      return false;
    });
    return false;
  }

  handleSubmit(event) {
    this.$button.prop('disabled', true);
    event.preventDefault();
    const submitData = this.$el.serialize();
    APIUtil.createTweet
      .bind(this)(submitData)
      .then(this.handleSuccess.bind(this), this.handleError.bind(this));

  }
  handleCharsLeft(event){
    let chars = this.$textArea.val().length;
    if (chars >= 140) {
      this.$textArea.val(this.$textArea.val().slice(0, 140));
    }
    chars = this.$textArea.val().length;
    this.$el.find(".chars-left").text(`chars left: ${140 - chars}/140`);
  }
  handleSuccess(res){
    this.$button.prop('disabled', false);
    this.clearInput();
    console.log(res);
    InfiniteTweets.prototype.insertTweet.bind(this)(res, false);
  }

  handleError(err) {
    this.$button.prop('disabled', false);
  }

  clearInput(){
    this.$textArea.val("");
    this.$addMentionDiv.empty();
  }
}

module.exports = TweetCompose;
