# Usage: rake RAILS_ENV=[development, test, production] twitter:tweet_collector [configuration file, ex: mass_media]
require 'pp' # PrettyPrint

namespace :twitter do
  desc "it collects, analyzes and saves tweets"
  task :tweet_collector => :environment do
      
    puts "tweet_collector is listening Twitter on #{ARGV[2]} mode"
    
    # config
    settings = YAML.load_file File.expand_path("config/#{ARGV[2]}.yml")
  
    # tweetstream
    TweetStream.configure do |config|
      config.consumer_key       = settings['consumer_key']
      config.consumer_secret    = settings['consumer_secret']
      config.oauth_token        = settings['oauth_token']
      config.oauth_token_secret = settings['oauth_token_secret']
    end
    
    # Bayes
    # bayes_motel = BayesMotel.new
    corpse = BayesMotel::Corpus.new('tweets')
    Tweet.all.each do |tweet|
      corpse.train(tweet, :positive)
    end
    Tweet.all.each do |tweet|
      corpse.train(tweet, :negative)
    end
    corpse.cleanup
      
    # SexMachine. IMP case sensitive as some first names will not be recognized
    sex_machine = SexMachine::Detector.new(:case_sensitive => false)
  
    # stream
    stream = TweetStream::Client.new
    stream.on_error { |msg| puts msg }
    stream.on_timeline_status do |status|
      # calculate the gender
      calculated_gender = sex_machine.get_gender(status.user.name.split(" ").first)
      
      # calculate the sentiment
      calculated_sentiment = corpse.classify(status.text)
  
      tweet = Tweet.new({ 
        :created_at => status.created_at,
        :text => status.text,
        :location => status.user.location,
        :gender => calculated_gender,
        :sentiment => calculated_sentiment
      })
      tweet.save
      print "."
    end
  
    # start stream
    stream.userstream
  end
end