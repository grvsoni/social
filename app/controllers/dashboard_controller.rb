class DashboardController < ApplicationController
  set_tab :dashboard
  before_filter :authenticate_user!
  layout "dashboard"

  def index

  end
end