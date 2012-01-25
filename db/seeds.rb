
@user = User.create :email => "admin@example.com", :password => "password", :password_confirmation => "password"
@user.admin = true

if @user.save
  puts "Admin user created"
end

# create States

states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]

states.each do |n|
  State.create :name => n
end

# create apps

a = ClientApplication.new(:business_name => "Tom's Plumbing", :taxpayer_id_number => "34034903490", :business_address => "293 4th street S.", :business_website => "business.com", :billing_address => "3409 1st street", :parent_company => "ABC Holdings Inc", :dba_name => "Tom's plumbing", :city => "Birmingham", :state_id => 1, :contact_method => "email", :phone_number => "205-434-3434", :years_in_business => "12", :number_of_employees => "23", :zip => "35206", :email => "tom@tom.com", :progress => 25, :first_name => "Tom", :last_name => "Jenkins")
aa = User.create :email => a.email, :password => "password", :password_confirmation => "password"
a.user_id = aa.id
a.save
a.submit!
puts "App 1 created"

b = ClientApplication.create(:business_name => "John's Carpentry", :taxpayer_id_number => "33422333490", :business_address => "343 6th street S.", :business_website => "carpentry.com", :billing_address => "9489 9th street", :parent_company => "XYZ Holdings Inc", :dba_name => "John's Carpentry", :city => "Birmingham", :state_id => 1, :contact_method => "email", :phone_number => "205-323-3232", :years_in_business => "5", :number_of_employees => "6", :zip => "35206", :email => "john@john.com", :progress => 50, :first_name => "John", :last_name => "Cooper")
bb = User.create :email => b.email, :password => "password", :password_confirmation => "password"
b.user_id = bb.id
b.save
b.submit!
b.principal_information = b.banking_information = litigation_file_name = business_license_file_name  = 1
b.save
b.requesting!
puts "App 2 created"

c = ClientApplication.create(:business_name => "Mark's Lawn service", :taxpayer_id_number => "09092332390", :business_address => "389 8th street S.", :business_website => "markslawn.com", :billing_address => "903 4th street", :parent_company => "Grass Cutters Inc", :dba_name => "Mark's Lawn service", :city => "Birmingham", :state_id => 1, :contact_method => "email", :phone_number => "205-234-0434", :years_in_business => "32", :number_of_employees => "13", :zip => "35206", :email => "mark@mark.com", :progress => 75, :first_name => "Mark", :last_name => "Thomas")
cc = User.create :email => c.email, :password => "password", :password_confirmation => "password"
c.user_id = cc.id
c.save
c.submit!
c.principal_information = b.banking_information = litigation_file_name = business_license_file_name  = 1
c.save
c.requesting!
c.respond!
puts "App 3 created"

d = ClientApplication.create(:business_name => "Terry's Painting", :taxpayer_id_number => "3413490409", :business_address => "123 Thomas street", :business_website => "business.com", :billing_address => "39 2nd street", :parent_company => "Painters Inc", :dba_name => "Terry's painting", :city => "Birmingham", :state_id => 1, :contact_method => "email", :phone_number => "205-433-8884", :years_in_business => "3", :number_of_employees => "3", :zip => "35206", :email => "terry@terry.com", :progress => 100, :first_name => "Terry", :last_name => "Bradshaw")
dd = User.create :email => d.email, :password => "password", :password_confirmation => "password"
d.user_id = dd.id
d.save
d.submit!
d.principal_information = b.banking_information = litigation_file_name = business_license_file_name  = 1
d.save
d.requesting!
d.respond!
d.complete!
d.principal_information_forms.create(name: "Terry", alternate_name: "T-dog", ssn: "202-23-1132", dob: "1/23/1956", dl_number: "2039340934", street_address: "2309 street rd", city: "Birmingham", state: "Alabama", zip: "23234", county: "Jefferson", prev_street_address: "324090 street", prev_city: "Atlanta", prev_state: "GA", prev_zip: "343434", prev_county: "Lanette", position: "Owner", company: "Terry's painting", years_with_company: "12", prev_employer: "none", date: "2/23/2012")
d.banking_information_forms.create(bank_name: "Compass Bank", bank_address: "233 greensprings", contact_person: "Tina", phone_number: "324-3434", previous_bank: "Regions")
d.attachments.create(:description => "Foo doc", :document => File.open(File.join(Rails.root, "db", "seeds", "foo.txt")))
d.attachments.create(:description => "Bar pdf", :document => File.open(File.join(Rails.root, "db", "seeds", "bar.pde")))
d.attachments.create(:description => "Bank statement", :document => File.open(File.join(Rails.root, "db", "seeds", "bank_statement.pdf")))
d.attachments.create(:description => "Charter", :document => File.open(File.join(Rails.root, "db", "seeds", "charter.pdf")))
d.attachments.create(:description => "Business License", :document => File.open(File.join(Rails.root, "db", "seeds", "business_license.pdf")))
puts "App 4 created"

puts "Success!"


