require 'bayes'

class Tweet
  include Mongoid::Document
  include Bayes
    
  field :created_at, type: String
  field :text, type: String
  field :source, type: String
  field :lang, type: String
  
  def sentiment
    Bayes.sentiment(this.text)
  end
end
