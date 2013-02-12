require "spec_helper"

describe CorpusPositivesController do
  describe "routing" do

    it "routes to #index" do
      get("/corpus_positives").should route_to("corpus_positives#index")
    end

    it "routes to #new" do
      get("/corpus_positives/new").should route_to("corpus_positives#new")
    end

    it "routes to #show" do
      get("/corpus_positives/1").should route_to("corpus_positives#show", :id => "1")
    end

    it "routes to #edit" do
      get("/corpus_positives/1/edit").should route_to("corpus_positives#edit", :id => "1")
    end

    it "routes to #create" do
      post("/corpus_positives").should route_to("corpus_positives#create")
    end

    it "routes to #update" do
      put("/corpus_positives/1").should route_to("corpus_positives#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/corpus_positives/1").should route_to("corpus_positives#destroy", :id => "1")
    end

  end
end
