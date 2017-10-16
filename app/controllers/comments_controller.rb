class CommentsController < ApplicationController

  def comments
  end

  def index
    @photo = Photo.find(params[:photo_id])
    @comments = @photo.comments
    @new_comment = Comment.new #pull from comment model class and use .new method
  end

  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    @username = user.username
    @photo = Photo.find(params[:photo_id])
    # @comments = @photo.comments
    @new_comment = Comment.new(commentParams)
    @new_comment.user = current_user
    @new_comment.photo = @photo
    # redirect_to root_path

    respond_to do |format|
     if @new_comment.save
       format.html { redirect_to root_path, notice: 'Comment was successfully created.' }
       format.json { render :show, status: :created, location: @new_comment }
     else # Validation errors
       format.html { render :index }
       format.json { render json: @new_comment.errors, status: :unprocessable_entity }
     end
   end

    # @comments = Comment.all
    # @comment = Comment.create(commentParams)
    # @comment.save
    # redirect_to photo_comments_path
  end

  def show
    @comments = @photo.comments.new
    @comments = @photo.comments(true)
    @comment = Comment.find(params[:id])
    @username = user.username
  end

  private

  def commentParams
    params.require(:comment).permit(:photo_id, :user_id, :content)
  end

end
