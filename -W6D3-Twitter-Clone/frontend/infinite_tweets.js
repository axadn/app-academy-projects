const APIUtil = require('./api_util.js');

class InfiniteTweets{
  constructor(el){
    this.$el = $(el);
    this.$fetchLink = this.$el.find(".fetch-more");
    this.$ul = this.$el.find('#feed');

    this.$fetchLink.on('click', this.fetchTweets.bind(this));
    this.fetchTweets();
  }

  fetchTweets (event) {
    const maxCreatedAt = this.$ul.find('.tweet-date').eq(-1).text();
    APIUtil.fetchTweets(maxCreatedAt || undefined).then((res) => {
      res.forEach((singleRes) => {
        this.insertTweet(singleRes);
      });
      if (res.length < 20){
        this.$fetchLink.removeAttr("href");
        this.$fetchLink.text("No more tweets");
      }
    });

    return false;
  }

  insertTweet(res, append = true) {
    let string = `<li class="tweet-li">
      ${res.content}
      --
      <a href="/users/${res.user.id}">
       ${res.user.username}
       </a> -- <span class ="tweet-date">${res.created_at}</span>
      <ul>
        `;
    for(let i = 0; i <res.mentions.length;i++){
      string += `<li><a href="/users/${res.mentions[i].user.id}">
        ${res.mentions[i].user.username}
      </a></li>`;
    }
    string+= "</ul></li>";
    if (append) {
      this.$ul.append(string);
    } else {
      this.$ul.prepend(string);
    }
  }

}

module.exports = InfiniteTweets;
