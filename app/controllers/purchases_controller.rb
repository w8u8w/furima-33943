class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchases_shipping = PurchasesShipping.new
  end

  def create
    @purchases_shipping = PurchasesShipping.new(purchases_params)
    if @purchases_shipping.valid?
      @purchases_shipping.save
      redirect_to root_path
    else
      render  :index
    end
  end

  private

  def purchases_params
    params.require(:purchases_record).permit(:post_code, :prefecture_id, :municipality, :block_number, :building_name).merge(user_id: current_user.id)
  end

end
