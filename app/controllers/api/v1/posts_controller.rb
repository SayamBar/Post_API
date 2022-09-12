class Api::V1::PostsController < Api::V1::ApplicationController
    def index
      @posts = Post.all

      @posts = @posts.page(params[:page] || 1).per(params[:per] || 2)
      
      if params[:user_id]
        @posts = @posts.where(user_id: params[:user_id])
      end
      # @posts = filter(Post.all)
      render json: @posts, status: 200
    end
  
    def show
      @post = Post.find(params[:id])
      if @post
        render json: @post, status: 200
      else
        render json: {error: "post not found."}
      end
    end
  
    def create
      @post = Post.new(title: params[:title],body: params[:body],user_id: params[:user_id])
      if @post.save
        render json: @post, status: 200
      else
        render json: {error: "post not created"}
      end
    end
  
    def update
      @post = Post.find(params[:id])
      @post.update(title: params[:title],body: params[:body],user_id: params[:user_id])
      render json: @post, status: 200
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      render json: Post.all 
    end
    private
      def post_params
        params.require(:post).permit([:title,:body,:user_id])
      end
      
      # def filter_params
      #   params.fetch(:filter, {})
      # end
      # def filter(relation)
      #   return relation unless filter_params.any?
      #   relation.where(filter_params)
      # end

      
  end
  