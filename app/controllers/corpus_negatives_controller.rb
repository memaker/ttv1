class CorpusNegativesController < ApplicationController
  # GET /corpus_negatives
  # GET /corpus_negatives.json
  def index
    @corpus_negatives = CorpusNegative.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @corpus_negatives }
    end
  end

  # GET /corpus_negatives/1
  # GET /corpus_negatives/1.json
  def show
    @corpus_negative = CorpusNegative.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @corpus_negative }
    end
  end

  # GET /corpus_negatives/new
  # GET /corpus_negatives/new.json
  def new
    @corpus_negative = CorpusNegative.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @corpus_negative }
    end
  end

  # GET /corpus_negatives/1/edit
  def edit
    @corpus_negative = CorpusNegative.find(params[:id])
  end

  # POST /corpus_negatives
  # POST /corpus_negatives.json
  def create
    @corpus_negative = CorpusNegative.new(params[:corpus_negative])

    respond_to do |format|
      if @corpus_negative.save
        format.html { redirect_to @corpus_negative, notice: 'Corpus negative was successfully created.' }
        format.json { render json: @corpus_negative, status: :created, location: @corpus_negative }
      else
        format.html { render action: "new" }
        format.json { render json: @corpus_negative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /corpus_negatives/1
  # PUT /corpus_negatives/1.json
  def update
    @corpus_negative = CorpusNegative.find(params[:id])

    respond_to do |format|
      if @corpus_negative.update_attributes(params[:corpus_negative])
        format.html { redirect_to @corpus_negative, notice: 'Corpus negative was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @corpus_negative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corpus_negatives/1
  # DELETE /corpus_negatives/1.json
  def destroy
    @corpus_negative = CorpusNegative.find(params[:id])
    @corpus_negative.destroy

    respond_to do |format|
      format.html { redirect_to corpus_negatives_url }
      format.json { head :no_content }
    end
  end
end
