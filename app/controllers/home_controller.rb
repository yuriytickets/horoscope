class HomeController < ApplicationController
	def index
	end
	def all_users
		if signed_in?
			@user = User.paginate(page: params[:page], per_page: 5)
		else
			redirect_to(root_url)
		end
	end
end
