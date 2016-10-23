class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
    redirect_to category_path(@category)
    else
    render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to category_path
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def before_action
    @category =  Category.find(params[:id])
  end
end
