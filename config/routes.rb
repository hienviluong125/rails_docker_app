Rails.application.routes.draw do
  root to: "pages#home"
  post "/graphql", to: "graphql#execute"
end
