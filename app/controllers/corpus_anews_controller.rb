class CorpusAnewsController < ApplicationController
  # GET /corpus_anews
  # GET /corpus_anews.json
  def index
    @corpus_anews = CorpusAnew.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @corpus_anews }
    end
  end

  # GET /corpus_anews/1
  # GET /corpus_anews/1.json
  def show
    @corpus_anews = CorpusAnew.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @corpus_anews }
    end
  end

  # GET /corpus_anews/new
  # GET /corpus_anews/new.json
  def new
    @corpus_anews = CorpusAnew.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @corpus_anews }
    end
  end

  # GET /corpus_anews/1/edit
  def edit
    @corpus_anews = CorpusAnew.find(params[:id])
  end

  # POST /corpus_anews
  # POST /corpus_anews.json
  def create
    @corpus_anews = CorpusAnew.new(params[:corpus_anews])

    respond_to do |format|
      if @corpus_anews.save
        format.html { redirect_to @corpus_anews, notice: 'Corpus anew was successfully created.' }
        format.json { render json: @corpus_anews, status: :created, location: @corpus_anews }
      else
        format.html { render action: "new" }
        format.json { render json: @corpus_anews.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /corpus_anews/1
  # PUT /corpus_anews/1.json
  def update
    @corpus_anews = CorpusAnew.find(params[:id])

    respond_to do |format|
      if @corpus_anews.update_attributes(params[:corpus_anews])
        format.html { redirect_to @corpus_anews, notice: 'Corpus anew was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @corpus_anews.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corpus_anews/1
  # DELETE /corpus_anews/1.json
  def destroy
    @corpus_anews = CorpusAnew.find(params[:id])
    @corpus_anews.destroy

    respond_to do |format|
      format.html { redirect_to corpus_anews_url }
      format.json { head :no_content }
    end
  end
end
