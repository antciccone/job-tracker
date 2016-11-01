class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.level_of_interest
    group(:level_of_interest).count
  end
end
