Rails.application.routes.draw do
  root to: "application#api_documentation"

  namespace :v1 do
    get 'timeline' => 'timeline_items#index'
  end
end
