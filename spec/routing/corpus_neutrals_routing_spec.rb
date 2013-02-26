require "spec_helper"

describe CorpusNeutralsController do
  describe "routing" do

    it "routes to #index" do
      get("/corpus_neutrals").should route_to("corpus_neutrals#index")
    end

    it "routes to #new" do
      get("/corpus_neutrals/new").should route_to("corpus_neutrals#new")
    end

    it "routes to #show" do
      get("/corpus_neutrals/1").should route_to("corpus_neutrals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/corpus_neutrals/1/edit").should route_to("corpus_neutrals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/corpus_neutrals").should route_to("corpus_neutrals#create")
    end

    it "routes to #update" do
      put("/corpus_neutrals/1").should route_to("corpus_neutrals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/corpus_neutrals/1").should route_to("corpus_neutrals#destroy", :id => "1")
    end

  end
end
