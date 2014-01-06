class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :tweet_id
      t.string  :username
      t.text    :text
      t.boolean :tweeted, :default => false

      t.timestamps
    end
  end
end
