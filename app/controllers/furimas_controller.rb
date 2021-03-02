class FurimasController < ApplicationController
  before_action :authenticate_user!

  def index
    @furimas = Furima.order('created_at DESC')
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def furima_params
    params.require(:furima).permit(:image, :item, :info, :category_id, :states_id, :shipping_id, :prefecture_id,
                                   :shipping_days_id, :price).merge(user_id: current_user.id)
  end
end
