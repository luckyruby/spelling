Rails.application.routes.draw do
  post 'check' => 'word#check'
  root 'home#index'
end
