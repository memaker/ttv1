# How to use it
# ruby lib/collect_mongolab.rb zara01_mongolab

# gems
require 'bundler'
Bundler.require

# libs
require_relative 'tweet_miner_mongolab'

puts "The client is : #{ARGV[0]}"

# config
settings = YAML.load_file File.expand_path(File.dirname(__FILE__) + "./../config/#{ARGV[0]}.yml")

# tweetstream
TweetStream.configure do |config|
  config.consumer_key       = settings['consumer_key']
  config.consumer_secret    = settings['consumer_secret']
  config.oauth_token        = settings['oauth_token']
  config.oauth_token_secret = settings['oauth_token_secret']
end

# miner
miner = TweetMiner.new(settings)

# stream
stream = TweetStream::Client.new
stream.on_error { |msg| puts msg }
stream.on_timeline_status do |status|
  # convert status to hash
  miner.insert_status status.to_hash
  print "."
end

# start stream
stream.userstream
