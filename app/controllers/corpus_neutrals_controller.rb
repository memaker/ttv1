class CorpusNeutralsController < ApplicationController
  # GET /corpus_neutrals
  # GET /corpus_neutrals.json
  def index
    @corpus_neutrals = CorpusNeutral.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @corpus_neutrals }
    end
  end

  # GET /corpus_neutrals/1
  # GET /corpus_neutrals/1.json
  def show
    @corpus_neutral = CorpusNeutral.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @corpus_neutral }
    end
  end

  # GET /corpus_neutrals/new
  # GET /corpus_neutrals/new.json
  def new
    @corpus_neutral = CorpusNeutral.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @corpus_neutral }
    end
  end

  # GET /corpus_neutrals/1/edit
  def edit
    @corpus_neutral = CorpusNeutral.find(params[:id])
  end

  # POST /corpus_neutrals
  # POST /corpus_neutrals.json
  def create
    @corpus_neutral = CorpusNeutral.new(params[:corpus_neutral])

    respond_to do |format|
      if @corpus_neutral.save
        format.html { redirect_to @corpus_neutral, notice: 'Corpus neutral was successfully created.' }
        format.json { render json: @corpus_neutral, status: :created, location: @corpus_neutral }
      else
        format.html { render action: "new" }
        format.json { render json: @corpus_neutral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /corpus_neutrals/1
  # PUT /corpus_neutrals/1.json
  def update
    @corpus_neutral = CorpusNeutral.find(params[:id])

    respond_to do |format|
      if @corpus_neutral.update_attributes(params[:corpus_neutral])
        format.html { redirect_to @corpus_neutral, notice: 'Corpus neutral was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @corpus_neutral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corpus_neutrals/1
  # DELETE /corpus_neutrals/1.json
  def destroy
    @corpus_neutral = CorpusNeutral.find(params[:id])
    @corpus_neutral.destroy

    respond_to do |format|
      format.html { redirect_to corpus_neutrals_url }
      format.json { head :no_content }
    end
  end
end
