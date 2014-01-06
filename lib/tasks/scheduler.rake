desc "Sync and Tweet"
task :sync_and_tweet => :environment do
  puts "Updating tweets..."
  Tweet.sync
  puts "Choosing tweets..."
  tweet = Tweet.tweet_tweet
  puts "Tweeted the following: "
  puts tweet.text
end
