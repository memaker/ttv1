require "spec_helper"

describe CorpusNegativesController do
  describe "routing" do

    it "routes to #index" do
      get("/corpus_negatives").should route_to("corpus_negatives#index")
    end

    it "routes to #new" do
      get("/corpus_negatives/new").should route_to("corpus_negatives#new")
    end

    it "routes to #show" do
      get("/corpus_negatives/1").should route_to("corpus_negatives#show", :id => "1")
    end

    it "routes to #edit" do
      get("/corpus_negatives/1/edit").should route_to("corpus_negatives#edit", :id => "1")
    end

    it "routes to #create" do
      post("/corpus_negatives").should route_to("corpus_negatives#create")
    end

    it "routes to #update" do
      put("/corpus_negatives/1").should route_to("corpus_negatives#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/corpus_negatives/1").should route_to("corpus_negatives#destroy", :id => "1")
    end

  end
end
