class Tweet < ActiveRecord::Base
  validates_uniqueness_of :tweet_id

  class << self
    def tweet_tweet
      tweet = unique_tweet
      client.update(tweet.text + " - @" + tweet.username)
      tweet.update_attributes(:tweeted => true)

      tweet
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
    end

    def client
      Twitter::REST::Client.new do |config|
        config.consumer_key        = "ttfwHcavjIlA9l1iY2HsuA"
        config.consumer_secret     = "s5TxOYkdCzolVyEV7uvmUjjypUO16kcfKrp5zHX1cEs"
        config.access_token        = "2257689449-V8epVukq9Yrvu8Q88xuM8WNU5jD7R9M4oiboL34"
        config.access_token_secret = "5Er0s4epQdLkx0BqP5oJUduStudVpF02hCD65KvwH87yJ"
      end
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

  def tweeted?
    tweeted
  end
end
