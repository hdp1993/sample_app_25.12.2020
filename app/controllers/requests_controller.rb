class RequestsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy
	def create
		@request = current_user.requests.build(request_params)
		@request.image.attach(params[:request][:image])
		if @request.save
			flash[:success] = "requests created!"
			redirect_to root_url
		else
			@request_items = current_user.request.paginate(page: params[:page])
			render 'static_pages/home'
		end
	end
	def destroy
		@request.destroy
		flash[:success] = "Request deleted"
		redirect_to request.referrer || root_url
	end
	private
	def request_params
		params.require(:request).permit(:conten, :image)
	end
	def correct_user
		@request = current_user.requests.find_by(id: params[:id])
		redirect_to root_url if @request.nil?
	end
end