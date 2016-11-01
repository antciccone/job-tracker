require "rails_helper"

describe "A User visits a city's show page" do
  scenario "can see a the amount of jobs for a partiuclar city" do
    company = Company.create(name: "Bonobos", city: "NYC")
    Job.create(title: "Web Dev", description: "fun", level_of_interest: 10, company_id: company.id )

        visit dashboard_index_path
        click_on "NYC"

      expect(page).to have_content "City: NYC"
      expect(page).to have_content "Amount of Jobs in: NYC 1"
      expect(page).to have_content "Companies in NYC: Bonobos"
  end
end
