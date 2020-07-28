class ItemsController < ApplicationController
  def index
    @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(
      :image, 
      :name, 
      :explanation, 
      :category_id, 
      :commodity_condition_id, 
      :shipping_charges_id, 
      :region_id, 
      :shipping_days_id, 
      :price
    )
  end

end

