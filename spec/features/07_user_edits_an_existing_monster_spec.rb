require "rails_helper"

feature "visitor goes to edit page for a particular monster" do
  scenario "and clicks link from show page" do

    user1 = User.create(username: "user", email: "user@example.com", password: "password")

    monster2 = Monster.create(
      user_id: user1.id,
      name: 'Napstablook',
      source: 'http://undertale.wikia.com/wiki/Napstablook',
      img: 'https://cdn.thingiverse.com/renders/2f/f2/a6/b2/c5/blooky_preview_featured.jpg',
      description: 'Napstablook, known in the UnderNet as NAPSTABLOOK22,
      is a melancholic ghost monster and musician/DJ who lives in Waterfall,
      encountered in the Ruins as Undertale\'s first miniboss.',
      email: 'Napstablook22@undernet.com'
    )

    visit root_path
    click_link 'Login'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit monsters_path
    click_link monster2.name

    expect(page).to have_content monster2.name

    click_link 'Edit this monster'

    fill_in 'Name', with: "Blooky"

    click_button "Save"

    expect(page).to have_content "Blooky"

  end
end
