require 'rails_helper'

describe "Creating a new comment" do
  scenario "A user adds a comment to a specific job" do
    company = Company.create(name: "Bonobos", city: "NYC")
    job = Job.create(title: "Software Dev", company_id: company.id, description:"Ruby on Rails", level_of_interest: 10)

    visit companies_path
    click_on "Bonobos"
    click_on "Software Dev"
    fill_in "comment[notes]", with: "Interview went well"
    click_on "Create Comment"

    expect(page).to have_content "Interview went well"
    expect(page).to have_content "less than a minute ago"
  end
end
