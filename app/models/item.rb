class Item < ApplicationRecord
  belongs_to  :user
  has_one     :purchases_record
end
