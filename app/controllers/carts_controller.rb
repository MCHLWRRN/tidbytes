class CartsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]
	def index
		@carts = Cart.all
	end

	def new
		@cart = Cart.new
	end

	def create
		current_user.carts.create(cart_params)
		redirect_to root_path
	end

	private

	def cart_params
		params.require(:cart).permit(:name, :description, :address)
	end

end
