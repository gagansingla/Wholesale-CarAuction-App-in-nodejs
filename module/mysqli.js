

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
mysqli[0]  = 'select email,id,password_salt,password_hash,first_name,last_name,admin,status from users where email = "{{username}}" Limit 1';  
mysqli[1] = 'select * from projects where date_added <= "{{datge}}" and date_closed >= "{{datge}}" and market_status not in ("sold","closed","removed") order by id desc LIMIT 15';
mysqli[3] = 'select * from projects  where date_added >= "{{datge}}" and feature = 1 and market_status = "open"  order by id desc LIMIT 10';
mysqli[4] = 'select * from projects  where date_closed <= "{{datge}}" and market_status != "removed" order by id desc limit 10'; 
mysqli[5] = 'select c.id,c.name, (COUNT(parent.id) - 1) AS depth from categories as c, categories AS parent where c.lft BETWEEN parent.lft AND parent.rgt  group by c.id   order by c.lft asc'; 
mysqli[6] = 'select p.* from projects AS p  where date_added <= "{{datge}}" and date_closed >= "{{datge}}" and buynow = 1 and market_status = "open"'; 
mysqli[7] = 'select p.* from projects AS p inner join categories AS c on c.id = p.category_id,  categories AS parent where c.lft BETWEEN parent.lft AND parent.rgt and date_added <= "{{datge}}" and market_status = "open" and date_closed >= "{{datge}}"   {{cid}}  {{search}} {{where}} group by p.id order by p.id desc {{limit}}';
mysqli[8] = 'select p.* from projects AS p inner join categories AS c on c.id = p.category_id,  categories AS parent where c.lft BETWEEN parent.lft AND parent.rgt and date_added >= "{{datge}}" and market_status = "open"  {{cid}}  {{search}} group by p.id order by p.id desc';
mysqli[9] = 'select p.* from projects AS p inner jon categories AS c on c.id = p.category_id,  categories AS parent where c.lft BETWEEN parent.lft AND parent.rgt  and date_closed <= "{{datge}}" and market_status != "removed"  {{cid}}  {{search}} group by p.id order by p.id desc '; 
mysqli[10] = 'select p.* from projects AS p inner jon categories AS c on c.id = p.category_id,  categories AS parent where c.lft BETWEEN parent.lft AND parent.rgt  and date_added <= "{{datge}}" and market_status = "open" and date_closed >= "{{datge}}" {{cid}}    {{search}} and buynow = 1'; 
mysqli[11] = 'insert into users (email,role,first_name,last_name,password_hash,password_salt,created_at,balance) values ("{{email}}","{{role}}",?,?,"{{password_hash}}","{{password_salt}}","{{created_at}}",0)'; 
mysqli[12] = 'select id,email,first_name,last_name from users  where email = "{{email}}" order by id desc';
mysqli['cid'] = ' and p.category_id IN (select c.id from categories as s WHERE c.lft between s.lft and s.rgt and s.id={{cid}})';
mysqli['search'] = ' and (p.title like "%{{search}}%" or p.description like "%{{search}}%") ' ;
mysqli['title'] = ' and p.title like "%{{search}}%"';
mysqli['avatar'] = ' and avatar IS NOT NULL';
mysqli['noshipping'] = ' and shipping_price = 0 ';
mysqli['pid'] = ' and p.id = {{pid}}';
mysqli[13] = 'select p.* from projects AS p  inner jon categories AS c on c.id = p.category_id,  categories AS parent where c.lft BETWEEN parent.lft AND parent.rgt and p.id > 0 {{cid}}  {{search}} group by p.id order by p.id desc'; 
mysqli[14] = 'insert into projects  (title,description,avatar,image,category_id,tags,user_id,shipping_price,shipping_description,created_at,buynow,feature,sprice,rprice,date_added,date_closed,status,bprice,mprice,iprice,wprice) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)'; 
mysqli[15] = 'select * from projects where user_id = ? and market_status !="removed" order by id desc limit ? , 15';
mysqli[16] = 'select * from projects where date_added <= "{{datge}}" and date_closed >= "{{datge}}" and market_status not in ("sold","closed","removed") order by id desc';
mysqli[17] = 'select * from projects  where date_added >= "{{datge}}"  order by id desc';
mysqli[18] = 'select user_id from projects where user_id = ? order by id desc';
mysqli[19] = 'select p.*,date_format(p.date_added,"%m/%d/%Y") as date_add,date_format(p.date_closed,"%m/%d/%Y") as date_close,u.first_name,u.email,u.last_name from projects as p left join users as u on u.id = p.user_id where p.id = ? limit 1';
mysqli[20] = 'insert into bids  (project_id,user_id,created_at,proposed_amount) values (?,?,?,?)'; 
mysqli[21] = 'update projects set wprice = ?, date_closed = ADDTIME(date_closed,?) where id =  ? limit 1'; 
mysqli[22] = 'select user_id from bids where project_id =  ? and user_id = ? limit 1';
mysqli[23] = 'update bids set proposed_amount = ? where project_id =  ? and user_id = ? limit 1';
mysqli[24] = 'select b.user_id,SUBSTRING(CONCAT(u.first_name," ",u.last_name),1,10) AS name,b.proposed_amount from bids AS b inner join users as u on u.id = b.user_id where b.project_id =  ? order by proposed_amount desc limit 10';
mysqli[25]  = 'select ?? from users where id = ? Limit 1';  
mysqli[26]  = 'select * from packages';  
mysqli[27] = 'update users set customerid = ?, paymentid = ?, paymethod = ? where id =  ? limit 1'; 
mysqli[28] = 'update users set balance = balance+? where id =  ? limit 1'; 
mysqli[29] = 'select * from packages where id =  ? limit 1';
mysqli[30] = 'update users set balance = balance-? where id =  ? limit 1';
mysqli[31] = 'INSERT INTO invoices (id, transactionid, gateway, date_added, user_id, primary_id, type, description, amount,status,istatus) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
mysqli[32] = 'select b.id,b.proposed_amount,b.user_id,u.first_name,u.email,u.last_name,b.project_id from bids as b inner join users as u on u.id = b.user_id where b.project_id = ? order by b.proposed_amount desc limit 1';
mysqli[34] = 'update projects set market_status = ? where id =  ? and market_status = "open" limit 1';
mysqli[33] = 'select count(b.user_id) as bid from bids AS b inner join users as u on u.id = b.user_id where b.project_id =  ? order by proposed_amount desc';
mysqli[35] = 'update bids set awarded = 1,awarded_date = ? where id =  ? and awarded = 0 limit 1';
mysqli[36] = 'select p.*,b.user_id,SUBSTRING(CONCAT(u.first_name," ",u.last_name),1,20) AS name,u.state,u.country,u.avatar AS uavatar,b.proposed_amount from bids AS b inner join users as u on u.id = b.user_id and b.awarded = 1 inner join projects as p on p.id = b.project_id order by p.date_closed desc';
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
mysqli[54] = 'update users set email = ?, first_name = ?, last_name = ?,aboutme = ?,avatar = ?,  image = ?, address1 = ?, address2 = ?, country	= ?, state = ?, city = ?, zip = ?, phone = ?  where id =  ? limit 1'; 
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

mysqli[73] = 'select p.*,date_format(p.date_added,"%m/%d/%Y") as date_add,date_format(p.date_closed,"%m/%d/%Y") as date_close,u.first_name,u.email,u.last_name from projects as p left join users as u on u.id = p.user_id where p.id > 0 {{where}}  order by p.id desc  limit ?, 10';
mysqli[74] = 'select p.id from projects as p left join users as u on u.id = p.user_id where p.id > 0 {{where}} '; 
mysqli[75] = 'select c.*, (COUNT(parent.id) - 1) AS depth from categories as c, categories AS parent where c.lft BETWEEN parent.lft AND parent.rgt  group by c.id order by c.lft asc  limit ?, 10';
mysqli[76] = 'select c.id from categories as c '; 
mysqli[77] = 'select c.* from categories as c where c.id = ?'; 
mysqli[78] = 'insert into categories (name,description,created_at,updated_at,type,lft,rgt,parent_id) values(?,?,?,?,"product",?,?,?)'; 
mysqli[79] = 'update categories set  name = ?,description = ?,updated_at = ? where id = ?'; 
mysqli[80] = 'select i.*,date_format(i.date_added,"%m/%d/%Y") as date_add,u.first_name,u.email,u.last_name,p.title,p.id as pid from invoices as i left join projects as p on ((p.id = i.primary_id and i.type in ("sold","winner","holded","declined")) or (i.type = "bid" and p.id in (select b.project_id from bids as b where b.id = i.primary_id))) left join users as u on u.id = i.user_id where i.id > 0 {{where}} order by i.id desc  limit ?, 10'; 
mysqli[81] = 'select count(i.id) AS id,sum(i.amount) AS paid from invoices as i left join projects as p on ((p.id = i.primary_id and i.type in ("sold","winner","holded","declined")) or (i.type = "bid" and p.id in (select b.project_id from bids as b where b.id = i.primary_id))) left join users as u on u.id = i.user_id where i.id > 0 {{where}}'; 
mysqli[82] = 'select i.*,date_format(i.date_added,"%m/%d/%Y") as date_add,u.first_name,u.email,u.last_name,p.title,p.id as pid from invoices as i left join projects as p on ((p.id = i.primary_id and i.type in ("sold","winner","holded","declined")) or (i.type = "bid" and p.id in (select b.project_id from bids as b where b.id = i.primary_id))) left join users as u on u.id = i.user_id where i.id > 0 {{where}} order by i.id desc '; 
mysqli[83] = 'insert into buynow (project_id,user_id,amount,date_added) values(?,?,?,?)'; 
mysqli[84] = 'update users set balance=balance-? where id = ? limit 1';
mysqli[85] = 'select p.title,p.id,b.user_id,b.amount,p.status,p.avatar,date_format(b.date_added,"%d %M, %Y") AS date_add from buynow AS b inner join projects as p on p.id = b.project_id and b.user_id = ?  order by b.id desc limit ?, 10';
mysqli[86] = 'select p.id from buynow AS b inner join projects as p on p.id = b.project_id and b.user_id = ?';
mysqli[87] = 'update users set fb_id = ?, fb_json = ? where id =  ? limit 1';
mysqli[88] = 'select * from users where fb_id =  ? limit 1';
mysqli[89] = 'update users set li_id = ?, li_json = ? where id =  ? limit 1';
mysqli[90] = 'select * from users where li_id =  ? limit 1';
mysqli[91] = 'insert into reviews (user_id,date_added,subject,message,rating,dispute) values(?,?,?,?,?,?)';
mysqli[92] = 'select p.*,date_format(p.date_added,"%m/%d/%Y") as date_add,u.first_name,u.email,u.last_name from reviews as p left join users as u on u.id = p.user_id where p.id > 0 and p.dispute = 0   order by p.id desc  limit ?, 10';
mysqli[93] = 'select u.last_name from reviews as p left join users as u on u.id = p.user_id where p.id > 0  and p.dispute = 0  order by p.id desc';
mysqli[94] = 'select p.*,date_format(p.date_added,"%m/%d/%Y") as date_add,u.first_name,u.email,u.last_name,SUBSTR(p.description,1,50) as description_short from blogs as p left join users as u on u.id = p.user_id where p.id > 0   order by p.id desc  limit ?, 10';
mysqli[95] = 'select u.last_name from blogs as p left join users as u on u.id = p.user_id where p.id > 0   order by p.id desc';
mysqli[96] = 'insert into blogs (title,description,date_added,user_id,status) values (?,?,?,?,?)';
mysqli[97] = 'select p.*,u.first_name,SUBSTR(p.description,1,50) as description_short,date_format(p.date_added,"%m/%d/%Y") as date_add from blogs as p left join users as u on u.id = p.user_id   where p.id = ?';
mysqli[98] = 'update blogs set title = ? ,description = ? where id = ?';
mysqli[99] = 'update blogs set image = ? ,avatar = ? where id = ?';
mysqli[100] = 'update blogs set status = ?  where id = ?';

mysqli[101] = 'insert into user_addresses  (name,address1,address2,country,state,city,zipcode,phone,user_id,type) values (?,?,?,?,?,?,?,?,?,?)'; 
mysqli[102] = 'select * from user_addresses where user_id = ? and  type = ?  order by id asc limit 1';
mysqli[103] = 'update user_addresses set name = ?,address1 = ?,address2 = ?,country = ?,state = ?,city = ?,zipcode=?,phone=? where user_id = ? and  type = ?  order by id asc limit 1';
mysqli[104] = 'insert into referral  (from_id,to_id,date_added,source) values (?,?,?,?)'; 
mysqli[105] = 'select u.email,u.first_name,u.last_name,u.avatar,date_format(r.date_added,"%d %M, %Y") as added,r.id,r.status from referral as r left join users as u on r.to_id = u.id  where r.from_id = ?   order by id asc';
mysqli[106] = 'select p.id,p.title from projects p where p.date_added <= "{{datge}}" and p.date_closed >= "{{datge}}" and p.market_status not in ("sold","closed") and p.id not in(select a.project_id from projects_autobid a where a.project_id = p.id and user_id =  ?) ';
mysqli[107] = 'insert into projects_autobid  (user_id,project_id,start_amount,amount,balance,date_added) values (?,?,?,?,?,?)'; 
mysqli[108] = 'update projects_autobid  set balance=balance-? ,bids = bids +1,date_updated = ? where user_id = ? and  project_id = ? '; 
mysqli[109] = 'select id from projects_autobid where user_id = ? and  project_id = ?   order by id asc';
mysqli[110] = 'select p.id,p.title,p.avatar,date_format(p.date_closed,"%d %M, %Y") as closedon ,a.balance from projects_autobid a inner join projects p on p.id = a.project_id where a.user_id = ? and  p.market_status = "open" and p.status = 1   order by id asc';
mysqli[111] = 'select user_id,amount,balance from projects_autobid where project_id = ? and balance >= ?+0.01 and status !="closed"   order by balance desc limit 1';
mysqli[112] = 'select user_id,amount,balance from projects_autobid where project_id = ? and balance >= ?+0.01  and status !="closed"  order by balance desc limit 1,1';
mysqli[113] = 'update projects_autobid  set status="closed" , date_updated = ?   where  project_id = ? and user_id not in(?) and status!="closed"'; 

mysqli[151] = 'select p.*,SUBSTR(p.description,1,50) as description_short,date_format(p.date_added,"%m/%d/%Y") as date_add,u.first_name,u.email,u.last_name from blogs as p left join users as u on u.id = p.user_id where p.id > 0  and p.status = "open"  and (p.title like "{{search}}%" or p.description like "{{search}}%") order by p.id desc  limit ?, 50';
mysqli[152] = 'select p.*,SUBSTR(p.message,1,50) as message_short,date_format(p.date_sent,"%m/%d/%Y") as date_add,concat(f.first_name," ",f.last_name) as fname,concat(t.first_name," ",t.last_name) as tname from pmb as p inner join users as f on f.id = p.from_id inner join users as t on t.id = p.to_id and p.id = (select m.id from pmb as m where m.r_id = p.r_id {{where1}} order by m.id desc limit 1) where (p.from_id = ? or p.to_id = ?) {{where}} group by p.r_id  order by p.id desc  limit ?, 10';
mysqli[153] = 'select p.id from pmb as p inner join users as f on f.id = p.from_id inner join users as t on t.id = p.to_id where (p.from_id = ?  or p.to_id = ?) {{where}} group by p.r_id order by p.id desc ';
mysqli[154] = 'select p.*,SUBSTR(p.message,1,50) as message_short,date_format(p.date_sent,"%m/%d/%Y") as date_add,concat(f.first_name," ",f.last_name) as fname,concat(t.first_name," ",t.last_name) as tname from pmb as p inner join users as f on f.id = p.from_id inner join users as t on t.id = p.to_id where (p.from_id = ?  or p.to_id = ?) {{where}} order by p.id asc ';
mysqli[155] = 'update pmb set `read` = 1,date_read = ? where r_id = ? and to_id = ? ';
mysqli[156] = 'insert into pmb (from_id,to_id,`read`,subject,message,date_sent,date_read,r_id,from_status,to_status) values (?,?,0,?,?,?,"0000-00-00 00:00:00",?,?,?)';
mysqli[157] = 'update pmb set to_status = ? where r_id = ? and to_id = ? ';
mysqli[158] = 'update pmb set from_status = ? where r_id = ? and from_id = ? ';
mysqli[159] = 'select id,email,first_name,last_name,admin from users';
mysqli[160] = 'select id from bids where user_id = ? and project_id = ? and awarded = 1 ';
mysqli[161] = 'select id from buynow where user_id = ? and project_id = ? ';
mysqli[162] = 'select p.*,date_format(p.date_added,"%m/%d/%Y") as date_add,date_format(p.date_closed,"%m/%d/%Y") as date_close,u.first_name,u.email,u.last_name from projects as p left join users as u on u.id = p.user_id where p.market_status = "open" and p.date_closed < ? group by id order by id desc';
mysqli[163] = 'insert into product_images (avatar,image,date_added,project_id) values (?,?,?,?) ';
mysqli[164] = 'select * from  product_images where project_id = ?';
mysqli[165] = 'delete from  product_images where  id NOT IN ({{delete}}) and project_id = ?';
mysqli[166] = 'select ?? from users where  admin = 1 limit 1';
mysqli[167] = 'select p.*,u.first_name,SUBSTR(p.description,1,50) as description_short,date_format(p.date_added,"%m/%d/%Y") as date_add from blogs as p left join users as u on u.id = p.user_id    order by p.id desc limit 5';
mysqli[168] = 'select p.*,date_format(p.date_added,"%m/%d/%Y") as date_add,u.first_name,u.email,u.last_name from reviews as p left join users as u on u.id = p.user_id where p.id > 0 and p.dispute = 1   order by p.id desc  limit ?, 10';
mysqli[169] = 'select u.last_name from reviews as p left join users as u on u.id = p.user_id where p.id > 0  and p.dispute = 1  order by p.id desc';
mysqli[170] = 'select * from withdrawals where user_id = ?';
mysqli[171] = 'insert into withdrawals (user_id,amount,date_added,details,method,paid) values(?,?,?,?,?,0) ';
mysqli[172] = 'select w.*,CONCAT(u.first_name," ",u.last_name) AS name from withdrawals as w inner join users as u on u.id = w.user_id order by w.id desc limit ?,10';
mysqli[173] = 'update  withdrawals set paid = 1,paid_date = ? where id = ? and paid = 0 limit 1';
mysqli[174] = 'select id from withdrawals order by id desc';
mysqli[175] = 'select c.*, (COUNT(parent.id) - 1) AS depth from categories as c, categories AS parent where c.lft BETWEEN parent.lft AND parent.rgt  group by c.id order by c.lft asc';
mysqli[176] = 'select max(rgt) as mrgt from categories ';
mysqli[177] = 'update categories set rgt = rgt + 2 where rgt > ?';
mysqli[178] = 'update categories set lft = lft + 2 where lft > ?';
mysqli[179] = 'select max(lft) as mrgt from categories where id = ?';
mysqli[180] = 'select lft,rgt, (rgt - lft + 1) as myw FROM categories where id = ?';
mysqli[181] = 'delete FROM categories where lft between ? AND ?';
mysqli[182] = 'update categories set rgt = rgt - ? where rgt > ?';
mysqli[183] = 'update categories set lft = lft - ? where lft > ?';



mysqli[184] = 'select * from  membership ';
mysqli[185] = 'select * from  membership_plan';
mysqli[186] = 'select * from  membership_permission';
mysqli[187] = 'select mp.*,m.name as rolename,mpe.name as permissionname from  membership_plan as mp left join membership as m on mp.membership_id = m.id  left join membership_permission As mpe on mp.permission_id = mpe.id';
mysqli[188] = 'select * from  membership_permission';
mysqli[189] = 'insert into  membership values ("",?,?)';
mysqli[190] = 'update  membership set name = ?, description = ? where id = ?';
mysqli[191] = 'insert into  membership_plan (name,description,amount,length,format,membership_id,permission_id) values (?,?,?,?,?,?,?)';
mysqli[192] = 'update  membership_plan set name = ?, description = ?,amount = ?,length = ?,format = ?,membership_id = ?,permission_id = ? where id = ?';
mysqli[193] = 'insert into  membership_permission values ("",?,?)';
mysqli[194] = 'select * from membership_permission_default';
mysqli[195] = 'select * from membership_permission_detail where plan_id = ?';
mysqli[196] = 'insert into membership_permission_detail values ("",?,?,?)';
mysqli[197] = 'update membership_permission_detail set value = ? where plan_id = ? and permission_id = ?';
mysqli[199] = 'select mpd.*,mpde.varname from  membership_permission_detail as mpd inner join membership_permission_default as mpde on mpde.id = mpd.permission_id inner join membership_permission as mp on mp.id = mpd.plan_id inner join membership_plan as mpl on mpl.permission_id = mp.id inner join membership_user as mu on mu.plan_id = mpl.membership_id where mu.user_id = ?';
mysqli[200] = 'select id,parentid,lft,rgt from categories where parent_id = ? order by id asc';
mysqli[201] = 'update categories set rgt = rgt + ?,lft = lft + ? where cid = ?';
mysqli[202] = 'select * from membership_user where user_id = ?';
mysqli[203] = 'insert into membership_user (plan_id,user_id,status,date_paid,paid,added_date,renewal_date) values (?,?,?,?,?,?,?)';
mysqli[204] = 'update membership_user set plan_id = ?,status = ?,date_paid = ?,paid = ?,added_date = ?,renewal_date = ? where user_id = ?';
mysqli[205] = 'select * from membership_user where user_id = ?';
mysqli[206] = 'select sum(if(year(date_added) = ?,1,0)) as ycnt,sum(if(month(date_added) = ?,1,0)) as mcnt from projects where user_id = ?';
mysqli[207] = 'select sum(if(year(created_at) = ?,1,0)) as ycnt,sum(if(month(created_at) = ?,1,0)) as mcnt from bids where user_id = ?';

mysqli[114] = 'select cid from profile_categories where user_id = ? and cid = ?  limit 1';
mysqli[115] = 'delete from profile_categories where user_id = ? and cid not in ( ? ) ';
mysqli[116] = 'insert into profile_categories (user_id,cid) values (?,?)';
mysqli[117] = 'SELECT GROUP_CONCAT( cid ) as mcat FROM  profile_categories WHERE  user_id = ? ';
mysqli[118] = 'select u.email,u.first_name,u.last_name,u1.first_name as refererFname,u1.last_name as refererLname,u1.email as refererEmail,u.avatar,date_format(r.date_added,"%d %M, %Y") as added,r.id,r.status,r.from_id from referral as r inner join users as u on r.to_id = u.id inner join users as u1 on r.from_id = u1.id  where r.from_id > 0   order by id asc   limit ?, 10';
mysqli[119] = 'update referral set status = 1 where id =  ? limit 1'; 
mysqli[120] = 'select u.email,u.first_name,u.last_name,u1.first_name as refererFname,u1.last_name as refererLname,u1.email as refererEmail,u.avatar,date_format(r.date_added,"%d %M, %Y") as added,r.id,r.status from referral as r inner join users as u on r.to_id = u.id inner join users as u1 on r.from_id = u1.id  where r.from_id > 0   order by id asc';
mysqli[121] = 'delete from user_addresses where user_id = ? and  type = ?  order by id asc limit 1';
