class PledgesController < ApplicationController
  def index
    @pledges = current_user.pledges
  end

  def destroy
    Pledge.find(params[:id]).destroy
    redirect_to pledges_path
  end

end