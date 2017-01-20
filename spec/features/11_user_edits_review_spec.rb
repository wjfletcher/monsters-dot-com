require "rails_helper"

feature "user edits existing review" do
  scenario "clicks link from monster show page and sees appropriate fields" do
    user1 = User.create(email: "user@example.com", password: "password")

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
    click_link 'Login'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    review1 = Review.create(grossness: 3, scariness: 5, cleverness: 2, bigness: 6, badness: 4, body: "Stupid scary monster!", user_id: user1.id, monster_id: this_monster.id)

    visit root_path
    click_link this_monster.name
    expect(page).to have_content("Grossness level: 3/6")
    click_link 'Edit review'

    expect(page).to have_content("grossness level")
    expect(page).to have_content("scariness level")
    expect(page).to have_content("cleverness level")
    expect(page).to have_content("Cute")
    expect(page).to have_content("Ugly")
    expect(page).to have_content("Additional feedback on this monster?")

    fill_in "This monster's grossness level:", with: 4
    fill_in "This monster's scariness level:", with: 6
    fill_in "This monster's cleverness level:", with: 5
    fill_in "This monster's bigness level:", with: 6
    fill_in "This monster's badness level:", with: 5
    fill_in "Additional feedback on this monster?", with: "You shall not pass!"

    click_button "Submit"

    expect(page).to have_content("Rating was successfully updated")
    expect(page).to have_content("Grossness level: 4/6")
    expect(page).to have_content("Cleverness level: 5/6")
    expect(page).to have_content("Bigness level: 6/6")
    expect(page).to have_content("You shall not pass!")

  end

end
