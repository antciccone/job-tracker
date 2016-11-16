class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :job_tags
  has_many :tags, through: :job_tags 

  def self.level_of_interest
    group(:level_of_interest).count
  end
end
