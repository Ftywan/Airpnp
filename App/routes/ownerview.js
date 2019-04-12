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
            var contentQuery = "with UserLocation as( select C.username, U.contact_number, L.address, L.nearest_mrt from CareTakers C left join (Users U left join Location L on U.address=L.address) on C.username=U.username), maxBid as(select id, max(bids) as current_max, count(*) as total_num from BiddingStatus group by id having id=" + id + "), ServicesWithBonus as(select S.id, S.hostName, S.minBid, S.startdate, S.enddate, S.capacity, SB.bonus from Services S left join SpecialBonus SB on S.id=SB.id) select SWB.id, exists(select * from Favorite where ownerName=\'" + username +"\' and hostName=(select S.hostName from Services S where S.id=" + id + ")), SWB.hostName, UL.address, UL.nearest_mrt, SWB.capacity, SWB.startdate, SWB.enddate, SWB.minBid, M.current_max, SWB.bonus, UL.contact_number from (ServicesWithBonus SWB left join UserLocation UL on SWB.hostName=UL.username) left join maxBid M on SWB.id=M.id where SWB.id=" + id;


            var wishStatusQuery = "select id from wishlist where id=" + id + " and ownername = \'" + username + "\'";
            var bidStatusQuery = "select * from biddingstatus where ownername = \'" + username + "\' and id=" + id;
            var commentQuery = "select * from comment where id = " + id;
            pool.query(getActionQuery(req, res, next, result), (err, unused1) => {
                pool.query(wishStatusQuery, (err, wishlist) => {
                    pool.query(bidStatusQuery, (err, bidded) => {
                        pool.query(contentQuery, (err, data) => {
                            pool.query(commentQuery, (err, comment) => {
                                res.render('ownerview', { title: 'All about pets', data: data.rows, result: result.rows, unused1: unused1.rows, wishlist: wishlist.rows, bidded: bidded.rows, comment: comment.rows })
                            });
                        });
                    });
                });
            });
        } else {
            var contentQuery = "with UserLocation as( select C.username, U.contact_number, L.address, L.nearest_mrt from CareTakers C left join (Users U left join Location L on U.address=L.address) on C.username=U.username), maxBid as(select id, max(bids) as current_max, count(*) as total_num from BiddingStatus group by id having id=" + id + "), ServicesWithBonus as(select S.id, S.hostName, S.minBid, S.startdate, S.enddate, S.capacity, SB.bonus from Services S left join SpecialBonus SB on S.id=SB.id) select SWB.hostName, UL.address, UL.nearest_mrt, SWB.capacity, SWB.startdate, SWB.enddate, SWB.minBid, M.current_max, SWB.bonus, UL.contact_number from (ServicesWithBonus SWB left join UserLocation UL on SWB.hostName=UL.username) left join maxBid M on SWB.id=M.id where SWB.id=" + id;
            var commentQuery = "select * from comment where id = " + id;

            pool.query(contentQuery, (err, data) => {
                pool.query(commentQuery, (err, comment) => {
                    res.render('ownerview', { title: 'All about pets', data: data.rows, comment: comment.rows, result: result.rows })
                });
            });
        }
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

    else if (action == 'bid') {
        var id = req.param('id');
        var bid = req.param('bid');

        query = "insert into biddingstatus values (" + id + ", \'" + user + "\', " + bid + ", DEFAULT" + ", DEFAULT)";

    }

    else if (action == 'comment') {
        var id = req.param('id');
        var text = req.param('text');

        query = "insert into comment values (" + id + ", \'" + user + "\', \'" + text + "\')"
    }

    return query;
}

module.exports = router;
