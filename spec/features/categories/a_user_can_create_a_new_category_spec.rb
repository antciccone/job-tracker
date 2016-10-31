require 'rails_helper'

describe "A User can create a new category" do
  context "valid params" do
    scenario "A user created a new category that does not exist" do

      title = "Education"

      visit new_category_path
      fill_in "category[title]", with: title

      click_button "Create Category"


      expect(page).to have_content "Education"
      expect(current_path).to eq("/categories/#{Category.first.id}")
    end
  end

  context "invalid params" do
    scenario "a user can not create a category that already exists" do
      Category.create(title: "Technology")

            title = "Technology"

            visit new_category_path
            fill_in "category[title]", with: title
            click_button "Create Category"

      expect(current_path).to eq(new_category_path)
    end
  end
end
