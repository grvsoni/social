class DashboardController < ApplicationController
  set_tab :dashboard
  before_filter :authenticate_user!
  layout "dashboard"

  def index
  	@graph = Koala::Facebook::API.new(current_user.fb_access_token) if current_user.fb_access_token
  end
end