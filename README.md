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

## 1. users Table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|image|string|
|birth_day|date|null: false|

### Association
- has_many :books

## 2. books Table
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false, foreign_key: true|
|title|string|null: false, index: true|
|author|string|null: false, index: true|
|publisher|string|null: false, index: true|
|category|integer|null: false, index: true|
|status|integer|null: false|
|image|string|
|date|date|null: false|

### Association
- belongs_to :user
- has_many :impressions

## 3. impressions Table
|Column|Type|Options|
|------|----|-------|
|book_id|bigint|null: false, foreign_key: true|
|read_day|integer|null: false, index: true|
|interest|integer|null: false, index: true|
|impressed|integer|null: false, index: true|
|awareness|integer|null: false, index: true|
|impact|integer|null: false, index: true|
|practice|integer|null: false, index: true|
|knowledge|integer|null: false, index: true|
|rating|integer|null: false|
|reread_timing|integer|null: false, index: true|
|note|text|

### Association
- belongs_to :book




