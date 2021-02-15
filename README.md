# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false, unique: true |
| password        | string  | null: false |
| last_name_em    | string  | null: false |
| first_name_em   | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |

### Association

- has_many :items
- has_one :purchase

## purchases テーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| card_number            | integer | null: false |
| exp_date               | integer | null: false |
| card_verification_code | integer | null: false |
| post_code              | integer | null: false |
| block_number           | string  | null: false |
| building_name          | string  | null: false |
| phone_number           | integer | null: false |

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