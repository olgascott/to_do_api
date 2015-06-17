Rails.application.routes.draw do

  scope '/api/1', constraints: { format: :json } do
    resources :lists, only: [:create, :index, :update, :destroy]
    resources :to_dos, only: [:create, :update, :destroy]
  end

end
