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

var loginQuery = "select username from login";

/* GET home page. */
router.get('/', function (req, res, next) {
    pool.query(loginQuery, (err, result) => {
        var id = req.param("id");
        if (result.rows.length) {
            username = result.rows[0]["username"];
            var contentQuery = "with UserLocation as( select C.username, L.address, L.nearest_mrt from CareTakers C left join(Users U left join Location L on U.address=L.address) on C.username=U.username), maxBid as( select id, max(bids) as current_max, count(*) as total_num from BiddingStatus group by id having id=" + id + ") select exists(select * from Favorite where ownerName=\'" + username + "\' and hostName = S.hostName), S.id, S.hostName, UL.address, UL.nearest_mrt, S.capacity, S.startdate, S.enddate, S.minBid, M.current_max from (Services S left join UserLocation UL on S.hostName=UL.username) left join maxBid M on S.id=M.id where S.id=" + id;
        } else {
            var contentQuery = "with UserLocation as (select C.username, L.address, L.nearest_mrt from CareTakers C left join(Users U left join Location L on U.address = L.address) on C.username = U.username), maxBid as (select id, max(bids) as current_max, count(*) as total_num from BiddingStatus group by id having id =" + id + ") select S.id, S.hostName, UL.address, UL.nearest_mrt, S.capacity, S.startdate, S.enddate, S.minBid, M.current_max from(Services S left join UserLocation UL on S.hostName = UL.username) left join maxBid M on S.id = M.id where S.id =" + id;
        }
        pool.query(contentQuery, (err, data) => {
            pool.query(getActionQuery(req, res, next, result), (err, unused1) => {
                res.render('ownerview', { title: 'All about pets', data: data.rows, result: result.rows, unused1:unused1.rows})
            });
        });
    });
});

function getActionQuery(req, res, next, result) {
    var action = req.param("action");
    var user = result.rows[0]['username'];

    var query = "select * from services";

    if (action == "add") {
        var id = req.param('id');

        query = "insert into wishlist values (" + id + ", \'" + user + "\')";
    }

    else if (action == 'like') {
        var host = req.param('user');

        query = "insert into favorite values (\'" + user + "\', \'" + host + "\')";
    }

    return query;
}

module.exports = router;
