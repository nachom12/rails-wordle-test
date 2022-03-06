Rails.application.routes.draw do
  post '/creategame/:userId', to: 'games#create'
  post '/play/:userId', to: 'plays#create'
end
