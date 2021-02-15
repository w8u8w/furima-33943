# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name_em    | string  | null: false |
| first_name_em   | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | integer  | null: false |

### Association

- has_many :items
- has_many :purchases

## purchases テーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| post_code              | string | null: false |
| block_number           | string  | null: false |
| building_name          | string  |
| phone_number           | string | null: false |

### Association

- belongs_to :user
- belongs_to :item

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name_of_item     | string     | null: false                    |
| item_description | text       | null: false                    |
| sales_price      | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase