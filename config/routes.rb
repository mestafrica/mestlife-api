Rails.application.routes.draw do
  root to: "application#api_documentation"

  namespace :v1 do
    jsonapi_resources :timeline
  end
end
