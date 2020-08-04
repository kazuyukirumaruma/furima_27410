class TransactionsController < ApplicationController
  before_action :move_to_root, only: [:index, :create]
  def index
    @address = Address.new
  end

  def create
    @usertransaction = UserTransaction.new(user_transaction_params)
    
    if @usertransaction.save
      pay_item
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_transaction_params
    params.permit( 
      :token,
      :post_code, 
      :prefecture_id, 
      :municipality, 
      :house_number, 
      :building, 
      :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: user_transaction_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
