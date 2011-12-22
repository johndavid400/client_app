
@user = User.create :email => "jd@isotope11.com", :password => "password", :password_confirmation => "password"
@user.admin = true

if @user.save
  puts "Admin user created"
end

a = ClientApplication.new(:business_name => "Tom's Plumbing", :taxpayer_id_number => "34034903490", :business_address => "293 4th street S.", :business_website => "business.com", :billing_address => "3409 1st street", :parent_company => "ABC Holdings Inc", :dba_name => "Tom's plumbing", :city => "Birmingham", :state_of_residence => "Alabama", :contact_method => "email", :phone_number => "205-434-3434", :years_in_business => "12", :number_of_employees => "23", :zip => "35206", :email => "tom@tom.com")
aa = User.create :email => a.email, :password => "password", :password_confirmation => "password"
a.user_id = aa.id
a.save
a.submit!
puts "App 1 created"

b = ClientApplication.create(:business_name => "John's Carpentry", :taxpayer_id_number => "33422333490", :business_address => "343 6th street S.", :business_website => "carpentry.com", :billing_address => "9489 9th street", :parent_company => "XYZ Holdings Inc", :dba_name => "John's Carpentry", :city => "Birmingham", :state_of_residence => "Alabama", :contact_method => "email", :phone_number => "205-323-3232", :years_in_business => "5", :number_of_employees => "6", :zip => "35206", :email => "john@john.com")
bb = User.create :email => b.email, :password => "password", :password_confirmation => "password"
b.user_id = bb.id
b.save
b.submit!
b.principal_information = b.banking_information = litigation_file_name = business_license_file_name  = 1
b.save
b.requesting!
puts "App 2 created"

c = ClientApplication.create(:business_name => "Mark's Lawn service", :taxpayer_id_number => "09092332390", :business_address => "389 8th street S.", :business_website => "markslawn.com", :billing_address => "903 4th street", :parent_company => "Grass Cutters Inc", :dba_name => "Mark's Lawn service", :city => "Birmingham", :state_of_residence => "Alabama", :contact_method => "email", :phone_number => "205-234-0434", :years_in_business => "32", :number_of_employees => "13", :zip => "35206", :email => "mark@mark.com")
cc = User.create :email => c.email, :password => "password", :password_confirmation => "password"
c.user_id = cc.id
c.save
c.submit!
c.principal_information = b.banking_information = litigation_file_name = business_license_file_name  = 1
c.save
c.requesting!
c.respond!
puts "App 3 created"

d = ClientApplication.create(:business_name => "Terry's Painting", :taxpayer_id_number => "3413490409", :business_address => "123 Thomas street", :business_website => "business.com", :billing_address => "39 2nd street", :parent_company => "Painters Inc", :dba_name => "Terry's painting", :city => "Birmingham", :state_of_residence => "Alabama", :contact_method => "email", :phone_number => "205-433-8884", :years_in_business => "3", :number_of_employees => "3", :zip => "35206", :email => "terry@terry.com")
dd = User.create :email => d.email, :password => "password", :password_confirmation => "password"
d.user_id = dd.id
d.save
d.submit!
d.principal_information = b.banking_information = litigation_file_name = business_license_file_name  = 1
d.save
d.requesting!
d.respond!
d.complete!
puts "App 4 created"

puts "Success!"
