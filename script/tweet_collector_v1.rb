#!/usr/bin/env ruby
# Usage: tweet_collector.rb zara01_mongolab

ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

require 'mongo'
require 'bundler'
require 'json'

Bundler.require

class Bayes 
  attr_writer :db_connector
  attr_reader :options
 
  def initialize(options) 
    @classifier = Classifier::Bayes.new('positive', 'negative', 'neutral')
    
    # training Bayes - positive sentences
    # @corpus_positives = CorpusPositive.all
    # @corpus_positives.each do |corpus_positive|
      # puts corpus_positive.sentence
    # end
  end
  
  def db
    @db ||= connect_to_db
  end

  def load_corpus_positives
    @corpus_positives ||= db['corpus_positives']
    @corpus_positives.find()
  end
  
  def corpus_negatives
    @corpus_negatives ||= db['corpus_positives']
    @corpus_negarives.find()
  end
  
  def sentiment(str)
    "positive"
  end

  private
  def connect_to_db
    @connection ||= Mongo::Connection.from_uri(options['mongo_uri'])
    @db_connector = @connection.db(options['db_name'])
  end
  
end

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

# Bayes
bayes = Bayes.new(settings)

# SexMachine
# Imp case sensitive as some firstnames will not be recognized
d = SexMachine::Detector.new(:case_sensitive => false)

# miner
miner = TweetMiner.new(settings)

# stream
stream = TweetStream::Client.new
stream.on_error { |msg| puts msg }
  
stream.on_timeline_status do |status|  
    
  # puts "[#{status.user.screen_name}] #{status.text}"
  # puts "@#{status.user.screen_name} said"
  # puts status.text

  # calculate the sentiment
  calculated_sentiment = bayes.sentiment(status.text)
  # calculate the gender
  # puts status.user.name.split(" ").first
  calculated_gender = d.get_gender(status.user.name.split(" ").first)
  # puts calculated_gender
 
  my_tweet = { :text => status.text, :user => status.user.name, :gender => calculated_gender }
  miner.insert_status my_tweet

  # add the sentiment to the tweet
  # miner.insert_status status.to_hash.merge!({"sentiment" => calculated_sentiment, "gender" => calculated_gender})
      
  print "."
end

# start stream
stream.userstream
