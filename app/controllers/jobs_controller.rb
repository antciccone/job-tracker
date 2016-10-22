class JobsController < ApplicationController
  def index
    if params.include?("sort")
      @job_all = Job.all.order(:level_of_interest).reverse

      render :interest
    else
    @contact = Contact.new
    @contacts = Contact.all
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    render :index
    end
  end

  def new
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def edit
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      redirect_to company_job_path
    else
      render :show
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end

  def level_of_interest
    a = Job.group(:level_of_interest).count
    result = a.reduce([]) do |array, e|
      array << e.first.to_s + "=>" + Job.find_by(title: e.second).title
      array
      byebug
    end
  end
end
