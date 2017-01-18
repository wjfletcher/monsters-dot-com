require "rails_helper"

feature "users can add monsters" do
  scenario "user adds new monster successfully" do

    visit new_monster_path
    expect(page).to have_content "Add a new monster!"

    fill_in 'Name', with: "R.O.U.S."
    fill_in 'Source', with: "http://princessbride.wikia.com/wiki/R.O.U.S."
    fill_in 'Image', with: "http://princessbrideforever.com/site/wp-content/uploads/57_ROUS1.jpg"
    fill_in 'Description', with: "Rodents Of Unusual Size are giant mouse-like creatures that Westley and Buttercup encounter in the Fire Swamp. They are dangerous and don't attack or strike unless they are not out-numbered or smell blood."
    fill_in 'Email Address', with: "rous@fire-swamp.com"

    click_button "Save"

    expect(page).to have_content "R.O.U.S. added successfully"
  end

  scenario "user does not provide proper information for a monster" do

    visit new_monster_path
    expect(page).to have_content "Add a new monster!"

    click_button "Save"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Source can't be blank"
    expect(page).to have_content "Img can't be blank"
  end
end
