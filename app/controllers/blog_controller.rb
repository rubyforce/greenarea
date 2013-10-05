class BlogController < ApplicationController
  def index
    @posts = PostsDecorator.decorate(Post.page(params[:page]))
  end
end
