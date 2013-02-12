class Bayes 
  def initialize(options)
    @options = options
    puts @options['bayes_file']
  end
  
  def sentiment(str)
    "positive"
  end
end
