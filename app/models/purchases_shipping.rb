class PurchasesShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :block_number, :building_name, :phone_number
end