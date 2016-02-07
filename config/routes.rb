Rails.application.routes.draw do
  get 'reset' => 'words#reset'
  get 'incorrect' => 'words#incorrect'
  post 'check' => 'words#check'
  root 'home#index'
end
