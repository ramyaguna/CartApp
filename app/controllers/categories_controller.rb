
class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end

  def edit
  end

  def create
    puts current_user
    puts "---------------------"
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
     if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.' 
    else
      render json: @category.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
    
    def category_params
      params.require(:category).permit(:name, :image)
    end
end
