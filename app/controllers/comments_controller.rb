class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@cart = Cart.find(params[:cart_id])
		@cart.comments.create(comment_params.merge(:user => current_user))
		redurect_to cart_path(@cart)
	end

	private

	def comment_params
		params.require(:comment).permit(:message, :rating)
	end
end
