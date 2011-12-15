# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
      username "MyString"
      email "MyString"
      password "MyString"
      password_confirmation "MyString"
    end
end