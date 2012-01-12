# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
      username 'test_user'
      email 'test@example.com'
      password 'password'
      password_confirmation 'password'
    end
end
