# DB設計

## users テーブル
|Column                 |Type     |Options                     |
|-----------------------|---------|----------------------------|
|nickname               |string   |null: false                 |
|email                  |string   |null: false, unique: true   |
|encrypted_password     |string   |null: false                 |
|first_name             |string   |null: false                 |
|last_name              |string   |null: false                 |
|first_name_kana        |string   |null: false                 |
|last_name_kana         |string   |null: false                 |
|birthday               |date     |null: false                 |

### Association
- has_many: products
- has_many: orders


## products テーブル
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|product_name           |string    |null: false                   |
|price                  |integer   |null: false                   |
|text                   |text      |null: false                   |
|category_id            |integer   |null: false                   |
|status_id              |integer   |null: false                   |
|delivery_fee_id        |integer   |null: false                   |
|prefecture_id          |integer   |null: false                   |
|delivery_date_id       |integer   |null: false                   |
|user                   |references|null: false, foreign_key: true|

### Association
- belongs_to: user
- has_one: order


## orders テーブル
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|user                   |references|null: false, foreign_key: true|
|product                |references|null: false, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: product
- has_one: address
- has_one: card


## Addresses
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|post_code              |string    |null: false                   |
|prefecture_id          |integer   |null: false                   |
|city                   |string    |null: false                   |
|house_number           |string    |null: false                   |
|building_name          |string    |                              |
|receiver_telephone     |string    |null: false                   |
|order                  |references|null: false, foreign_key: true|

### Association
- belongs_to: order

## cards
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|user_id                |string    |null: false                   |
|card_id                |string    |null: false                   |
|user                   |references|null: false, foreign_key: true|

### Association