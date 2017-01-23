require "rails_helper"

feature "visitor can add, change, and remove votes" do
  scenario "clicks buttons in review and changes vote accordingly" do
    user1 = User.create(email: "user@example.com", password: "password")

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

    visit root_path
    click_link this_monster.name
    click_link "Rate this monster"

    fill_in "This monster's grossness level:", with: 4
    fill_in "This monster's scariness level:", with: 6
    fill_in "This monster's cleverness level:", with: 5
    fill_in "This monster's bigness level:", with: 6
    fill_in "This monster's badness level:", with: 5
    fill_in "Additional feedback on this monster?", with: "You shall not pass!"

    click_button "Submit"

    click_button('+')

    expect(page).to have_content("1 user(s) agree(s)")
    expect(page).to have_content("0 user(s) disagree(s)")

    click_button('-')

    expect(page).to have_content("1 user(s) disagree(s)")
    expect(page).to have_content("0 user(s) agree(s)")

    click_button('-')

    expect(page).to have_content("0 user(s) agree(s)")
    expect(page).to have_content("0 user(s) disagree(s)")

  end
end
