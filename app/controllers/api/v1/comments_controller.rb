class Api::V1::CommentsController < Api::V1::ApplicationController
    def index
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      render json: @comments, status: 200
    end
  
    def show
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      if @comment
        render json: @comment, status: 200
      else
        render json: {error: "comment not found."}
      end
    end
  
    # def create
    #   @comment = Comment.new(comment_params)
    #   if @comment.save
    #     render json: @comment, status: 200
    #   else
    #     render json: {error: "comment not created"}
    #   end
    # end
  
    # def update
    #   @comment = Comment.find(params[:id])
    #   @comment.update(comment_params)
    #   render json: @comment, status: 200
    # end
  
    # def destroy
    #   @comment = Comment.find(params[:id])
    #   @comment.destroy
    #   render json: Comment.all 
    # end
    private
      def comment_params
        params.require(:comment).permit([:comment,:user_id,:post_id])
      end
  end
  