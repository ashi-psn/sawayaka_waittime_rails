Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admin_users
  
  mount Api => '/api'
  mount GrapeSwaggerRails::Engine => '/swagger'
end
