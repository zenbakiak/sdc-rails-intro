class GagsController < ApplicationController
  before_action :set_gag, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /gags
  # GET /gags.json
  def index
    @gags = Gag.order("created_at DESC").all
  end

  # GET /gags/1
  # GET /gags/1.json
  def show
  end

  # GET /gags/new
  def new
    @gag = Gag.new
  end

  # GET /gags/1/edit
  def edit
  end

  # POST /gags
  # POST /gags.json
  def create
    @gag = Gag.new(gag_params)
    @gag.author_id = current_user.id

    respond_to do |format|
      if @gag.save
        format.html { redirect_to @gag, notice: 'Gag was successfully created.' }
        format.json { render :show, status: :created, location: @gag }
      else
        format.html { render :new }
        format.json { render json: @gag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gags/1
  # PATCH/PUT /gags/1.json
  def update
    respond_to do |format|
      if @gag.update(gag_params)
        format.html { redirect_to @gag, notice: 'Gag was successfully updated.' }
        format.json { render :show, status: :ok, location: @gag }
      else
        format.html { render :edit }
        format.json { render json: @gag.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote
    @vote = @gag.votes.find_by(user_id: current_user.id)
    unless @vote
      @vote = @gag.votes.create(user_id: current_user.id)
    else
      @vote.destroy
    end
    @gag.reload
    respond_to do |format|
      format.js {}
    end
  end

  # DELETE /gags/1
  # DELETE /gags/1.json
  def destroy
    @gag.destroy
    respond_to do |format|
      format.html { redirect_to gags_url, notice: 'Gag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gag
      @gag = Gag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gag_params
      params.require(:gag).permit(:title, :media_file, :votes_count, :comments_count, :author_id)
    end
end
