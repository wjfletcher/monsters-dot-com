require "rails_helper"

feature "visitor goes to edit page for a particular monster" do
  scenario "clicks link from show page" do

    monster_2 = Monster.create(name: 'Napstablook', source: 'http://undertale.wikia.com/wiki/Napstablook', img: 'https://cdn.thingiverse.com/renders/2f/f2/a6/b2/c5/blooky_preview_featured.jpg', description: 'Napstablook, known in the UnderNet as NAPSTABLOOK22, is a melancholic ghost monster and musician/DJ who lives in Waterfall, encountered in the Ruins as Undertale\'s first miniboss.', email: 'Napstablook22@undernet.com')

    visit root_path
    click_link monster_2.name

    expect(page).to have_content monster_2.name

    click_link 'Edit'

    fill_in 'Name', with: "Blooky"

    click_button "Save"

    expect(page).to have_content "Blooky"

  end
end
