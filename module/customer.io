cio = CustomerIO.init(global.customerio.api, global.customerio.key)

// create a user with some initial properties
cio.identify('user_unique_id', 'liam@classdojo.com', {age: 26})

// update an existing user with new properties
cio.identify('user_unique_id', 'liam@classdojo.com', {age: 27, firstName: 'Liam'})

   // track an event for a user, using the unique id you created them with
   cio.track('user_unique_id', 'purchased', {price: 23.45})