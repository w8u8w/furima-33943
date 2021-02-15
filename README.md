# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name_em       | string  | null: false               |
| first_name_em      | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :purchases_records

## purchases_records テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address

## shipping_addresses テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| post_code              | string | null: false |
| block_number           | string | null: false |
| building_name          | string |             |
| phone_number           | string | null: false |

### Association

- belongs_to :purchase_record

## items テーブル

| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| name_of_item         | string     | null: false       |
| item_description     | text       | null: false       |
| item_category        | text       | null: false       |
| item_condition       | text       | null: false       |
| who_expense          | text       | null: false       |
| ship_from_prefecture | text       | null: false       |
| days_to_shipment     | integer    | null: false       |
| sales_price          | integer    | null: false       |
| user                 | references | foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_record