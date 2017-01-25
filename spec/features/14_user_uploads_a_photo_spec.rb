require 'spec_helper'

feature 'user creates an account and uploads an image' do

  scenario 'under 10MB' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Username', with: 'user'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    page.attach_file('Avatar', Rails.root + 'spec/fixtures/test_image.jpg')
    click_button 'Sign up'
    expect(page).to have_content("signed up successfully")

    visit user_path(User.first.id)

    expect(page.find('.profile-avatar')['src']).to have_content 'test_image.jpg'
  end

    scenario 'over 10MB' do
      visit root_path
      click_link 'Sign up'
      fill_in 'Username', with: 'user'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      page.attach_file('Avatar', Rails.root + 'spec/fixtures/test_image_over_max_size.png')
      click_button 'Sign up'
      expect(page).to have_content("1 error prohibited this user from being saved")
    end

    scenario 'that is not an image' do
      visit root_path
      click_link 'Sign up'
      fill_in 'Username', with: 'user'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      page.attach_file('Avatar', Rails.root + 'spec/fixtures/test.docx')
      click_button 'Sign up'
      expect(page).to have_content("1 error prohibited this user from being saved")
    end
end
