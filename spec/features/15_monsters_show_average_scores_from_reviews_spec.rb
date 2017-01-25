require "rails_helper"

feature "monster show page displays average scores for attributes based on reviews" do
  scenario "two users submit reviews for a monster" do
    user1 = User.create(username: "user", email: "user@example.com", password: "password")

    visit root_path
    click_link 'Login'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    this_monster = Monster.create(
      user_id: user1.id,
      name: 'Durin\'s Bane',
      source: 'http://lotr.wikia.com/wiki/Durin\'s_Bane',
      img: 'http://static.comicvine.com/uploads/original/5/56730/1086678-balrog2apj.jpg',
      description: 'Durin\'s Bane refers to the particular Balrog of Morgoth that
      had fled following Morgoth\'s defeat during the War of Wrath to live and
      slumber deep within the depths of the Dwarven kingdom of Moria during the Third Age.',
      email: 'Shadow_and_flame@moria.net'
    )

    visit monsters_path
    click_link this_monster.name
    click_link "Rate this monster"

    fill_in "This monster's grossness level:", with: 4
    fill_in "This monster's scariness level:", with: 6
    fill_in "This monster's cleverness level:", with: 5
    fill_in "This monster's bigness level:", with: 6
    fill_in "This monster's badness level:", with: 6
    fill_in "Additional feedback on this monster?", with: "You shall not pass!"

    click_button "Submit"
    visit root_path
    click_link 'Logout'

    user2 = User.create(username: "user2", email: "user2@example.com", password: "password2")

    visit root_path
    click_link 'Login'
    fill_in 'Email', with: 'user2@example.com'
    fill_in 'Password', with: 'password2'
    click_button 'Log in'

    visit monsters_path
    click_link this_monster.name
    click_link "Rate this monster"

    fill_in "This monster's grossness level:", with: 2
    fill_in "This monster's scariness level:", with: 4
    fill_in "This monster's cleverness level:", with: 6
    fill_in "This monster's bigness level:", with: 6
    fill_in "This monster's badness level:", with: 5
    fill_in "Additional feedback on this monster?", with: "You shall not pass!"

    expect(page).to have_content("Average grossness level: 3/6")
    expect(page).to have_content("Average scariness level: 5/6")
    expect(page).to have_content("Average cleverness level: 5/6")
    expect(page).to have_content("Average bigness level: 6/6")
    expect(page).to have_content("Average badness level: 5/6")

  end
end
