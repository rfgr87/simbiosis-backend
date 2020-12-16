class PostsController < ApplicationController
  
    def index
      @post = Post.all
      render json: @posts
    end
  
    def show
      @pos = Post.find(params[:id])
      render json: @post
    end
  
    def create
      @theme = Theme.find(params[:theme_id])
      @post = @theme.posts.new(post_params)
      if @post.save
        render json: @post
      else
        render json: {error: @post.errors.full_messages.join(' ')}
      end
    end

    def destroy
      @post = Post.find(params["id"])
      @theme = Theme.find(@post.museum_id)
      if @post
        @post.destroy
        render json: @theme
      else
        render json: {error: 'review not found'}
      end
    end
  
    private
  
    def post_params
      params.require([:text, :date]).permit([:text, :date])
    end
    
end