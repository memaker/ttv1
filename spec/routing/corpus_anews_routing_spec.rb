require "spec_helper"

describe CorpusAnewsController do
  describe "routing" do

    it "routes to #index" do
      get("/corpus_anews").should route_to("corpus_anews#index")
    end

    it "routes to #new" do
      get("/corpus_anews/new").should route_to("corpus_anews#new")
    end

    it "routes to #show" do
      get("/corpus_anews/1").should route_to("corpus_anews#show", :id => "1")
    end

    it "routes to #edit" do
      get("/corpus_anews/1/edit").should route_to("corpus_anews#edit", :id => "1")
    end

    it "routes to #create" do
      post("/corpus_anews").should route_to("corpus_anews#create")
    end

    it "routes to #update" do
      put("/corpus_anews/1").should route_to("corpus_anews#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/corpus_anews/1").should route_to("corpus_anews#destroy", :id => "1")
    end

  end
end
