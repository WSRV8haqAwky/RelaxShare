class PostCommentsController < ApplicationController

  def create
    post_relax = PostRelax.find(params[:post_relax_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_relax_id = post_relax.id
    comment.save
    redirect_to post_relax_path(post_relax)
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to post_relax_path(params[:post_relax_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
