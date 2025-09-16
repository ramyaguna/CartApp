class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :find_category
  
  def index
    @subcategories = @category.sub_categories
  end
  
  def new
    @subcategory = @category.sub_categories.build
    @categories=Category.all
  end

  def create
    @subcategory = @category.subcategories.build(subcategory_params)

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to category_subcategories_path(@category), notice: 'Subcategory was successfully created.' }
        format.json { render :index, status: :created, location: @subcategory }
      else
        format.html { render :new }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @subcategory.update(subcategory_params)
        format.html { redirect_to @sub_category, notice: 'Subcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @subcategory }
      else
        format.html { render :edit }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subcategory.destroy
    respond_to do |format|
      format.html { redirect_to category_subcategories_url(@category), notice: 'Subcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_subcategory
    @subcategory = SubCategory.find(params[:id])
  end

  def subcategory_params
    params.require(:sub_category).permit(:name, :image, :category_id, :product_id)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end
end