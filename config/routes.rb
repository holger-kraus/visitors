Rails.application.routes.draw do
  #resources :timeslots
  root  "redirect#redirect"
  resources :days, as: "day"
  # resources :weeks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   post 'timeslots/:id' => "timeslots#update"
   get  "weeks/:id" => "weeks#show", as: "week"

  # Defines the root path route ("/")
  # root "timeslot#update"
end
