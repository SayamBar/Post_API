module Users
  class CommentsController < ApplicationController
    # before_action :authenticate_user!
    def create
      @post = Post.find(params[:post_id])
      p params
      # comment_params[:user_id] = current_user.id
      @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
      redirect_to post_path(@post)
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
        redirect_to post_path(@post), status: 303
    end

    private
      def comment_params
        params.require(:comment).permit(:comment)
      end
  end
end    