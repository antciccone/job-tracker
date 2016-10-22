class DashboardController < ApplicationController

  def index
    @job = Job.level_of_interest
    @company = Company.top_three_companies_ranked_by_ever_level_of_interest
    
  end
end
