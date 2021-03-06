require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    category = Category.create(title: "Wed Dev")
    company = Company.create(name: "ESPN", city: "LA")

    job = company.jobs.create(title: "Developer", level_of_interest: 70, category_id: category.id)
    job2 = company.jobs.create(title: "Developer", level_of_interest: 70, category_id: category.id)

    tag = job.tags.create(title: "Software")
    job2.tags << tag


    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("Software - 2")
  end
end
