Rails.application.routes.draw do
  root to: "application#api_documentation"

  namespace :v1 do
    get "/pinned" => "timeline_items#pinned"

    jsonapi_resources :comments, except: [:index, :show, :new, :edit]
    jsonapi_resources :likes,    except: [:index, :show, :new, :edit]
    jsonapi_resources :photos,   except: [:index, :show, :new, :edit]

    jsonapi_resources :text_timeline_items
    jsonapi_resources :photo_timeline_items
    jsonapi_resources :timeline_items do
      jsonapi_related_resources :comments
      jsonapi_related_resources :likes
    end
  end
end
