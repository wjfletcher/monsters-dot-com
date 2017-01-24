require "rails_helper"

feature "admin can see list of users" do
  scenario "admin views list of users" do

    User.create(username: "admin", email: "admin@example.com", password: "password", admin: true)
    User.create(username: "Sam", email: "sam@example.com", password: "password")
    User.create(username: "Bob", email: "bob@example.com", password: "password")

    visit root_path
    click_link 'Login'
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Manage users'

    expect(page).to have_content "User Management"
    expect(page).to have_content "Sam"
    expect(page).to have_content "Bob"

    click_link 'Sam'

    expect(page).to have_content "sam@example.com"
    expect(page).to have_content "Delete User"
  end

  scenario "admin deletes user" do

    User.create(username: "admin", email: "admin@example.com", password: "password", admin: true)
    User.create(username: "Sam", email: "sam@example.com", password: "password")
    User.create(username: "Bob", email: "bob@example.com", password: "password")

    visit root_path
    click_link 'Login'
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Manage users'

    expect(page).to have_content "User Management"
    expect(page).to have_content "Sam"
    expect(page).to have_content "Bob"

    click_link 'Sam'

    expect(page).to have_content "sam@example.com"
    expect(page).to have_content "Delete User"

    click_link 'Delete User'

    expect(page).to have_content "User was successfully destroyed."

  end
end
