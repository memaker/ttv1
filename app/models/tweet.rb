class Tweet
  include Mongoid::Document
    
  field :created_at, type: DateTime
  field :text, type: String
  field :location, type: String
  field :gender, type: String
  field :sentiment, type: String
end
