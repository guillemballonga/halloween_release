class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
  end

  def create
    @micropost = Micropost.find_by_id(params[:micropost_id])
    @upload = Upload.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to  micropost_path(@upload.micropost_id), notice: 'Upload successfull.' }
        #format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

    #if @upload.save
      #redirect_to issue_path(@upload.issues_id), notice: "The resume #{@upload.name} has been uploaded."
    #else
      #render "new"
    #end

  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    @micropost = Micropost.find_by_id(@upload.micropost_id)
    redirect_to @micropost, notice:  "The attachment #{@upload.name} has been deleted."
  end

  private
  def upload_params
    params.require(:upload).permit(:name, :attachment, :micropost_id)
  end

end