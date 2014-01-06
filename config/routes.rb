PratsBot::Application.routes.draw do
  root 'tweets#show'

  put  'tweet',      :to => 'tweets#tweet_tweet'
  put  'sync',       :to => 'tweets#sync'
end
