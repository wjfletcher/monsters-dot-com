require "rails_helper"

feature "user deletes monster from its edit page" do
  scenario "clicks link from show page to edit, then clicks delete" do

    user_1 = User.create(username: "user", email: "user@example.com", password: "password")

    monster_2 = Monster.create(user_id: user_1.id, name: 'Napstablook', source: 'http://undertale.wikia.com/wiki/Napstablook', img: 'https://cdn.thingiverse.com/renders/2f/f2/a6/b2/c5/blooky_preview_featured.jpg', description: 'Napstablook, known in the UnderNet as NAPSTABLOOK22, is a melancholic ghost monster and musician/DJ who lives in Waterfall, encountered in the Ruins as Undertale\'s first miniboss.', email: 'Napstablook22@undernet.com')

    visit root_path
    click_link monster_2.name

    expect(page).to have_content monster_2.name

    click_link 'Edit'

    click_link "Delete"

    expect(page).not_to have_content monster_2.name

  end
end
