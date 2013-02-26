class BayesMotel
  
  def initialize
    @corpse = BayesMotel::Corpus.new('tweets')
    CorpusPositive.all.each do |tweet|
      @corpse.train(tweet, :positive)
    end
    CorpusNegative.all.each do |tweet|
      @corpse.train(tweet, :negative)
    end
    @corpse.cleanup
  end
  
  def sentiment(str)
    @corpse.classify(str)
  end

end