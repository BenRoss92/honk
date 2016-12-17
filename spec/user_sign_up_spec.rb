feature 'Signing up' do
  scenario 'A user can sign up by filling in a form' do
    visit('/honks')
    click_link('Sign Up')
    expect(current_path).to eq("/users/sign_up")
    fill_in('name', with: "Ben")
    fill_in('username', with: "BenRoss92")
    fill_in('email', with: "ben@123.com")
    fill_in('password', with: "password")
    fill_in('password_confirmation', with: "password")
    click_button('Sign Up')
    expect(current_path).to eq('/honks')
    expect(page).to have_content('Welcome Ben!')
  end

  scenario 'A generic welcome message is shown to user not signed up' do
    visit('/honks')
    expect(page).to have_content('Welcome to Honk!')
  end

  scenario "An error is displayed when passwords don't match" do
    visit('/honks')
    click_link('Sign Up')
    expect(current_path).to eq("/users/sign_up")
    fill_in('name', with: "Ben")
    fill_in('username', with: "BenRoss92")
    fill_in('email', with: "ben@123.com")
    fill_in('password', with: "password1")
    fill_in('password_confirmation', with: "password")
    click_button('Sign Up')
    expect(current_path).to eq("/users/sign_up")
    expect(page).to have_content('Passwords do not match')
  end

end
