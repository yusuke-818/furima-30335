class OrdersController < ApplicationController

  def index
    @furima = Furima.find(params[:furima_id])
    # @order = Order.new(order_params)
  end

  def create
    @order = Order.new(order_params)
  end

end

private

def order_params 
  params.require(:order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id)
end