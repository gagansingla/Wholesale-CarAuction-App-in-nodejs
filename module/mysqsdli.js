

exports.mysqli = function(data,row)
{
     k = mysqli[row];
    
     for(var i in data)
     {

     	k = k.replace(new RegExp('{{'+i+'}}', 'g'), data[i]);
     	
     	
     }
     console.log(k);
     return k;
}

var mysqli = [];
mysqli[0]  = 'select email,id,password_salt,password_hash,first_name,last_name from users where email = "{{username}}" Limit 1';  
mysqli[1] = 'select * from projects where date_added <= "{{datge}}" and date_closed >= "{{datge}}" order by id desc LIMIT 15';
mysqli[3] = 'select * from projects  where date_added >= "{{datge}}" and feature = 1  order by id desc LIMIT 10';
mysqli[4] = 'select * from projects  where date_closed <= "{{datge}}" order by id desc limit 10'; 
mysqli[5] = 'select id,name from categories where type = "product" order by name ASC'; 
mysqli[6] = 'select * from projects where date_added <= "{{datge}}" and date_closed >= "{{datge}}" and buynow = 1'; 
mysqli[7] = 'select * from projects where date_added <= "{{datge}}" and date_closed >= "{{datge}}"  {{cid}}  {{search}}  order by id asc';
mysqli[8] = 'select * from projects  where date_added >= "{{datge}}"   {{cid}}  {{search}} order by id desc';
mysqli[9] = 'select * from projects  where date_closed <= "{{datge}}"  {{cid}}  {{search}} order by id desc '; 
mysqli[10] = 'select * from projects where date_added <= "{{datge}}" and date_closed >= "{{datge}}" {{cid}}    {{search}} and buynow = 1'; 
mysqli[11] = 'insert into users (email,role,first_name,last_name,password_hash,password_salt,created_at,balance) values ("{{email}}","{{role}}",?,?,"{{password_hash}}","{{password_salt}}","{{created_at}}",0)'; 
mysqli[12] = 'select id,email,first_name,last_name from users  where email = "{{email}}" order by id desc';
mysqli['cid'] = ' and category_id = {{cid}}';
mysqli['search'] = ' and title like "%{{search}}%"';
mysqli[13] = 'select * from projects  where id > 0 {{cid}}  {{search}} order by id desc'; 
mysqli[14] = 'insert into projects  (title,description,avatar,image,category_id,tags,user_id,shipping_price,shipping_description,created_at,buynow,feature,sprice,rprice,date_added,date_closed,status,bprice,mprice,iprice,wprice) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)'; 
mysqli[15] = 'select * from projects where user_id = ? and market_status !="removed" order by id desc limit ? , 15';
mysqli[16] = 'select * from projects where date_added <= "{{datge}}" and date_closed >= "{{datge}}" order by id desc';
mysqli[17] = 'select * from projects  where date_added >= "{{datge}}" and feature = 1  order by id desc';
mysqli[18] = 'select user_id from projects where user_id = ? order by id desc';
mysqli[19] = 'select p.*,date_format(p.date_added,"%m/%d/%Y") as date_add,date_format(p.date_closed,"%m/%d/%Y") as date_close,u.first_name,u.email,u.last_name from projects as p left join users as u on u.id = p.user_id where p.id = ? limit 1';
mysqli[20] = 'insert into bids  (project_id,user_id,created_at,proposed_amount) values (?,?,?,?)'; 
mysqli[21] = 'update projects set wprice = ?, date_closed = ADDTIME(date_closed,"00:00:05") where id =  ? limit 1'; 
mysqli[22] = 'select user_id from bids where project_id =  ? and user_id = ? limit 1';
mysqli[23] = 'update bids set proposed_amount = ? where project_id =  ? and user_id = ? limit 1';
mysqli[24] = 'select b.user_id,CONCAT(u.first_name," ",u.last_name) AS name,b.proposed_amount from bids AS b inner join users as u on u.id = b.user_id where b.project_id =  ? order by proposed_amount desc limit 10';
mysqli[25]  = 'select ?? from users where id = ? Limit 1';  
mysqli[26]  = 'select * from packages';  
mysqli[27] = 'update users set customerid = ?, paymentid = ?, paymethod = ? where id =  ? limit 1'; 
mysqli[28] = 'update users set balance = balance+? where id =  ? limit 1'; 
mysqli[29] = 'select * from packages where id =  ? limit 1';
mysqli[30] = 'update users set balance = balance-0.60 where id =  ? limit 1';
mysqli[31] = 'INSERT INTO invoices (id, transactionid, gateway, date_added, user_id, primary_id, type, description, amount,status,istatus) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
mysqli[32] = 'select b.id,b.proposed_amount,b.user_id,u.first_name,u.email,u.last_name from bids as b inner join users as u on u.id = b.user_id where b.project_id = ? order by b.proposed_amount desc limit 1';
mysqli[34] = 'update projects set market_status = ? where id =  ? and market_status = "open" limit 1';
mysqli[33] = 'select count(b.user_id) as bid from bids AS b inner join users as u on u.id = b.user_id where b.project_id =  ? order by proposed_amount desc';
mysqli[35] = 'update bids set awarded = 1,awarded_date = ? where id =  ? and awarded = 0 limit 1';
mysqli[36] = 'select p.*,b.user_id,CONCAT(u.first_name," ",u.last_name) AS name,b.proposed_amount from bids AS b inner join users as u on u.id = b.user_id and b.awarded = 1 inner join projects as p on p.id = b.project_id order by p.date_closed desc';
mysqli[37] = 'select p.title,b.user_id,b.proposed_amount,p.status,p.avatar,p.date_closed,p.id,(select count(bp.id) as id from bids AS bp where bp.user_id = b.user_id and bp.project_id = p.id) as bids from bids AS b inner join projects as p on p.id = b.project_id and b.user_id = ? order by b.id desc limit ?, 10';
mysqli[38] = 'select p.id  from bids AS b inner join projects as p on p.id = b.project_id and b.user_id = ? order by b.id desc';
mysqli[39] = 'select p.title,p.id,b.user_id,b.proposed_amount,p.status,p.avatar,p.date_closed,(select count(bp.id) as id from bids AS bp where bp.user_id = b.user_id and bp.project_id = p.id) as bids from bids AS b inner join projects as p on p.id = b.project_id and b.user_id = ? and b.awarded = 1 order by b.id desc limit ?, 10';
mysqli[40] = 'select p.id  from bids AS b inner join projects as p on p.id = b.project_id and b.user_id = ? and b.awarded = 1 order by b.id desc';
mysqli[41] = 'select * from invoices where user_id = ? order by id desc limit ?, 10';
mysqli[42] = 'select id from invoices where user_id = ? order by id desc';
mysqli[43] = 'select id from invoices where id = ? order by id desc';
mysqli[44] = 'update users set reserve_amount = reserve_amount+? where id = ? limit 1';
mysqli[47] = 'update users set reserve_amount = reserve_amount-? where id = ? limit 1';
mysqli[45] = 'insert into bids  (project_id,user_id,created_at,proposed_amount,reserved,reserved_date) values (?,?,?,?,1,?)';
mysqli[46] = 'select user_id,proposed_amount AS amt,id from bids where project_id =  ? order by proposed_amount desc limit 1';
mysqli[48] = 'update users set reserve_amount = reserve_amount-?,balance=balance-? where id = ? limit 1';
mysqli[49] = 'select id from watchlists where user_id = ? and project_id = ? limit 1';
mysqli[50] = 'INSERT INTO watchlists (id,project_id,user_id,date_added) VALUES (NULL, ?, ?, ?)';
mysqli[51] = 'select p.title,b.user_id,p.status,p.avatar,p.date_closed,p.id from watchlists AS b inner join projects as p on p.id = b.project_id and b.user_id = ? order by b.id desc limit ?, 10';
mysqli[52] = 'select p.id  from watchlists AS b inner join projects as p on p.id = b.project_id and b.user_id = ? order by b.id desc';
mysqli[53] = 'delete from watchlists where project_id = ? and user_id = ? limit 1';
mysqli[54] = 'update users set email = ?, first_name = ?, last_name = ?,aboutme = ?,avatar = ?,  image = ? where id =  ? limit 1'; 
mysqli[55]  = 'select ?? from projects where id = ? Limit 1'; 
mysqli[56] = 'update projects set market_status = "removed", status = 0 where id =  ?  limit 1';
mysqli[57] = 'update users set password_hash = ?, password_salt = ? where email =  ? limit 1'; 
mysqli[58] = 'select transactionid from invoices where transactionid = ? limit 1';
mysqli[59] = 'select sum(if(date_added <= ? and  date_closed >= ? and market_status = "open",1,0)) as open, sum(if(date_added <= ? and  date_closed <= ?,1,0)) as closed, sum(if(date_added >= ? and  date_closed >= ?,1,0)) as future, sum(if(market_status = "sold",1,0)) as sold from projects';
mysqli[60] = 'select sum(if(status = "active",1,0)) as active, sum(if(status = "unverified",1,0)) as unverified, sum(if(status = "moderate",1,0)) as moderate, sum(if(status = "deactivate" or status = "unsubscribe",1,0)) as cancel  from users';
mysqli[61] = 'select sum(if(type = "package",1,0)) as package,sum(if(type = "winner",1,0)) as winner,sum(if(type = "bid",1,0)) as bid,sum(if(type = "sold",1,0)) as sold  from invoices';
mysqli[62] = 'select email,first_name,last_name,balance,status,date_format(created_at,"%d %M, %Y") as cdate,id from users where status = ? order by id asc limit ?, 10 ';
mysqli[63] = 'select email,first_name,last_name,balance,status,date_format(created_at,"%d %M, %Y") as cdate,id from users where status = ? or status = ? order by id asc limit ?, 10';
mysqli[64] = 'select email,first_name,last_name,balance,status,date_format(created_at,"%d %M, %Y") as cdate,id from users  order by id asc limit ?, 10';
mysqli[65] = 'select id from users where status = ? ';
mysqli[66] = 'select id from users where status = ? or status = ?'
mysqli[67] = 'select id from users ';
mysqli[68] = 'update bids set reserve = 0  where id = ? limit 1';

mysqli[69] = 'update users set status = ?  where id = ? limit 1';
mysqli[70] = 'select email,first_name,last_name,balance,status,date_format(created_at,"%d %M, %Y") as cdate,id from users where email like "%{{email}}%" and last_name like "%{{last_name}}%" and status like "%{{status}}%" and first_name like "%{{first_name}}%" order by id asc limit ?, 10';
mysqli[71] = 'select email,first_name,last_name,balance,status,date_format(created_at,"%d %M, %Y") as cdate,id from users where email like "%{{email}}%" and last_name like "%{{last_name}}%" and status like "%{{status}}%" and first_name like "%{{first_name}}%" order by id asc';
mysqli[72] = 'update projects  set title = ?,description = ?,avatar = ?,image = ?,category_id = ?,tags = ?,shipping_price = ?,shipping_description = ?,buynow = ?,feature = ?,date_added = ?,date_closed = ?,bprice = ?,mprice = ? where id = ? limit 1'; 
mysqli[101] = 'insert into user_addresses  (name,address1,address2,country,state,city,zipcode,phone,user_id,type) values (?,?,?,?,?,?,?,?,?,?)'; 
mysqli[102] = 'select * from user_addresses where user_id = ? and  type = ?  order by id asc limit 1';
mysqli[103] = 'update user_addresses set name = ?,address1 = ?,address2 = ?,country = ?,state = ?,city = ?,zipcode=?,phone=? where user_id = ? and  type = ?  order by id asc limit 1';
mysqli[104] = 'insert into referral  (from_id,to_id,date_added,source) values (?,?,?,?)'; 
mysqli[105] = 'select u.email,u.first_name,u.last_name,u.avatar,date_format(r.date_added,"%d %M, %Y") as added,r.id from referral as r left join users as u on r.to_id = u.id  where r.from_id = ?   order by id asc';

