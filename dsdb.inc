ALTER TABLE  `projects` ADD  `bprice` FLOAT( 10, 2 ) NOT NULL;
ALTER TABLE  `projects` ADD  `mprice` FLOAT( 10, 2 ) NOT NULL DEFAULT  '0.00',
ADD  `iprice` FLOAT( 10, 2 ) NOT NULL DEFAULT  '0.00';
ALTER TABLE  `projects` ADD  `wprice` FLOAT( 10, 2 ) NOT NULL;
ALTER TABLE  `bids` CHANGE  `proposed_amount`  `proposed_amount` FLOAT( 10, 2 ) NULL DEFAULT  '0.00';
ALTER TABLE  `users` ADD  `balance` INT( 100 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `users` ADD  `customerid` VARCHAR( 100 ) NOT NULL ,
ADD  `paymentid` VARCHAR( 100 ) NOT NULL;


ALTER TABLE  `projects` ADD  `market_status` ENUM(  'open',  'closed',  'sold',  'draft' ) NOT NULL DEFAULT  'open';


ALTER TABLE  `invoices` ADD  `status` ENUM(  'paid',  'unpaid' ) NOT NULL DEFAULT  'unpaid';
ALTER TABLE  `invoices` ADD  `istatus` ENUM(  'debit',  'credit' ) NOT NULL DEFAULT  'debit';
ALTER TABLE  `users` ADD  `balance_amount` FLOAT( 10, 2 ) NOT NULL DEFAULT  '0.00',
ADD  `reserve_amount` FLOAT( 10, 2 ) NOT NULL DEFAULT  '0.00';

ALTER TABLE  `users` CHANGE  `balance`  `balance` FLOAT( 10, 2 ) NOT NULL DEFAULT  '0.00';
ALTER TABLE  `bids` ADD  `reserved` INT( 1 ) NOT NULL DEFAULT  '0',
ADD  `reserved_date` DATETIME NOT NULL;

ALTER TABLE  `projects` CHANGE  `market_status`  `market_status` ENUM(  'open',  'closed',  'sold',  'draft',  'removed' ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT  'open'

ALTER TABLE `users` ADD `aboutme` TEXT NOT NULL , ADD `image` VARCHAR(255) NOT NULL , ADD `avatar` VARCHAR(255) NOT NULL ;
<<<<<<< .mine
ALTER TABLE `users` ADD `status` ENUM(  'active',  'unsubscribe', 'moderate','unverified','deactivate' ) NOT NULL DEFAULT  'active'  ;
ALTER TABLE  `users` ADD  `admin` INT( 1 ) NOT NULL DEFAULT  '0';=======
ALTER TABLE `users` ADD `status` ENUM(  'active',  'unsubscribe', 'moderate','unverified','deactivate' ) NOT NULL DEFAULT  'active'  ;


CREATE TABLE IF NOT EXISTS `projects_autobid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `start_amount` double NOT NULL,
  `amount` double NOT NULL,
  `bids` int(11) NOT NULL,
  `balance` double NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;# MySQL returned an empty result set (i.e. zero rows).
>>>>>>> .r200
