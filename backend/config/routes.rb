# frozen_string_literal: true

Rails.application.routes.draw do
  resources :statute, only: %i[index show]
end
