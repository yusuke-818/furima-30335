class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]
  before_action :sold_out, only: [:index, :create]

  def index
    @furima = Furima.find(params[:furima_id])
    @user_order = UserOrder.new
  end

  def create
    @furima = Furima.find(params[:furima_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, furima_id: @furima.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @furima[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

  def contributor_confirmation
    @furima = Furima.find(params[:furima_id])
    redirect_to root_path if current_user == @furima.user
  end

  def sold_out
    @furima = Furima.find(params[:furima_id])
    redirect_to root_path if @furima.order.present?
  end
end
