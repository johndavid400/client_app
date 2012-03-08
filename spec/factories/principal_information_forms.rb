# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :principal_information_form do
      name "MyString"
      alternate_name "MyString"
      ssn "MyString"
      dob "MyString"
      dl_number "MyString"
      dl_state "MyString"
      street_address "MyString"
      city "MyString"
      state "MyString"
      zip "MyString"
      county ""
      prev_street_address "MyString"
      prev_city "MyString"
      prev_state "MyString"
      prev_zip "MyString"
      prev_county "MyString"
      position "MyString"
      company "MyString"
      years_with_company "MyString"
      prev_employer "MyString"
      date "MyString"
    end
end
