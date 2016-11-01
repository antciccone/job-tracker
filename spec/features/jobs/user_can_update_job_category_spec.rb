require "rails_helper"

describe "Update a Job's Category" do
  scenario "User can update a job category" do
    category = Category.create(title: "Wed Dev")
    category_two = Category.create(title: "Education")

    company = Company.create(name: "Bonobos", city: "NYC")
    job = Job.create(title: "Developer", description: "Cool Job", level_of_interest: 10, company_id: company.id, category_id: category.id)

    visit companies_path
    click_on "Bonobos"
    click_on "Developer"
    click_on "Edit"
    select('Education', :from => 'job_category_id')
    click_on "Update Job"


    expect(page).to have_content "Education"
    expect(page).to_not have_content "Web Dev"

  end
end
