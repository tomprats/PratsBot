class TweetsController < ApplicationController
  def show
    @tweet = client.current_user.status
  end

  def tweet_tweet
    tweet = unique_tweet
    client.update(tweet.text + " - @" + tweet.username)
    tweet.update_attributes(:tweeted => true)

    redirect_to root_path, :notice => "Tweet successful"
  end

  def sync
    client.friends.each do |friend|
      username = friend.username
      tweets = client.user_timeline(username)
      tweets.each do |tweet|
        Tweet.create(
          :tweet_id => tweet.id,
          :username => username,
          :text     => tweet.full_text
        )
      end
    end

    redirect_to root_path, :notice => "Tweets synchronized"
  end

  private
  def unique_tweet
    tweet = random_tweet
    while tweet.tweeted?
      tweet = random_tweet
    end

    tweet
  end

  def random_tweet
    Tweet.offset(rand(Tweet.count)).first
  end
end
