# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'backlogs#index'
  resources :backlogs
end
