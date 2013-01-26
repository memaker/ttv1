class Tweet
  include Mongoid::Document
  field :created_at, type: String
  field :text, type: String
  field :source, type: String
  field :lang, type: String
end
