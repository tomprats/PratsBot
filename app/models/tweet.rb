class Tweet < ActiveRecord::Base
  validates_uniqueness_of :tweet_id

  def tweeted?
    tweeted
  end
end
