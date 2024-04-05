# AirBnb (Backend)

Concurrent de AirBnb pour gérer les bases de données avec Rails. 
- gérer la base de données et les migrations
- gérer les relations entre les tables et les modèles
- faire un seed

## Installation

CLone repository or launch in codespace.

Install dépendencies
```bash
  $ bundle install
```
Install Database : create tables and seed
```bash
  $ rails db:migrate
  $ rails db:seed
```
To launch Rails console
```bash
  $ rails c
```
Print tables in Rails console
```bash
  tp City.all, :id, :name, :listing_ids
  tp User.all, :id, :first_name, :email, :owned_listing_ids, :booked_listing_ids
  tp Listing.all, :id, :available_beds, :price, :city_id, :owner_id
  tp Reservation.all, :id, :start_date, :end_date, :duration, :listing_id

```

## TODOs
validations: phone format