#テーブル設計

## usersテーブル

|Column                |Type    |Options                  |
|----------------------|--------|-------------------------|
|nickname              |string  |null: false              |
|email                 |string  |null: false unique: true |
|encrypted_password    |string  |null: false              |
|first_name            |string  |null: false              |
|last_name             |string  |null: false              |
|first_name_reading    |string  |null: false              |
|last_name_reading     |string  |null: false              |
|birthday              |date    |null: false              |


### Association
has_many :furimas
has_many :orders


## furimasテーブル

|Column           |Type       |Options           |
|-----------------|-----------|------------------|
|item             |string     |null: false       |
|info             |text       |null: false       |
|category_id      |integer    |null: false       |
|states_id        |integer    |null: false       |
|shipping_id      |integer    |null: false       |
|prefecture_id    |integer    |null: false       |
|shipping_days_id |integer    |null: false       |
|price            |integer    |null: false       |
|user             |references |foreign_key: true |


### Association
has_one :order
belongs_to :user


## ordersテーブル

|Column |Type       |Options           |
|-------|-----------|------------------|
|user   |references |foreign_key: true |  
|furima |references |foreign_key: true |


### Association
belongs_to :furima
belongs_to :user
has_one :address

## addressesテーブル

|Column        |Type       |Options           |
|--------------|-----------|------------------|
|postal_code   |string     |null: false       |
|prefecture_id |integer    |null: false       |
|city          |string     |null: false       |
|addresses     |string     |null: false       |
|building      |string     |                  |
|phone_number  |string     |null: false       |
|order         |references |foreign_key: true |


### Association
belongs_to :order
