class HomeController < ApplicationController
  def index
    @users = User.all
    @tweets = Tweet.all

    @b = Classifier::Bayes.new 'Positive', 'Negative'
    # @b = Classifier::Bayes.new :categories => ['Positive', 'Negative', 'Neutral'], :language => 'es'

    # training positive
    p = CorpusPositive.all
    p.each do |c|
      @b.train_positive c.sentence
    end

    # training negative
    p = CorpusNegative.all
    p.each do |c|
      @b.train_negative c.sentence
    end

    # training neutral
    #p = CorpusNeutral.all
    #p.each do |c|
    #  @b.train_neutral c.sentence
    #end

  end
end
