# Welcome to Airpnp website

This application allows pet owners to search for care takers for their pets forcertain periods of time (e.g., https://dogvacay.com). Both users and pets have a profile. Care takerscan advertise their availability (when they can take care of a pet, for how long, the kind of petthey can take care of and other constraints and requirements), and pet owners can browse/searchfor care takers and bid for their services. The successful bidder could either be chosen by the caretaker or automatically selected by the system based on some criteria.


## Set up database
please set up postgreSQL before start the connection.

* open the psql terminal and change the directory to scripts
* create database airpnp by entering:
 
```
create database airpnp;
\c airpnp;
```
* initialise the following files:

```
\i table.sql
\i Trigger.sql
\i test.sql
```
## To deploy the project
please set up the nodeJS properly.

* open the terminal and change to the project directory
* run the following code

```
node bin\www

```

