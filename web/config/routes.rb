Rails.application.routes.draw do
  get 'home/index'
  get 'styleguide' => 'home#styleguide'

  resources 'projects', except: :index
  get 'projects/download_csv/:id' => 'projects#download_csv', as: 'projects_download_csv'

  get 'developers/get_comment/:id' => 'developers#get_comment', as: 'developers_get_comment'
  get 'developers/:id/:section_id' => 'developers#index', as: 'developers'
  patch 'developers/:id' => 'developers#update', as: 'update_developers'

  get 'managers/get_comment/:id' => 'managers#get_comment', as: 'managers_get_comment'
  get 'managers/:id/:section_id' => 'managers#index', as: 'managers'
  patch 'managers/:id' => 'managers#update', as: 'update_managers'

  get 'quality_controls/get_comment/:id' => 'quality_controls#get_comment', as: 'quality_controls_get_comment'
  get 'quality_controls/:id/:section_id' => 'quality_controls#index', as: 'quality_controls'
  patch 'quality_controls/:id' => 'quality_controls#update', as: 'update_quality_controls'

  root 'home#index'
end
