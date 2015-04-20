class CartsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
	def index
		@carts = Cart.all
	end

	def new
		@cart = Cart.new
	end

	def create
		@cart = current_user.carts.create(cart_params)
		if @cart.valid?
			redirect_to root_path
		else
			render :new, :status => :unprocessable_entity
		end
	end

	def show
		@cart = Cart.find(params[:id])
	end

	def edit
		@cart = Cart.find(params[:id])

		if @cart.user !+ current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
	end

	def update
		@cart = Cart.find(params[:id])
		if @cart.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
		@cart.update_attributes(cart_params)
		if @cart.valid?
			redirect_to root_path
		else
			render :edit, :status => :unprocessable_entity
		end
	end

	def destroy
		@cart = Cart.find(params[:id])
		if @cart.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
		@cart.destroy
		redirect_to root_path
	end

	private

	def cart_params
		params.require(:cart).permit(:name, :description, :address)
	end

end
