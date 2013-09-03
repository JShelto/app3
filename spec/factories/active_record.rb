FactoryGirl.define do 

factory :user do
    username 'exampleuser'
    email 'example@email.com'
    password 'example'
    password_confirmation 'example' 
end

factory :user_params, class:Hash do
  username 'Name'
  email 'user@email.com'
  password 'password'
  password_confirmation 'password'
  initialize_with { attributes } 
end

factory :invalid_user_params, class:Hash do
  email 'things'
  password '6'
  initialize_with { attributes }
end

end