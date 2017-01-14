Rails.application.routes.draw do

  root 'index#index'

  resources :hospitals, :employees

  put '/hospitals/:id/:employee_id/delete_habtm' => 'hospitals#delete_habtm', as: :delete_habtm
  put '/hospitals/:id/:employee_id/save_to_habtm' => 'hospitals#save_to_habtm', as: :save_to_habtm

end
