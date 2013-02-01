require 'sentimentron'

class Tweet
  include Mongoid::Document
  include Sentimentron
  
  analyzer = Sentimentron.new
  
  field :created_at, type: String
  field :text, type: String
  field :source, type: String
  field :lang, type: String
  
  def sentiment
    analyzer.analyze(this.text)
  end
end
