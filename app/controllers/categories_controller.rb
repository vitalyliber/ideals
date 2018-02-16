class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories
  end

  def create
    category = Category.new(categories_params)
    if category.save
      render json: category
    else
      render json: { errors: category.errors }, status: :unprocessable_entity
    end
  end

  private

  def categories_params
    params.require(:category).permit(:name)
  end
end
