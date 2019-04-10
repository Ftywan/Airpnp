var express = require('express');
var router = express.Router();

// create a new pool
const { Pool } = require('pg')
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'airpnp',
    password: 'launch',
    port: 5432,
})

var loginQuery = "select * from login";

/* GET home page. */
router.get('/', function (req, res, next) {
    pool.query(loginQuery, (err, loginUser) => {
        pool.query("select hostname from favorite where ownername = loginuser = " + loginUser[0].username, (err, favouriteData) => {
            pool.query(getInitialQUery(req, res, next), (err, data) => {
                pool.query(getAddressQuery(req, res, next), (err, addressData) => {
                    res.render('ownerview', { title: 'All about pets', data: data.rows, addressData: addressData.rows, favouriteData: favouriteData.rows})
                });
            });
        });
    });
});

function getInitialQUery(req, res, next) {
    var id = req.param("id");

    return "select * from services where id = " + id;
}

function getAddressQuery(req, res, next) {
    var host = req.param("host");
    return "select * from users where username = \'" + host + "\'";
}

module.exports = router;
