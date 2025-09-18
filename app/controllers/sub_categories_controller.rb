class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :find_category
  
  def index
    @sub_categories = @category.sub_categories
  end
  
  def new
    @sub_category = @category.sub_categories.new
    @categories=Category.all
  end

  def create
    @categories=Category.all
    @sub_category = @category.sub_categories.build(sub_category_params)
    if @sub_category.save
      redirect_to category_sub_categories_path, notice: "sub_category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @sub_category.save
      redirect_to @sub_category, notice: "sub_category was successfully updated."
    else
      render json: @sub_category.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @sub_category.destroy
    respond_to do |format|
      format.html { redirect_to category_sub_categories_url(@category), notice: 'sub_category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_sub_category
    @sub_category = Subcategory.find(params[:id])
  end

  def sub_category_params
    params.require(:sub_category).permit(:name, :image, :category_id, :product_id)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end
end