Rails.application.routes.draw do
  #resources :timeslots
  root  "redirect#redirect"
  resources :days
  # resources :weeks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   post 'timeslots/:id' => "timeslots#update"
   get  "weeks/:id" => "weeks#show"

  # Defines the root path route ("/")
  # root "timeslot#update"
end
