Rails.application.routes.draw do
  # Show all games
  get "/games" => "games#index"

  # Show specific game
  get "/games/:id" => "games#show"

  # Show all posts
  get "/posts" => "posts#index"

  # Create post
  post "/posts" => "posts#create"

  # Edit post
  patch "/posts/:id" => "posts#update"

  # Sign up
  post "/users" => "users#create"

  # Sign in
  post "/sessions" => "sessions#create"

  # Destroy post
  delete "/posts/:id" => "posts#destroy"

  # Show specific post
  # get "/posts/:id" => "posts#show"
end
