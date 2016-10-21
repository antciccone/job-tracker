require 'rails_helper'

describe "Creating a contact" do
  scenario "A user can create a contact for a company" do
    company = Company.create(name: "Bonobos", city: "NYC")

    visit companies_path
    click_on "Bonobos"
    fill_in "contact[full_name]", with: "Anthony Ciccone"
    fill_in "contact[email]", with: "aciccone@bu.edu"
    fill_in "contact[position]", with: "Software Developer"

    click_on "Create Contact"

    expect(page).to have_content "Bonobos"
    expect(page).to have_content "Anthony Ciccone"
    expect(page).to have_content "aciccone@bu.edu"
    expect(page).to have_content "Software Developer"
  end
end
