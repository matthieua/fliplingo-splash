Fliplingo::Application.routes.draw do
  resources :invites, :only => [ :new, :create ]

  root :to => 'invites#new'

end
