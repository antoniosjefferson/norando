class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index] # makes it so users must be logged in to use these actions, BESIDES the index

  def index
    posts = Post.all
    render json: (posts)
  end

  # Show action
  # def show
  #   post = Post.find(params[:id])
  #   render json: (post)
  # end

  def create
    post = Post.new(
      title: params[:title],
      body: params[:body],
      user_id: current_user.id,
      game_id: params[:game_id],
    )
    if post.save
      render json: post
    else
      render json: { errors: post.errors.full_messages }, status: 404
    end
  end

  def update
    post = Post.find(params[:id])
    post.title = params[:title] || post.title
    post.body = params[:body] || post.body
    post.user_id = current_user.id
    post.game_id = params[:game_id]
    if post.save
      render json: post
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    render json: { message: "Post successfully deleted." }
  end
end
