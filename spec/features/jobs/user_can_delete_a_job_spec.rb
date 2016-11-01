require "rails_helper"

describe "User deletes a job" do
  scenario "user can delete a prexisitng job" do
    category = Category.create(title: "Web Dev")
    company = Company.create(name: "Bonobos", city: "NYC")
    job = Job.create(title: "Developer", description: "Cool Job", level_of_interest: 10, company_id: company.id, category_id: category.id)

    visit companies_path

    click_on "Bonobos"
    click_on "Developer"
    click_on "Delete"
    expect(page).to_not have_content "Developer"
  end
end
