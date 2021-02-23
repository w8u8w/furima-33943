class CreatePurchasesRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases_records do |t|

      t.timestamps
    end
  end
end
