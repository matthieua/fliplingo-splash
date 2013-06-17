Fliplingo::Application.routes.draw do
  resources :interviewees, :only => [ :new, :create ]
  get ':username' => 'interviewees#new'

  root :to => 'interviewees#new'
end
