Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "students#index"
  get 'grades/student/:student_id', to: 'grades#by_student'
  get 'grades/course/:course_id', to: 'grades#by_course'
  resources :students, :courses, :grades
end
