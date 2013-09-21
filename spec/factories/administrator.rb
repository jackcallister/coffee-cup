# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :administrator do
    username              "user"
    sequence(:email)      { |n| "administrator-#{n}@example.com" }
    password              "password"
    password_confirmation "password"
  end
end
