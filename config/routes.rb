Rails.application.routes.draw do
  get "/games" => "games#index"
  get "/games/:id" => "games#show"
  get "/posts" => "posts#index"
  get "/posts/:id" => "posts#show"
  post "/posts" => "posts#create"
end
