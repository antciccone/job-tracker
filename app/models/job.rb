class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.level_of_interest
    group(:level_of_interest).count
    # result = a.reduce([]) do |array, e|
    #   array << e.first.to_s + "=>" + Job.find(e.second).title
    #   array
  end
end
