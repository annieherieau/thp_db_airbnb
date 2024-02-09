# FreeDoc

Concurrent de Doctolib pour gérer les bases de données avec Rails. Projet validant du 08/02/2024
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
  tp City.all, :id, :name, :house_ids
  tp User.all, :id, :first_name, :email, :owned_house_ids, :booked_house_ids
  tp House.all, :id, :number_of_beds, :price_per_night, :city_id, :owner_id

```