require 'rails_helper'

describe "User visits job's interest page" do
  scenario "a user can view all jobs sorted by there city" do

    bonobos = Company.create(name: "Bonobos", city: "NYC")
    Job.create(title: "Developer", description: "Cool Job", level_of_interest: 10, company_id: bonobos.id)
    Job.create(title: "Product Manager", description: "Cool Job", level_of_interest: 5, company_id: bonobos.id)


    visit dashboard_index_path
    
    click_on "Jobs Sorted by Interest"
    expect(page).to have_content "Jobs By Level of Interest"
    expect(page).to have_content "Developer's level of interest 10"

  end
end
