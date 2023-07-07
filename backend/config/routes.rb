# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sentence, only: %i[show]
  resources :statute, only: %i[index show]
end
