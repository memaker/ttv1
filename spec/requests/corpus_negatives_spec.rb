require 'spec_helper'

describe "CorpusNegatives" do
  describe "GET /corpus_negatives" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get corpus_negatives_path
      response.status.should be(200)
    end
  end
end
