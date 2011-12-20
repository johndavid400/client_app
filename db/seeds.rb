
@user = User.create :email => "jd@isotope11.com", :password => "password", :password_confirmation => "password"
@user.admin = true
if @user.save
  puts "Admin user created"
end

