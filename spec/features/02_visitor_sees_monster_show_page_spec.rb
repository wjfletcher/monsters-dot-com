require "rails_helper"

feature "visitor sees details for a particular monster" do
  scenario "clicks link from index and sees info for that monster" do

    user1 = User.create(username: "user", email: "user@example.com", password: "password")

    monster1 = Monster.create(
      user_id: user1.id,
      name: 'Durin\'s Bane',
      source: 'http://lotr.wikia.com/wiki/Durin\'s_Bane',
      img: 'http://static.comicvine.com/uploads/original/5/56730/1086678-balrog2apj.jpg',
      description: 'Durin\'s Bane refers to the particular Balrog of Morgoth that had fled following Morgoth\'s defeat during the War of Wrath to live and slumber deep within the depths of the Dwarven kingdom of Moria during the Third Age.',
      email: 'Shadow_and_flame@moria.net')
    monster2 = Monster.create(
      user_id: user1.id,
      name: 'Napstablook',
      source: 'http://undertale.wikia.com/wiki/Napstablook',
      img: 'https://cdn.thingiverse.com/renders/2f/f2/a6/b2/c5/blooky_preview_featured.jpg',
      description: 'Napstablook, known in the UnderNet as NAPSTABLOOK22, is a melancholic ghost monster and musician/DJ who lives in Waterfall, encountered in the Ruins as Undertale\'s first miniboss.',
      email: 'Napstablook22@undernet.com')

    visit root_path
    expect(page).to have_content monster1.name
    click_link monster2.name

    expect(page).to have_content monster2.name
    expect(page).to have_content monster2.description
    expect(page).to have_link(nil, href: ('mailto:' + monster2.email))
    expect(page).to have_link(nil, href: monster2.source)
  end
end
