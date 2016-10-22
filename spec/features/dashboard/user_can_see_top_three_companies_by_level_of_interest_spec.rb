require 'rails_helper'

describe "average level of interest" do
  it "can pull top three companies by average level of interest" do
    bonobos = Company.create(name: "Bonobos", city: "NYC")
    casper = Company.create(name: "Casper", city: "NYC")
    blue_apron = Company.create(name: "Blue Apron", city: "NYC")

    job_one = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 10, company_id: bonobos.id)
    job_two = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 5, company_id: bonobos.id)
    job_three = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 10, company_id: casper.id)
    job_four = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 2, company_id: casper.id)
    job_five = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 5, company_id: blue_apron.id)
    job_six = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 6, company_id: blue_apron.id)


    visit dashboard_index_path

    expect(page).to have_content "Top Three Companies Average Level of interest"
    expect(page).to have_content "Bonobos's jobs have a 7.5 average level of Interest"
    expect(page).to have_content "Casper's jobs have a 6.0 average level of Interest"
    expect(page).to have_content  "Blue Apron's jobs have a 5.5 average level of Interest"

  end
end
