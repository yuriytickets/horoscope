class ApplicationController < ActionController::Base
	protect_from_forgery
	include SessionsHelper
	include UsersHelper

	before_filter :statistic
	after_filter :user_activity

	def statistic
		Statistic.find_or_create_by_ip_adress(ip_adress: request.remote_ip)
	end

	private

	def user_activity
	  current_user.try :touch
	end
end
