class Item < ApplicationRecord
  belongs_to  :user
  has_one     :purchases_record
  has_one_attached  :image

  with_options presence: true do
    validates :name_of_item
    validates :item_description
    validates :item_category_id
    validates :item_condition_id
    validates :who_expense_id
    validates :prefecture_id
    validates :days_to_shipment_id
    validates :sales_price
    validates :image
  end
end
