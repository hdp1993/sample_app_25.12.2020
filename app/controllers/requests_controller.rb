class RequestsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
  
    @request = current_user.requests.build(request_params)
    if @request.save
      flash[:success] = "request created!"
      redirect_to requests_path
    else
      @request_items = current_user.request.paginate(page: params[:page])
      render "static_pages/requests"
    end
  end

  def destroy
    @request.destroy
    flash[:success] = "request deleted"
    redirect_to request.referrer || root_url

  end

  private

  def request_params
    params.require(:request).permit(:image, :conten)
  end

  def correct_user
    @request = current_user.requests.find_by(id: params[:id])
    redirect_to root_url if @request.nil?
  end
end
