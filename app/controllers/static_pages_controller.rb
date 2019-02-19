class StaticPagesController < ApplicationController
  def home
    @posts = Post.preload(:user,:comments).all.order("created_at DESC")
  end

  def about
  end
end
