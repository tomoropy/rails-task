class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @comments = Comment.all.order(created_at: "DESC")
  end

  def new
    @comment = Commetn.new
  end

  def create
  end
end
