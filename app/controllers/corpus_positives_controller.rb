class CorpusPositivesController < ApplicationController
  # GET /corpus_positives
  # GET /corpus_positives.json
  def index
    @corpus_positives = CorpusPositive.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @corpus_positives }
    end
  end

  # GET /corpus_positives/1
  # GET /corpus_positives/1.json
  def show
    @corpus_positive = CorpusPositive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @corpus_positive }
    end
  end

  # GET /corpus_positives/new
  # GET /corpus_positives/new.json
  def new
    @corpus_positive = CorpusPositive.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @corpus_positive }
    end
  end

  # GET /corpus_positives/1/edit
  def edit
    @corpus_positive = CorpusPositive.find(params[:id])
  end

  # POST /corpus_positives
  # POST /corpus_positives.json
  def create
    @corpus_positive = CorpusPositive.new(params[:corpus_positive])

    respond_to do |format|
      if @corpus_positive.save
        format.html { redirect_to @corpus_positive, notice: 'Corpus positive was successfully created.' }
        format.json { render json: @corpus_positive, status: :created, location: @corpus_positive }
      else
        format.html { render action: "new" }
        format.json { render json: @corpus_positive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /corpus_positives/1
  # PUT /corpus_positives/1.json
  def update
    @corpus_positive = CorpusPositive.find(params[:id])

    respond_to do |format|
      if @corpus_positive.update_attributes(params[:corpus_positive])
        format.html { redirect_to @corpus_positive, notice: 'Corpus positive was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @corpus_positive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corpus_positives/1
  # DELETE /corpus_positives/1.json
  def destroy
    @corpus_positive = CorpusPositive.find(params[:id])
    @corpus_positive.destroy

    respond_to do |format|
      format.html { redirect_to corpus_positives_url }
      format.json { head :no_content }
    end
  end
end
