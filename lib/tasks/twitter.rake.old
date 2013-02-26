# Usage: rake twitter:collect_tweets[ENV_TYPE_HERE]

require 'mongoid'

namespace :twitter do
  desc "it collects, analyzes and saves tweets"
  task :collect_tweets, :environment do |t, args|
    
    unless args[:environment]
      puts "Must provide an environment"
      exit
    end
    
    yaml = YAML.load_file("config/mongoid.yml")
    env_info = yaml[args[:environment]]
    unless env_info
      puts "Unknown environment"
      exit
    end
 
    Mongoid.configure do |config|
        config.from_hash(env_info)
    end


    
  end
    
    
end

