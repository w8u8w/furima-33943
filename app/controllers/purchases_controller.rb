class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_root_path

  def index
    @purchases_shipping = PurchasesShipping.new
  end

  def create
    @purchases_shipping = PurchasesShipping.new(purchases_params)
    if @purchases_shipping.valid?
      pay_item
      @purchases_shipping.save
      redirect_to root_path
    else
      render  :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    redirect_to root_path if current_user.id == @item.user_id
  end

  def purchases_params
    params.require(:purchases_shipping).permit(:post_code, :prefecture_id, :municipality, :block_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.sales_price,
      card: purchases_params[:token],
      currency: 'jpy'
    )
  end

end
