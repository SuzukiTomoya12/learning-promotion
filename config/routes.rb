Rails.application.routes.draw do

  get 'reports/index'

  root "reports#index"

end
