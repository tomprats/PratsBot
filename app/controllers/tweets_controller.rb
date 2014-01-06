class TweetsController < ApplicationController
  def show
    @tweet = client.current_user.status
  end

  def tweet_tweet
    Tweet.tweet_tweet

    redirect_to root_path, :notice => "Tweet successful"
  end

  def sync
    Tweet.sync

    redirect_to root_path, :notice => "Tweets synchronized"
  end
end
