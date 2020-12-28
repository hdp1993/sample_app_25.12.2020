class StaticPagesController < ApplicationController
  def home
   if logged_in?
    @micropost = current_user.microposts.build
    @status = current_user.statuses.build
    @feed_items = current_user.feed.paginate(page: params[:page])

  end
end

def help
end

def about
end

def contact
end

def requests
	if logged_in?
    @request = current_user.requests.build
    @request_items = current_user.requests.paginate(page: params[:page])
  end
end

def statuses
	if logged_in?
    @status = current_user.statuses.build
    @status_items = current_user.status.paginate(page: params[:page])
  end
end

end
