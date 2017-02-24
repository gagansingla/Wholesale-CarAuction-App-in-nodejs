mysqli[0]  = 'select email,id,password_salt,password_hash from users where email = "{{username}}" Limit 1';  

exports.mysqli = function(data,row)
{
     k = mysqli[row];

     data.each(function(key,val)
     {
     	k.replace('{{'+key+'}}',val);

     });

     return k;
}