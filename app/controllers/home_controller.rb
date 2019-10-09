class HomeController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc).page(page).per(3)
  end

  private

  def page
    params[:page] || 1
  end
end
