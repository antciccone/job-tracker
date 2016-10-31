class Category < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :jobs

  def format_array
    jobs.pluck(:title).join(", ")
  end

end
