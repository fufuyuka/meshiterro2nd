class PostCommentsController < ApplicationController
  
  def create
    post_image = PostImage.find(params[:post_image_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_image_id = post_image.id
    unless @post_comment.save
      @post_image = post_image
      render template: "post_images/show"
      return
    end
    redirect_to post_image_path(post_image)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end
  
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
