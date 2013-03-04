require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CorpusAnewsController do

  # This should return the minimal set of attributes required to create a valid
  # CorpusAnew. As you add validations to CorpusAnew, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "sword" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CorpusAnewsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all corpus_anews as @corpus_anews" do
      corpus_anew = CorpusAnew.create! valid_attributes
      get :index, {}, valid_session
      assigns(:corpus_anews).should eq([corpus_anew])
    end
  end

  describe "GET show" do
    it "assigns the requested corpus_anew as @corpus_anew" do
      corpus_anew = CorpusAnew.create! valid_attributes
      get :show, {:id => corpus_anew.to_param}, valid_session
      assigns(:corpus_anew).should eq(corpus_anew)
    end
  end

  describe "GET new" do
    it "assigns a new corpus_anew as @corpus_anew" do
      get :new, {}, valid_session
      assigns(:corpus_anew).should be_a_new(CorpusAnew)
    end
  end

  describe "GET edit" do
    it "assigns the requested corpus_anew as @corpus_anew" do
      corpus_anew = CorpusAnew.create! valid_attributes
      get :edit, {:id => corpus_anew.to_param}, valid_session
      assigns(:corpus_anew).should eq(corpus_anew)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CorpusAnew" do
        expect {
          post :create, {:corpus_anew => valid_attributes}, valid_session
        }.to change(CorpusAnew, :count).by(1)
      end

      it "assigns a newly created corpus_anew as @corpus_anew" do
        post :create, {:corpus_anew => valid_attributes}, valid_session
        assigns(:corpus_anew).should be_a(CorpusAnew)
        assigns(:corpus_anew).should be_persisted
      end

      it "redirects to the created corpus_anew" do
        post :create, {:corpus_anew => valid_attributes}, valid_session
        response.should redirect_to(CorpusAnew.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved corpus_anew as @corpus_anew" do
        # Trigger the behavior that occurs when invalid params are submitted
        CorpusAnew.any_instance.stub(:save).and_return(false)
        post :create, {:corpus_anew => { "sword" => "invalid value" }}, valid_session
        assigns(:corpus_anew).should be_a_new(CorpusAnew)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CorpusAnew.any_instance.stub(:save).and_return(false)
        post :create, {:corpus_anew => { "sword" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested corpus_anew" do
        corpus_anew = CorpusAnew.create! valid_attributes
        # Assuming there are no other corpus_anews in the database, this
        # specifies that the CorpusAnew created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CorpusAnew.any_instance.should_receive(:update_attributes).with({ "sword" => "MyString" })
        put :update, {:id => corpus_anew.to_param, :corpus_anew => { "sword" => "MyString" }}, valid_session
      end

      it "assigns the requested corpus_anew as @corpus_anew" do
        corpus_anew = CorpusAnew.create! valid_attributes
        put :update, {:id => corpus_anew.to_param, :corpus_anew => valid_attributes}, valid_session
        assigns(:corpus_anew).should eq(corpus_anew)
      end

      it "redirects to the corpus_anew" do
        corpus_anew = CorpusAnew.create! valid_attributes
        put :update, {:id => corpus_anew.to_param, :corpus_anew => valid_attributes}, valid_session
        response.should redirect_to(corpus_anew)
      end
    end

    describe "with invalid params" do
      it "assigns the corpus_anew as @corpus_anew" do
        corpus_anew = CorpusAnew.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CorpusAnew.any_instance.stub(:save).and_return(false)
        put :update, {:id => corpus_anew.to_param, :corpus_anew => { "sword" => "invalid value" }}, valid_session
        assigns(:corpus_anew).should eq(corpus_anew)
      end

      it "re-renders the 'edit' template" do
        corpus_anew = CorpusAnew.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CorpusAnew.any_instance.stub(:save).and_return(false)
        put :update, {:id => corpus_anew.to_param, :corpus_anew => { "sword" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested corpus_anew" do
      corpus_anew = CorpusAnew.create! valid_attributes
      expect {
        delete :destroy, {:id => corpus_anew.to_param}, valid_session
      }.to change(CorpusAnew, :count).by(-1)
    end

    it "redirects to the corpus_anews list" do
      corpus_anew = CorpusAnew.create! valid_attributes
      delete :destroy, {:id => corpus_anew.to_param}, valid_session
      response.should redirect_to(corpus_anews_url)
    end
  end

end