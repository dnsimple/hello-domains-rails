require "rails_helper"

RSpec.feature "Sign in" do
  scenario "with success" do
    user = with_successful_signin

    visit "/"
    expect(page).to have_content(user.email)
  end
end
