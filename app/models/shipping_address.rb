class ShippingAddress < ApplicationRecord
  belongs_to  :purchases_record
end
