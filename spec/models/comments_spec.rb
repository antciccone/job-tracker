require "rails_helper"

describe Comment do
  describe "validations" do
    it "is valid with a note" do

      comment = Comment.create(notes: "Hi")

      expect(comment).to be_valid
    end

    it "is valid with a job_id" do
      comment = Comment.create(notes: "Hi")
      expect(comment).to be_valid
    end

  describe "relationships" do
    it "a comment belongs to a job" do
      job = Job.create(title: "Web Dev")
      comment = Comment.create(notes: "Hi", job_id: job.id)

      expect(comment.job_id).to eq(job.id)
      end
    end
  end
end
