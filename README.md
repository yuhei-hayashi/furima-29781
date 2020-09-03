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

### Association

- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル
| Column | Type | Option |
| ------ | ---- | ------ |
| name | string | null: false |
| image | string | null: false |
| price | integer | null: false |
| status | integer | null: false |
| delivery | integer | null: false |
| area | integer | null: false |
| day | integer | null: false |
| explanation | text | null: false |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :genres , through: item_genres
- has_one :order

## ordersテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| sale | integer | null: false |
| user | references | null: false , foreign_key: true |
| item | references | null: false , foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## commentsテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| post | text | null: false |
| user | references | null: false ,foreign_key: true |
| item | references | null: false ,foreign_key: true |

### Association

- belong_to :user
- belongs_to :item

## genresテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| tag | string | null: false |

### Association

- has_many :items , through: item_genres

## item_genresテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| item | references | null: false , foreign_key: true |
| genre | references | null: false , foreign_key: true |

### Association

- belongs_to :item
- belongs_to :genre

## addressesテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| post_code | string | null: false |
| prefecture | integer | null: false |
| city | string | null: false |
| house_number | string | null: false|
| building_name | string| |
| order | references | nill: false |

### Association

- belongs_to order
