class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_furima, only: [:show, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @furimas = Furima.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @furima.update(furima_params)
      redirect_to furima_path
    else
      render :edit
    end
  end

  private

  def set_furima
    @furima = Furima.find(params[:id])
  end

  def furima_params
    params.require(:furima).permit(:image, :item, :info, :category_id, :states_id, :shipping_id, :prefecture_id,
                                   :shipping_days_id, :price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @furima.user
  end
end
