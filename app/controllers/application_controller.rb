class ApplicationController < ActionController::Base
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = "ttfwHcavjIlA9l1iY2HsuA"
      config.consumer_secret     = "s5TxOYkdCzolVyEV7uvmUjjypUO16kcfKrp5zHX1cEs"
      config.access_token        = "2257689449-V8epVukq9Yrvu8Q88xuM8WNU5jD7R9M4oiboL34"
      config.access_token_secret = "5Er0s4epQdLkx0BqP5oJUduStudVpF02hCD65KvwH87yJ"
    end
  end
end
