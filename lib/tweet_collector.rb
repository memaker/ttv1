#!/usr/bin/env ruby

# How to use it
# tweet_collector.rb zara01_mongolab

require 'mongo'

# gems
require 'bundler'
Bundler.require

class TweetMiner
  attr_writer :db_connector
  attr_reader :options

  def initialize(options)
    @options = options
  end

  def db
    @db ||= connect_to_db
  end

  def statuses
    # @statuses ||= db['statuses']
    @statuses ||= db[options['collection']]
  end
  
  def insert_status(status)
    statuses.insert status
  end

  private
  def connect_to_db
    @connection ||= Mongo::Connection.from_uri(options['mongo_uri'])
    @db_connector = @connection.db(options['db_name'])
  end
end

puts "The client is : #{ARGV[0]}"

# config
settings = YAML.load_file File.expand_path("../config/#{ARGV[0]}.yml")

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

