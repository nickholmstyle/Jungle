class Admin::CatagoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Category created!'
    else
      render :new
    end
  end

  private
  
  def categories_params
    params.require(:category).permit(
      :name
    )
  end
end