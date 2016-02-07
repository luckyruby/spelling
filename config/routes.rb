Rails.application.routes.draw do
  get 'reset' => 'words#reset'
  get 'incorrect' => 'words#incorrect'
  get 'correct' => 'words#correct'
  post 'check' => 'words#check'
  root 'home#index'
end
