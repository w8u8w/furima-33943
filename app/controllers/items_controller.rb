class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  # before_action :move_to_index, only: :edit

  def index
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
    params.require(:item).permit(:name_of_item, :item_description, :item_category_id, :item_condition_id, :who_expense_id,
                                 :prefecture_id, :days_to_shipment_id, :sales_price, :image).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   if user_signed_in?
  #     current_user == @user
  #     redirect_to action: :index
  #   else
  #     redirect_to action: :index
  #   end
  # end
end
