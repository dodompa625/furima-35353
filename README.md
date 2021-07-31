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
- has_many: product
- has_many: purchase


## products テーブル
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|product_name           |string    |null: false                   |
|price                  |integer   |null: false                   |
|text                   |text      |null: false                   |
|category_id            |integer   |null: false                   |
|status_id              |integer   |null: false                   |
|delivery_fee           |integer   |null: false                   |
|prefecture_id          |integer   |null: false                   |
|delivery_date          |date      |null: false                   |
|user                   |references|null: false, foreign_key: true|

### Association
- belong_to: user
- has_one: purchase


## purchases テーブル
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|user                   |references|null: false, foreign_key: true|
|product                |references|null: false, foreign_key: true|

### Association
- belong_to: user
- belong_to: product
- has_one: delivery_info


## delivery_infos
|Column                 |Type      |Options                       |
|-----------------------|----------|------------------------------|
|receiver_name          |string    |null: false                   |
|post_code              |integer   |null: false                   |
|receiver_prefecture_id |integer   |null: false                   |
|receiver_city          |text      |null: false                   |
|receiver_address       |text      |null: false
|receiver_telephone     |integer   |null: false                   |
|purchase               |references|null: false, foreign_key: true|

### Association
- belong_to: purchase

