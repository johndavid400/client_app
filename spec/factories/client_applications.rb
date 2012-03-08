FactoryGirl.define do
  factory :client_application do
    billing_address '123 Main St.'
    business_address '900 Forest Ave.'
    business_name 'Acme'
    first_name 'Person'
    last_name 'McPerson'
    city 'Beverly Hills'
    email 'test@example.com'
    number_of_employees 10
    phone_number '555-555-5555'
    years_in_business 2
    zip '90210'
    business_type 'Private'
    revenue '$100k'

    association :user, factory: :user
  end
end
