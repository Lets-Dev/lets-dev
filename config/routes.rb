Rails.application.routes.draw do
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  ActiveAdmin.routes(self)

  namespace :manager do
    resources :dashboard, only: [:index]
    resources :language_sets, only: [:index, :show]
    resources :missing, only: [:index, :show]
    resources :challenges, only: [:index, :show]
    resources :jury_challenge_membership_requests, only: [:create]
    resources :teams
    resources :team_user_membership_requests, only: [:create] do
      get :accept, on: :member
      get :decline, on: :member
    end
    resources :team_challenge_memberships, only: [:create]
    resources :desks, only: [:index, :show]
    resources :jury_challenge_rates, only: [:new, :create]
    resources :me do
      get :security, on: :collection
      get :overview, on: :collection
      get :edit, on: :collection
      get :social, on: :collection
      patch :update, on: :collection
      patch :update_password, on: :collection
      patch :update_avatar, on: :collection
      patch :update_locale, on: :collection
      delete :facebook, on: :collection
      delete :github, on: :collection
      delete :google, on: :collection
    end

    root to: 'dashboard#index'
  end

  resources :home, only: :index
  resources :challenges, only: [:index, :show]
  resources :jury_challenge_membership_invitations, only: [] do
    get :accept, on: :member
    get :decline, on: :member
  end
  resources :team_user_membership_invitations, only: [] do
    get :accept, on: :member
    get :decline, on: :member
  end

  root to: 'home#index'
end
