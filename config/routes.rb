Rails.application.routes.draw do
  root "students#index"
  get 'grades/student/:student_id', to: 'grades#by_student'
  get 'grades/course/:course_id', to: 'grades#by_course'
  post 'user/', to: 'users#authenticate', as: 'authentication_user'
  post 'user/add', to: 'users#add', as: 'add_user_path'
  resources :students, :courses, :grades
end
