class PicksController < ApplicationController
  before_action :set_pick, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:home, :show]
 

  # GET /picks
  # GET /picks.json
  def index
    @picks = Pick.all.order("created_at DESC")
  end
  
  def home
    @picks = Pick.all.order("created_at DESC")
    @category_id = Category
  end

  # GET /picks/1
  # GET /picks/1.json
  def show
     
  end

  # GET /picks/new
  def new
    @pick = current_user.picks.build
  end

  # GET /picks/1/edit
  def edit
  
  end

  # POST /picks
  # POST /picks.json
  def create
    @pick = current_user.picks.build(pick_params)

    respond_to do |format|
      if @pick.save
        format.html { redirect_to @pick, notice: 'Pick was successfully created.' }
        format.json { render :show, status: :created, location: @pick }
      else
        format.html { render :new }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /picks/1
  # PATCH/PUT /picks/1.json
  def update
    respond_to do |format|
      if @pick.update(pick_params)
        format.html { redirect_to @pick, notice: 'Pick was successfully updated.' }
        format.json { render :show, status: :ok, location: @pick }
      else
        format.html { render :edit }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picks/1
  # DELETE /picks/1.json
  def destroy
    @pick.destroy
    respond_to do |format|
      format.html { redirect_to home_path, notice: 'Pick was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def upvote
    @pick = Pick.find(params[:id])
    @pick.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @pick = Pick.find(params[:id])
    @pick.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pick
      @pick = Pick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pick_params
      params.require(:pick).permit(:player, :idea, :category_id)
    end
end
