# Usage: rake RAILS_ENV=[development, test, production] twitter:tweet_collector [configuration file, ex: mass_media]
require 'pp' # PrettyPrint

namespace :selector do
  
  desc "demo de selector"
  task :tweet_collector => :environment do
    # classifier
    b = Classifier::Bayes.new 'positive', 'negative', 'neutral'
    b.train_positive "me gusta mucho"
    b.train_negative "es muy aburrido"
    b.train_neutral "me da igual"
    
    puts b.classify "lo adoro igual"
  end
end