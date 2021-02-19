class Item < ApplicationRecord
  belongs_to  :user
  has_one     :purchases_record
  has_one_attached  :image
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to  :item_category
    belongs_to  :item_condition
    belongs_to  :who_expense
    belongs_to  :prefecture
    belongs_to  :days_to_shipment

  with_options presence: true do
    validates :name_of_item
    validates :item_description
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :item_category_id
    validates :item_condition_id
    validates :who_expense_id
    validates :prefecture_id
    validates :days_to_shipment_id
  end

  validates :sales_price, numericality: {only_integer: true, greater_than: 299, less_than: 10000000},
    format: { with: /\A[0-9]+\z/ }
end
