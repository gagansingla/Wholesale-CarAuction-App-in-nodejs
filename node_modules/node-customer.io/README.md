# Customer.io RESTful API wrapper

Wrapper for the [Customer.io](http://customer.io/docs/api/rest.html) API endpoints.

WARNING: this library throws.

## Installation

```bash
npm install node-customer.io
```

## Create or update customers

```JavaScript
var Customerio = require('node-customer.io');
var cio = new Customerio('<YOUR_SITE_ID>', '<YOUR_SECRET_KEY>');

// this could throw
cio.identify('50b896ddc814556766000001', 'your-email@example.com', {
  created_at: new Date()
}, function(err, res) {
  if (err != null) {
    console.log('ERROR', err);
  }
  console.log('response headers', res.headers);
  console.log('status code', res.statusCode);
});
```

## Delete customers
```JavaScript
var Customerio = require('node-customer.io');
var cio = new Customerio('<YOUR_SITE_ID>', '<YOUR_SECRET_KEY>');

// this could throw
cio.deleteCustomer('50b896ddc814556766000001', function(err, res) {
    if (err != null) {
      console.log('ERROR', err);
    }
    console.log('response headers', res.headers);
    return console.log('status code', res.statusCode);
  });
```
## Track events
```JavaScript
var Customerio = require('node-customer.io');
var cio = new Customerio('<YOUR_SITE_ID>', '<YOUR_SECRET_KEY>');

var data = {
  'amount': 10,
  'quantity': 3,
  'total': 30
};

// this could throw
cio.track('50b896ddc814556766000001', 'purchased', data, function(err, res) {
  if (err != null) {
    console.log('ERROR', err);
  }
  console.log('response headers', res.headers);
  return console.log('status code', res.statusCode);
});
```

## Development

The only dev dependencies is `coffee-script` which should get installed when you run 'npm install'. The coffeescript is compiled down to javascript automatically before publishing using the 'prepublish' script in 'package.json'. coffeescript file and test files are deliberately left out of the package via '.npmignore' 
because no one likes needlessly big modules.

Contributions are welcome!

## License

MIT
