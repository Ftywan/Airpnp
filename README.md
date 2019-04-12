# Welcome to Airpnp website

This application allows pet owners to search for care takers for their pets for
certain periods of time (e.g., https://dogvacay.com). Both users and pets have a profile. Care takers
can advertise their availability (when they can take care of a pet, for how long, the kind of pet
they can take care of and other constraints and requirements), and pet owners can browse/search
for care takers and bid for their services. The successful bidder could either be chosen by the care
taker or automatically selected by the system based on some criteria.


## Set up database
please set up postgreSQL before start the connection.

* open the psql terminal and change the directory to /Database
* create database airpnp by entering:
 
```
\i create_database.sql
\c airpnp;
```
* initialise the following files:

```
\i table.sql
\i trigger.sql
\i data.sql
```
## Set up backend
* ensure nodeJs is installed on the computer
* install express-generator and ejs
```
 npm install express-generator -g
 npm install ejs
```
* go to '/', then go to 'App'
* install extra packages
```
npm install
npm install --save sha256
npm install pg
npm install body-parser --save
```

## Set up connecttion
* go to App/routes
* find the "pool"
* change configuations of database to the same as "airpnp" running on postgreSQL server

An example would be:
```
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'airpnp',
  password: 'hahaha',
  port: 5432,
})
```
## Run the project
please set up the nodeJS properly.

* open the terminal and change to the project directory
* run the following code

```
node bin\www
```

## Done! : )

