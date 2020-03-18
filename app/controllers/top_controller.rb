class TopController < ApplicationController
  
  def index
    @user = User.find_by(id: params[:id])
  end
  private
  def set_user
    @user = User.find_by(id: params[:id])
  end
end
