require 'rails_helper'

describe "Vists company page by location" do
  scenario "user can see a list of companies sorted by location" do
    Company.create(name: "Bonobos", city: "NYC")
    Company.create(name: "Captian U", city: "Denver")


    visit dashboard_index_path
    click_on "Companies Sorted by Location"

    within("strong:first-child > li:first-child") do
      expect(page).to have_content "Captian U"
    end
  end
end
