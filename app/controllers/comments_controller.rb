class CommentsController < ApplicationController
  before_action :set_micropost
  
  # GET /micropost_id/new
  def new
    @comment = Comment.new
  end
  
  # POST /micropost
  # POST /micropost.json
  def create
    @comment = @micropost.comments.new (comment_params)
    @comment.user = User.first

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @micropost, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /micropost/1
  # DELETE /micropost/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      @micropost = Micropost.find_by_id(@comment.micropost_id)
      format.html { redirect_to @micropost, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find_by_id(params[:micropost_id])
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end