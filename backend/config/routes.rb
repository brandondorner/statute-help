# frozen_string_literal: true

Rails.application.routes.draw do
  resources :condition, only: %i[show]
  resources :statute, only: %i[index show]
end
