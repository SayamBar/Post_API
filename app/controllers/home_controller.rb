class HomeController < ApplicationController
  def index
    @posts = Post.page(params[:page] || 1).per(params[:per] || 2)
  end
end
