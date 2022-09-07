class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index] # makes it so users must be logged in to use these actions, excluding index

  # before_action :authenticate_post, except: [:index, :create]

  # def correct_user
  #   post = Post.find_by(id: params[:id])
  #   redirect_to unless current_user.id == post.user_id
  # end

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
    post = Post.find_by(id: params[:id])
    if current_user.id == post.user_id
      post.title = params[:title] || post.title
      post.body = params[:body] || post.body
      post.user_id = current_user.id
      post.game_id = params[:game_id]
      if post.save
        render json: post
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if current_user.id == post.user_id
      post.destroy
      render json: { message: "Post successfully deleted." }
    else
      render json: {}, status: :unauthorized
    end
  end
end
