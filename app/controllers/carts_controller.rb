class CartsController < ApplicationController
	def index
		@carts = Cart.all
	end

	def new
		@cart = Cart.new
	end
end
