Rails.application.routes.draw do
  root to: "application#api_documentation"

  namespace :v1 do
    get :timeline, controller: :timeline_items, action: :index
    jsonapi_resources :comments, except: [:index, :show]
    jsonapi_resources :reactionables do
      jsonapi_related_resources :comments
    end

    jsonapi_resources :timeline_items do
      jsonapi_related_resources :comments
    end
  end
end
