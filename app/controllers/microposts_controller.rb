class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
  end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
  end

  # GET /microposts/1/edit
  def edit
  end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.created = Time.now
    @micropost.user = current_user
    
    respond_to do |format|
      if @micropost.save
        format.html { redirect_to @micropost, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    if(@micropost.user.id==current_user.id)
      @micropost.destroy
      respond_to do |format|
        format.html { redirect_to microposts_url, notice: 'Micropost was successfully destroyed.' }
        format.json { head :no_content }
      end
    else 
      redirect_to microposts_url, notice: 'NO POTS BORRAR UNA ISSUE QUE NO ES TEVA.'
    end
  end


#upvote_from user
  #downvote_from user
def upvote 
  @micropost = Micropost.find(params[:id])
  @micropost.upvote_by current_user
  redirect_to :issues
end  



def downvote
  @micropost = Micropost.find(params[:id])
  @micropost.downvote_by current_user
  redirect_to :issues
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:title, :description, :user_id, :kind, :priority, :upload)
    end
    
    
end
