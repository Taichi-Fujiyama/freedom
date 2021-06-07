class PostsController < ApplicationController
  def create
    @post = Post.new(
      user_id:@current_user.id
      )
  end
  
  def index
  end
end
