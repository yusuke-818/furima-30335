class FurimasController < ApplicationController

  def new
    @furima = Furima.new
  end
  
  private

  def furima_params
    params.require(:furima).permit(:content, :image).merge(user_id: current_user.id)
  end

end
