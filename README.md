# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル
| Column | Type | Option |
| ------ | ---- | ------ |
| nickname | string | null: false |
| email | string | null: false |
| password | string | null: false |
| first_name | string | null: false |
| last_name | string | null: false |
| first_name_reading | string | null: false |
| last_name_reading | string | null: false |
| birthday | date | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル
| Column | Type | Option |
| ------ | ---- | ------ |
| name | string | null: false |
| price | integer | null: false |
| status | integer | null: false |
| delivery | integer | null: false |
| area | integer | null: false |
| day | integer | null: false |
| explanation | text | null: false |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_one_attached :image

## ordersテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| user | references | null: false , foreign_key: true |
| item | references | null: false , foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| post_code | string | null: false |
| prefecture | integer | null: false |
| city | string | null: false |
| house_number | string | null: false|
| building_name | string| |
| telephone | string | null: false |
| order | references | nill: false , foreign_key: true |

### Association

- belongs_to order

      