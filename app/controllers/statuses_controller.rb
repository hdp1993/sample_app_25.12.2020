class StatusesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@status = current_user.statuses.build(status_params)
		if @status.save
			flash[:success] = "status created!"
			redirect_to statuses_path
		else
			@status_items = current_user.status.paginate(page: params[:page])
			render 'static_pages/statuses'
		end
	end
	def destroy
		@status.destroy
		flash[:success] = "status deleted"
		redirect_to request.referrer || root_url

	end

	private
	def status_params
		params.require(:status).permit(:user_id, :content, :image)
	end

	def correct_user
		@status = current_user.statuses.find_by(id: params[:id])
		redirect_to root_url if @status.nil?
	end
end