Rails.application.routes.draw do
  devise_for :users, :skip => [:recoverable]
  #Controller/action
  #get 'home/index'
  #Outra forma de mapeamento.
  get 'bemvindo' => 'home#index'
  #Rota principal.
  root 'home#index'
  
  resources :phones, expect: [:shoq]
  resources :addresses, except: [:show]
  resources :contacts #, except: [:edit]
  resources :kinds, except: [:destroy, :show]

end
