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

	def show
		@cart = Cart.find(params[:id])
	end

	def edit
		@cart = Cart.find(params[:id])
	end

	def update
		@cart = Cart.find(params[:id])
		@cart.update_attributes(cart_params)
		redirect_to root_path
	end

	def destroy
		@cart = Cart.find(params[:id])
		@cart.destroy
		redirect_to root_path
	end

	private

	def cart_params
		params.require(:cart).permit(:name, :description, :address)
	end

end
