Rails.application.routes.draw do
  get 'home/index'

  resources 'projects', except: :index
  get 'developers/:id/:section_id' => 'developers#index', as: 'developers'
  patch 'developers/:id' => 'developers#update', as: 'update_developers'

  root 'home#index'
end
