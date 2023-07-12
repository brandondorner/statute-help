# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sentence, only: %i[show], param: :name
  resources :statute, only: %i[index show], param: :name
end
