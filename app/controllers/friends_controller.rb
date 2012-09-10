class FriendsController < ApplicationController
  set_tab :friends
  before_filter :authenticate_user!
  before_filter :set_graph
  layout "dashboard"

  def index
  	@friends = @graph.get_connections("me", "friends", {:order => "name"})
  end

  def details
  	@friend = @graph.get_object(params[:id])
  end

  def post_message
  	@friend = @graph.get_object(params[:id])
  	@graph.put_wall_post(params[:message], {},params[:id])

  	flash[:notice] = "Message posted successfully!"
  	render :action => "details"
  end

  private

  def set_graph
  	@graph = Koala::Facebook::API.new(current_user.fb_access_token)
  end
end