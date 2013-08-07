class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to action: 'index', notice: 'Post successfully created' }
      else
        format.html { render 'new' }
      end
    end
  end

  private

  def post_params
    params[:post].permit!
  end
end
