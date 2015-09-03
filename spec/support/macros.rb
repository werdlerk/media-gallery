def sign_in(user = nil)
  request.session[:user_id] = (user || FactoryGirl.create(:user)).id
end

def log_in_user(user = nil)
  user ||= FactoryGirl.create(:user)

  visit login_path

  within("form#login") do
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
  end

  click_button "Log in"
end