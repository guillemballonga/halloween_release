class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  # GET /microposts
  # GET /microposts.json
  def index
    @q = params[:q]
    @status1 = params[:status1]
    @status2 = params[:status2]
    @user = params[:user]
    @watching = params[:watching]
    
    if @q
      @microposts = Micropost.where("title LIKE ? OR id = ?", "%" + @q + "%", @q)
    else
      @microposts = Micropost.all
    end 
    
    if @status1 && @status2 
      @microposts = @microposts.where(status: [:neww, :open])
    elsif @user
      @microposts = @microposts.where("user_id = ?", current_user.id)
    end
    
    @s = params[:sort]
    @d = params[:direction]
    if @s && @d
      @microposts = @microposts.order(@s + ' ' + @d)
    end
        
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
      @description = @micropost.description
      @title = @micropost.title  
      @priority = @micropost.priority
      @kind = @micropost.kind 
      @status = @micropost.status 
      if @micropost.update(micropost_params)
        if(@title.to_s != @micropost.title.to_s)
          @comment = @micropost.comments.new
          @comment.body = "Changed title to " + @micropost.title.to_s
          @comment.user = User.new
          @comment.save
        end
        if(@priority.to_s != @micropost.priority.to_s)
          @comment = @micropost.comments.new
          @comment.body = "Priority changed from "+ @priority.to_s + " to " + @micropost.priority.to_s
          @comment.user = User.new
          @comment.save
        end
        if(@kind.to_s != @micropost.kind.to_s)
          @comment = @micropost.comments.new
          @comment.body = "Kind changed from "+ @kind.to_s + " to " + @micropost.kind.to_s
          @comment.user = User.new
          @comment.save
        end
        if(@status.to_s != @micropost.status.to_s)
          @comment = @micropost.comments.new
          @comment.body = "Status changed from "+ @status.to_s + " to " + @micropost.status.to_s
          @comment.user = User.new
          @comment.save
        end
        if(@description.to_s != @micropost.description.to_s)
          @comment = @micropost.comments.new
          @comment.body = "Description changed to " + @micropost.description.to_s
          @comment.user = User.new
          @comment.save
        end
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
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to microposts_url, notice: 'Micropost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #upvote_from user
    #downvote_from user
  def upvote 
    @micropost = Micropost.find(params[:id])
    @micropost.upvote_by current_user
    redirect_to @micropost
  end  
  
  def downvote
    @micropost = Micropost.find(params[:id])
    @micropost.downvote_by current_user
    redirect_to @micropost
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:title, :description, :user_id, :kind, :priority, :status, :upload)
    end
    
    
end
