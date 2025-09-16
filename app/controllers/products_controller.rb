class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :find_subcategory

  def index
    @products= @subcategory.products
  end
    
  def show
  end

  def new
    @product= @subcategory.products.build
    @subcategories=Subcategory.all
    @categories=Category.all
  end

  def edit
    @subcategories=Subcategory.all
    @categories=Category.all
  end


  def create
    @product = @subcategory.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to subcategory_products_path(@subcategory), notice: 'Product was successfully created.' }
        format.json { render :index, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def find_sub_category
    category =Category.find(params[:category_id])
    @subcategories=category.subcategories
    render :partial => "subcategories", :object => @subcategories 
  end  
  
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to subcategory_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image, :subcategory_id)
  end

  def find_subcategory
    @subcategory = Subcategory.find(params[:subcategory_id])
  end
end