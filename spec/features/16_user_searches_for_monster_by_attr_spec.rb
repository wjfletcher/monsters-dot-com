require "rails_helper"

feature "visitor runs a search from home page and sees results" do
  scenario "visits home and selects a search" do
    user1 = User.create(
      email: "user@example.com",
      password: "password",
      username: "Cool User"
    )
    user2 = User.create(
      email: "user2@example.com",
      password: "password2",
      username: "User 2"
    )
    suzi = User.create(
      email: "suzi@fakeemail.com",
      password: "PASSWORD",
      username: "Suzi Curran",
      admin: true
    )

    balrog = Monster.create(
      user_id: user1.id,
      name: 'Durin\'s Bane',
      source: 'http://lotr.wikia.com/wiki/Durin\'s_Bane',
      img: 'http://static.comicvine.com/uploads/original/5/56730/1086678-balrog2apj.jpg',
      description: 'Durin\'s Bane refers to the particular Balrog of Morgoth that
      had fled following Morgoth\'s defeat during the War of Wrath to live and slumber
      deep within the depths of the Dwarven kingdom of Moria during the Third Age.',
      email: 'Shadow_and_flame@moria.net'
    )

    blooky = Monster.create(
      user_id: user1.id,
      name: 'Napstablook',
      source: 'http://undertale.wikia.com/wiki/Napstablook',
      img: 'https://cdn.thingiverse.com/renders/2f/f2/a6/b2/c5/blooky_preview_featured.jpg',
      description: 'Napstablook, known in the UnderNet as NAPSTABLOOK22, is a
      melancholic ghost monster and musician/DJ who lives in Waterfall, encountered
      in the Ruins as Undertale\'s first miniboss.',
      email: 'Napstablook22@undernet.com'
    )

    cookiemonster = Monster.create(
      user_id: user1.id,
      name: 'Cookie Monster',
      source: 'https://en.wikipedia.org/wiki/Cookie_Monster',
      img: 'http://www.grindtv.com/wp-content/uploads/2013/09/cookiemonster.jpeg',
      description: 'Cookie Monster is a Muppet on the long-running children\'s
      television show Sesame Street. He is best known for his voracious appetite
      and his famous eating phrases, such as "Me want cookie!" "Me eat cookie!"
      and "Om nom nom nom".',
      email: 'mewantcookie@sstreet.org'
    )

    Review.create(
      user_id: suzi.id,
      monster_id: blooky.id,
      grossness: 0, scariness: 0,
      cleverness: 1, bigness: 2,
      badness: 0, body: "The dapperest."
    )

    Review.create(
      user_id: user1.id,
      monster_id: blooky.id,
      grossness: 2, scariness: 6,
      cleverness: 1, bigness: 2,
      badness: 0, body: "Not very cute! Very scary!"
    )

    Review.create(
      user_id: user1.id,
      monster_id: cookiemonster.id,
      grossness: 2, scariness: 1,
      cleverness: 1, bigness: 2,
      badness: 0, body: "Huggable. Yay cookies!"
    )

    Review.create(
      user_id: user2.id,
      monster_id: cookiemonster.id,
      grossness: 4, scariness: 1,
      cleverness: 1, bigness: 2,
      badness: 1, body: "Kinda ragged and covered in crumbs."
    )

    visit home_monsters_path
    click_link 'Cute'

    list_elements = page.all('#monster-list li')

    expect(list_elements[0]).to have_content 'Napstablook'
    expect(list_elements[1]).to have_content 'Cookie Monster'
    expect(list_elements[2]).to have_content 'Durin\'s Bane'

    visit home_monsters_path
    click_link 'Ugly'

    list_elements = page.all('#monster-list li')

    expect(list_elements[1]).to have_content 'Napstablook'
    expect(list_elements[0]).to have_content 'Cookie Monster'
    expect(list_elements[2]).to have_content 'Durin\'s Bane'

    visit home_monsters_path
    click_link 'Silly'

    list_elements = page.all('#monster-list li')

    expect(list_elements[1]).to have_content 'Napstablook'
    expect(list_elements[0]).to have_content 'Cookie Monster'
    expect(list_elements[2]).to have_content 'Durin\'s Bane'

    visit home_monsters_path
    click_link 'Scary'

    list_elements = page.all('#monster-list li')

    expect(list_elements[0]).to have_content 'Napstablook'
    expect(list_elements[1]).to have_content 'Cookie Monster'
    expect(list_elements[2]).to have_content 'Durin\'s Bane'
  end
end
