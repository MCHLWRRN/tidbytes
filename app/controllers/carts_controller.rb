class CartsController < ApplicationController
	def index
		@carts = Cart.all
	end

	def new
		@cart = Cart.new
	end

	def create
		Cart.create(cart_params)
		redirect_to root_path
	end

	private

	def cart_params
		params.require(:cart).permit(:name, :description, :address)
	end

end
