Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index new show create] do
    resources :doses, only: %i[new create]
  end
  resources :doses, only: :destroy

  # GET 'cocktails', to: 'cocktails#index', as: cocktails
  # GET 'cocktails/new', to: 'cocktails#new', as: new_cocktail
  # GET 'cocktails/:id', to: 'cocktails#show', as: cocktail
  # POST 'cocktails', to: 'cocktails#create'

  # GET 'cocktails/:id/doses/new', to: 'doses#new', as: new_cocktail_dose
  # POST 'cocktails/:id/doses', to: 'doses#create'
  # DELETE 'cocktails/:id/doses/:id', to: 'doses#destroy'
end
