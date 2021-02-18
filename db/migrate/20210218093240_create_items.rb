class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name_of_item,        null: false
      t.text        :item_description,    null: false
      t.integer     :item_category_id,    null: false
      t.integer     :item_condition_id,   null: false
      t.integer     :who_expense_id,      null: false
      t.integer     :prefecture_id,       null: false
      t.integer     :days_to_shipment_id, null: false
      t.integer     :sales_price,         null: false
      t.references	:user,                foreign_key: true
      t.timestamps
    end
  end
end
