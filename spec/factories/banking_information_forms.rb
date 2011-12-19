# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :banking_information_form do
      bank_name "MyString"
      bank_address "MyString"
      contact_person "MyString"
      phon_number "MyString"
      previous_bank "MyString"
    end
end