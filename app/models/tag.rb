class Tag < ActiveRecord::Base
has_many :job_tags
has_many :jobs, through: :job_tags


  def count_jobs
    jobs.count 
  end
end
