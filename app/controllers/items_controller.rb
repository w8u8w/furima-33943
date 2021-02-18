class ItemsController < ApplicationController
  def index
  end

  def new 
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:name_of_itme, :item_description, :item_category_id, :item_condition_id, :who_expense_id, :prefecture_id, :days_to_shipment_id, :sales_price, :image).merge(user_id: current_user.id)
  end
  end
end
