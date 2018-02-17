class ProductsController < ApplicationController
  before_action :find_category, only: [:index, :create]

  def index
    products = Product.where(category: @category)
    render json: products
  end

  def create
    product = @category.products.new(products_params)
    if product.save
      render json: product
    else
      render json: { errors: product.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy!
    render json: {}, status: :no_content
  end

  private

  def products_params
    params.require(:product).permit(:name, :price)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end
end
