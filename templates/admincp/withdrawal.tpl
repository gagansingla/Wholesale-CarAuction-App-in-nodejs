{include file="/admincp/header.tpl" nocache}
<div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Withdrawal 
                            </li>
                        </ol>
                    </div>
                </div>
     {if $message != ''}
         <div class="row">
          <div class="col-lg-12">
            <div class="alert alert-success"> <i class="fa fa-warning"></i> {$message}. </div>
          </div>
         </div> 
       {/if}
     <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Amount</th>
                                        <th>Username</th>
                                        <th>Request Date</th>
                                        <th>PayDetails</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
      {foreach $withdraw as $key => $val}  
                                    <tr>
                                        <td>{$val.amount}</td>
                                        <td>{$val.name}</td>
                                        <td>${$val.date_added}</td>
                                        <td>{$val.method} {$val.details}</td>
                                        <td>{if $val.paid} Paid {$val.paid_date} {elseif !$val.paid}<a href="{$config.url}/admincp/withdrawal/paid/{$val.id}">Mark As Paid</a>{/if}</td>
                                    </tr>
                                 {/foreach}
                                </tbody>
                            </table>
                            {$pagination_html}
                        </div>
                                        <!-- /.row -->
</div>
           
{include file="/admincp/footer.tpl" nocache}