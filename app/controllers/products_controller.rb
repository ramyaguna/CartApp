class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :find_sub_category

  def index
    @products= @sub_category.products
  end
    
  def show
  end

  def new
    @product= @sub_category.products.build
    @subcategories=SubCategory.all
    @categories=Category.all
  end

  def edit
    @subcategories=sub_category.all
    @categories=Category.all
  end


  def create
    @product = @sub_category.products.build(product_params)
    if @product.save
      redirect_to sub_category_products_path, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
     if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render json: @category.errors, status: :unprocessable_entity 
    end
  end

  def find_sub_category
    category =Category.find(params[:category_id])
    @sub_categories=category.sub_categories
    render :partial => "subcategories", :object => @sub_categories 
  end  
  
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to sub_category_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image, :sub_category_id)
  end

  def find_sub_category
    @sub_category = SubCategory.find(params[:sub_category_id])
  end
end