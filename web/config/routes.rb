Rails.application.routes.draw do
  get 'home/index'

  resources 'projects', except: :index
  resources 'developers'

  root 'home#index'
end
