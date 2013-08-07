# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :administrator do
    email                 "user@example.com"
    username              "user"
    password              "password"
    password_confirmation "password"
  end
end
