class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: (posts)
  end

  def show
    post = Post.find(params[:id])
    render json: (post)
  end

  def create
    post = Post.new(
      title: params[:title],
      body: params[:body],
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
    if post.save
      render json: post
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
