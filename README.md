#テーブル設計

## usersテーブル

|Column                |Type    |Options                  |
|----------------------|--------|-------------------------|
|nickname              |string  |null: false              |
|email                 |string  |null: false unique: true |
|password              |string  |null: false              |
|password_confirmation |string  |null: false              |
|first_name            |string  |null: false              |
|last_name             |string  |null: false              |
|first_name_reading    |string  |null: false              |
|last_name_reading     |string  |null: false              |
|birthday              |string  |null: false              |


### Association
has_many :furimas
has_many :orders


## furimasテーブル

|Column        |Type       |Options           |
|--------------|-----------|------------------|
|image         |active_storageで実施           |
|item          |string     |null: false       |
|info          |string     |null: false       |
|category      |string     |null: false       |
|states        |string     |null: false       |
|shipping      |string     |null: false       |
|shipping_area |string     |null: false       |
|shipping_days |string     |null: false       |
|price         |integer    |null: false       |
|user          |references |foreign_key: true |


### Association
has_one :orders
belongs_to :users


## ordersテーブル

|Column |Type       |Options           |
|-------|-----------|------------------|
|user   |references |foreign_key: true |  
|furima |references |foreign_key: true |


### Association
belongs_to :furimas
belongs_to :users
has_one :addresses

## addressesテーブル

|Column       |Type       |Options           |
|-------------|-----------|------------------|
|postal_code  |integer    |null: false       |
|prefecture   |string     |null: false       |
|city         |string     |null: false       |
|addresses    |string     |null: false       |
|building     |string     |null: false       |
|phone_number |string     |null: false       |
|order        |references |foreign_key: true |


### Association
belongs_to :orders
