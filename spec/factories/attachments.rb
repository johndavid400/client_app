# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
      name "MyString"
      file_uid "MyString"
      file_name "MyString"
      client_application_id 1
    end
end