Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get "/map", to: "home#map"

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  post "/graphql", to: "graphql#execute"
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
end
