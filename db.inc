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
ALTER TABLE `users` ADD `status` ENUM(  'active',  'unsubscribe', 'moderate','unverified','deactivate' ) NOT NULL DEFAULT  'active'  ;

ALTER TABLE  `users` ADD  `admin` INT( 1 ) NOT NULL DEFAULT  '0';
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `buynow` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `date_added` datetime NOT NULL,
  `project_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `amount` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;


CREATE TABLE IF NOT EXISTS `referral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `source` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
)


ALTER TABLE  `users` ADD  `fb_id` VARCHAR( 100 ) NOT NULL ,
ADD  `tw_id` VARCHAR( 100 ) NOT NULL ,
ADD  `fb_json` VARCHAR( 100 ) NOT NULL ,
ADD  `tw_json` VARCHAR( 100 ) NOT NULL;
ALTER TABLE  `users` CHANGE  `fb_json`  `fb_json` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `users` CHANGE  `tw_json`  `fb_json` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `projects_autobid` ADD `status` VARCHAR(100) NOT NULL ;


CREATE TABLE IF NOT EXISTS `pmb` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `from_id` int(100) NOT NULL,
  `to_id` int(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(100) NOT NULL,
  `date_sent` datetime NOT NULL,
  `read` int(1) NOT NULL,
  `from_status` enum('delete','archive','open') NOT NULL DEFAULT 'open',
  `to_status` enum('delete','archive','open') NOT NULL DEFAULT 'open',
  `date_read` datetime NOT NULL,
  `r_id` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;



CREATE TABLE IF NOT EXISTS `profile_categories` (
  `user_id` int(10) NOT NULL DEFAULT '0',
  `cid` int(10) NOT NULL DEFAULT '0',
  KEY `user_id` (`user_id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


ALTER TABLE `reviews` CHANGE `rating` `rating` FLOAT NOT NULL;
ALTER TABLE `reviews` ADD `dispute` INT(1) NOT NULL DEFAULT '0' ;

CREATE TABLE IF NOT EXISTS `withdrawals` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `amount` float(10,2) NOT NULL,
  `date_added` datetime NOT NULL,
  `method` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `user_id` int(100) NOT NULL,
  `paid` int(1) NOT NULL DEFAULT '0',
  `paid_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;


ALTER TABLE  `membership_user` ADD  `date_paid` DATETIME NOT NULL ,
ADD  `paid` INT( 10 ) NOT NULL DEFAULT  '0';