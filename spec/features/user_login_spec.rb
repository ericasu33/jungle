require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do

  before :each do
    @user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "john@smith.com",
      password: "123456",
      password_confirmation: "123456"
    )
  end

  scenario "User can login and redirected to homepage once signed in" do
    # ACT
    visit '/login'

    fill_in 'email', with: "John@smith.com"
    fill_in 'password', with: "123456"

    find("div.row").find_button('Login').click

    expect(page).to have_content 'john@smith.com'

    # DEBUG / VERIFY
    # save_screenshot
  end

end