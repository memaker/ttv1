require 'corpus_positive'

class Bayes 
  def initialize
    @classifier = Classifier::Bayes.new('positive', 'negative', 'neutral')
    
    # load positive corpus
    puts "In load positive corpus"
    @element = CorpusPositive.all
    @element.each do |corpus_positive|
      puts "en el ciclo"
      puts corpus_positive.sentence
      @classifier.train_positive corpus_positive.sentence
    end
 
    # load negative corpus    
    CorpusNegative.all.each do |corpus_negative| 
      @classifier.train_negative corpus_negative.sentence
    end
    
    # load Anew
    CorpusAnew.all.each do |anew|
      if anew.valmnall < 4
        @classifier.train_negative anew.sword
      elsif anew.valmnall >= 4 and anew.valmnall <= 6
        @classifier.train_neutral anew.sword
      elsif anew.valmnall > 6
        @classifier.train_positive anew.sword
      end
    end
  end
        
  def sentiment(str)
    @classifier.classify str
  end  
end
