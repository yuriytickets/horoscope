class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include UsersHelper
  before_filter :statistic
  def statistic
    Statistic.find_or_create_by_ip_adress(ip_adress: request.remote_ip)
  end
end
