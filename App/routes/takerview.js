var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
    res.render('takerview', { title: 'All about pets' });
});

module.exports = router;
