class UsersController < ApplicationController
  def index
  end

  def keywords
  	u = User.find(current_user.id)
  	u.update_attribute(:keywords, params[:key])
  	render js: "alert('saved');"
  	
  end
end
