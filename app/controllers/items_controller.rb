class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index]

  def index
    @items = Item.all.order("created_at DESC")
    # includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :image, 
      :name, 
      :explanation, 
      :category_id, 
      :commodity_condition_id, 
      :shipping_charge_id, 
      :region_id, 
      :shipping_day_id, 
      :price
    ).merge(user_id:current_user.id)
  end

  # def move_to_index
  #   unless user_sign_in?
  #     redirect_to action: :index
  #   end
  # end
end

