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
- has_many: purchases


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
- has_one: purchase


## purchases テーブル
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|user                   |references|null: false, foreign_key: true|
|product                |references|null: false, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: product
- has_one: delivery_info


## delivery_infos
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|post_code              |string    |null: false                   |
|prefecture_id          |integer   |null: false                   |
|receiver_city          |string    |null: false                   |
|receiver_address       |string    |null: false                   |
|receiver_building_name |string    |                              |
|receiver_telephone     |string    |null: false                   |
|purchase               |references|null: false, foreign_key: true|

### Association
- belongs_to: purchase

