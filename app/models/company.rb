class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  def self.top_three_companies_ranked_by_ever_level_of_interest
    grouped_company_averages = Job.group(:company_id).average(:level_of_interest)
    sumed = grouped_company_averages.reduce({}) do |hash, (id, average)|
      hash[id] = average.to_f.round(2).to_s
      hash
    end
    sumed.sort_by {|k,v| v}.reverse[0..2]
  end
end
