var express = require('express'),
    bodyParser = require('body-parser'),
    partials = require('express-partials'),
    app = express(),
    pgp = require("pg-promise")(),
    db = pgp("postgres://boreek:123@localhost/store"),
    ejs = require('ejs');

app.listen(3000);
app.set('view engine', 'ejs');
app.use(partials())
    .use(bodyParser.json())
    .use(express.static('public'));

app.get('/', (req, res) => {
  db.any("SELECT * FROM products").then(products=>{
    res.render('wrapper.ejs', {
      template: 'products/content',
      products: products
    });
  })
})

app.post('/cart', (req, res) => {
  db.one("SELECT * FROM products WHERE id = $1", req.body.productID).then(product => {
    ejs.renderFile(__dirname + '/views/checkout/content.ejs', {product: product},  (err, str) => {
      res.send(JSON.stringify({
        'content' : str
      }))
    })
  })
})

app.post('/order', (req, res) => {
  var order = [
    req.body.name,
    req.body.phone,
    req.body.address,
    req.body.email
  ];
  var orderID = 0;
  db.one('INSERT INTO orders (time, client_name, client_phone, client_address, client_email) VALUES(current_timestamp, $1, $2, $3, $4) RETURNING id', order).then(data=>{
    var product = [
      data.id,
      req.body.productID,
      req.body.quantity
    ];
    db.none('INSERT INTO orders_products(order_id, product_id, quantity) VALUES($1, $2, $3)', product);
  });

  
  db.none('UPDATE products SET quantity = quantity - $1 WHERE id = $2', [req.body.productID, req.body.quantity]);
  res.send(200);
})