Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root "tops#index"
    get "/takeshi", to: "tops#index"

   get "/images", to: "images#index"
   resources :images, only: [:create, :update, :show ]

end
