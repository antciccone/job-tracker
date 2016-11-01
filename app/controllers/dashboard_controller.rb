class DashboardController < ApplicationController

  def index
    @job = Job.level_of_interest
    @company = Company.top_three_companies_ranked_by_ever_level_of_interest
    @companies = Company.all.pluck(:city).uniq
  end
end
