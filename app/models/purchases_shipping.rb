class PurchasesShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :block_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :block_number
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/}
  end
  
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchases = PurchasesRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, block_number: block_number, building_name: building_name, phone_number: phone_number, purchases_record_id: purchases.id)
  end
end