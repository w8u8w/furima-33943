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
| birthday           | date    | null: false               |

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
- has_one    :shipping_address

## shipping_addresses テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| post_code       | string     | null: false       |
| prefecture      | string     | null: false       |
| municipality    | string     | null: false       |
| block_number    | string     | null: false       |
| building_name   | string     |                   |
| phone_number    | string     | null: false       |
| purchase_record | references | foreign_key: true |

### Association

- belongs_to :purchase_record

## items テーブル

| Column                  | Type       | Options           |
| ----------------------- | ---------- | ----------------- |
| name_of_item            | string     | null: false       |
| item_description        | text       | null: false       |
| item_category_id        | integer    | null: false       |
| item_condition_id       | integer    | null: false       |
| who_expense_id          | integer    | null: false       |
| ship_from_prefecture_id | integer    | null: false       |
| days_to_shipment_id     | integer    | null: false       |
| sales_price             | integer    | null: false       |
| user                    | references | foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_record