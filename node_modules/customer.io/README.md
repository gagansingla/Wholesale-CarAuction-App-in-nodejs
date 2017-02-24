node-customer.io
=============

This module provides a simple interface to the [customer.io](http://customer.io) REST api, which is documented here: [http://customer.io/docs/api/rest.html]()

Installation
----------------

    npm install customer.io

Quick Start
----------------

    // require the customer.io library
    CustomerIO = require('customer.io')

    // create an instance, passing your site id and API token
    // (the details below are the correct length, but bogus)
    cio = CustomerIO.init('e875a5078ea45334aa1e', 'ef4d25d4c2bae59b39ec')

    // create a user with some initial properties
    cio.identify('user_unique_id', 'liam@classdojo.com', {age: 26})

    // update an existing user with new properties
    cio.identify('user_unique_id', 'liam@classdojo.com', {age: 27, firstName: 'Liam'})
    
   	// track an event for a user, using the unique id you created them with
   	cio.track('user_unique_id', 'purchased', {price: 23.45})


Atribution and Thanks
----------------
Copyright © Liam Don 2012

Thanks to the folks at [customer.io](http://customer.io) for their fine event-driven email service.


License
----------------
Released under the MIT license. See file called LICENSE for more details.