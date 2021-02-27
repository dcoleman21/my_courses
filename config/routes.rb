Rails.application.routes.draw do
  get '/courses', to: 'courses#index'
  get '/courses/:id', to: 'courses#show'
  get "/students/:id", to: 'students#show'
  post "/register/:course_id", to: 'registration#create', as: :registration
  post "/cancel/course/:course_id/student/:student_id", to: 'registration#destroy', as: :unregister
end
