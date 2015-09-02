require "rails_helper"

feature "Signing in" do
  given(:user) { FactoryGirl.create(:user) }
  given(:other_user) { FactoryGirl.create(:user) }

  scenario "Signing in with correct credentials" do
    visit root_path
    click_link "Login"

    within("form#login") do
      fill_in 'email', :with => user.email
      fill_in 'password', :with => user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Welcome back'
  end

  scenario "Signing in as another user" do
    visit login_path
    within("form#login") do
      fill_in 'email', :with => other_user.email
      fill_in 'password', :with => other_user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Welcome back'
  end

  scenario 'Signin with invalid credentials' do
    visit login_path

    within("form#login") do
      fill_in 'email', :with => user.email
      fill_in 'password', :with => other_user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Incorrect email or password'
  end
end

feature "Logging out" do
  given(:user) { FactoryGirl.create(:user) }

  scenario "Only able to log out when signed in" do
    visit root_path
    expect(page).not_to have_content "Logout"
  end

  scenario "Logout after logging in" do
    visit root_path
    expect(page).to have_content "Login"

    click_link "Login"
    within("form#login") do
      fill_in 'email', :with => user.email
      fill_in 'password', :with => user.password
    end
    click_button 'Log in'

    expect(page).to have_css '.alert.alert-success'
    expect(page).to have_content 'Logout'
    click_link "Logout"

    expect(page).to have_css '.alert.alert-success'
    expect(page).to have_content "Login"
  end

end

feature "Registration" do

  scenario "Register user" do
    visit root_path
    expect(page).to have_content "Login"
    click_link "Login"

    expect(page).to have_link "Sign up"
    click_link "Sign up"

    expect(page).to have_button "Sign up"
    within("form#register") do
      fill_in "Name", with: 'John Doe'
      fill_in "E-mail address", with: 'test@example.com'
      fill_in "Password", with: 'password'
      fill_in "Password confirmation", with: 'password'
    end
    click_button 'Sign up'

    expect(page).to have_css '.alert.alert-success'
  end

  scenario "Register user with invalid properties" do
    visit register_path
    expect(page).to have_button "Sign up"

    within("form#register") do
      fill_in "E-mail address", with: 'test@example.com'
      fill_in "Password", with: 'password'
      fill_in "Password confirmation", with: 'password'
    end
    click_button 'Sign up'

    expect(page).to have_content "Name can't be blank"
  end

end