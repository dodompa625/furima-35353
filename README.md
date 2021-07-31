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
- belong_to: users
- has_one: purchases


## purchases テーブル
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|user                   |references|null: false, foreign_key: true|
|product                |references|null: false, foreign_key: true|

### Association
- belong_to: users
- belong_to: products
- has_one: delivery_infos


## delivery_infos
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|receiver_name          |string    |null: false                   |
|post_code              |string    |null: false                   |
|prefecture_id          |integer   |null: false                   |
|receiver_city          |text      |null: false                   |
|receiver_address       |text      |null: false                   |
|receiver_building_name |text      |null: false                   |
|receiver_telephone     |integer   |null: false                   |
|purchase               |references|null: false, foreign_key: true|

### Association
- belong_to: purchases

