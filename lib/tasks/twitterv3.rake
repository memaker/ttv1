# Usage: rake RAILS_ENV=[development, test, production] twitter:tweet_collector [configuration file, ex: mass_media]
require 'pp' # PrettyPrint

namespace :twitterv3 do
  puts "it collects, analyzes and saves tweets"
  task :tweet_collector => :environment do
      
    puts "tweet_collector is running using the configuration #{ARGV[2]}"
    
    # config
    settings = YAML.load_file File.expand_path("config/#{ARGV[2]}.yml")
  
    # tweetstream
    puts "Building the tweet stream"
    TweetStream.configure do |config|
      config.consumer_key       = settings['consumer_key']
      config.consumer_secret    = settings['consumer_secret']
      config.oauth_token        = settings['oauth_token']
      config.oauth_token_secret = settings['oauth_token_secret']
    end
    
    # classifier
    puts "Building the corpus"
    b = Classifier::Bayes.new 'positive', 'negative', 'neutral'
    CorpusPositive.all.each do |tweet|
      b.train_positive tweet.sentence
    end
    CorpusNegative.all.each do |tweet|
      b.train_negative tweet.sentence
    end
    CorpusNeutral.all.each do |tweet|
      b.train_neutral tweet.sentence
    end
    CorpusAnew.all.each do |anew|
      case anew.valmnall
      when 0 .. 4
        b.train_negative anew.sword
      when 4 .. 6
        b.train_neutral anew.sword
      when 6 .. 10
        b.train_positive anew.sword
      end
    end
             
    # SexMachine. IMP case sensitive as some first names will not be recognized
    puts "Building the gender detector"
    sex_machine = SexMachine::Detector.new(:case_sensitive => false)
  
    # stream
    puts "Enter the stream"
    stream = TweetStream::Client.new
    stream.on_error { |msg| puts msg }
    stream.on_timeline_status do |status|
      
      # calculate the gender
      calculated_gender = sex_machine.get_gender(status.user.name.split(" ").first)
        
      # calculate the sentiment
      calculated_sentiment = b.classify status.text
        
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