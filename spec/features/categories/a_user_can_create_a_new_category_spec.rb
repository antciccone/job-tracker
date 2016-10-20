require 'rails_helper'

describe "A User can create a new category" do
  scenario "A user created a new category that does not exist" do

    title = "Education"

    visit new_category_path
    fill_in "category[title]", with: title
    click_button "Create"


    expect(page).to have_content "Education"
    expect(current_path).to eq("/categories/#{Category.first.id}")
  end
end
