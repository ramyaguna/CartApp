class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
    if current_user
      cart = current_user.cart || Cart.create(:user => current_user)
      @current_cart = cart
    elsif session[:cart_id]
      @current_cart = Cart.where(:id => session[:cart_id]).first || Cart.create
    else
      @current_cart = Cart.create
    end
    return @current_cart
  end

  def access_control
    @user = User.all
    authorize! :read, Product, Category, Subcategory
  end
end