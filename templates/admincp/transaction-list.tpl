<div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                         <th>Invoiceid</th>
                                        
                                        <th>User</th>
                                        <th>Project Title</th>
                                        <th>Type</th>
                                        <th>Status</th>
                                        <th>Amount</th>
                                        <th>Gateway</th>
                                        <th>Description</th>
                                        <th>Date Added</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 {foreach $trans as $key => $val}	
                                    <tr>
                                        <td>{$val.id}</td>
                                       
                                        <td>{$val.email}</td>
                                        <td>{$val.title} ({$val.pid})</td>
                                        <td>{$val.type}</td>
                                        <td>{$val.istatus}</td>
                                        <td>${$val.amount}</td>
                                        <td>{$val.gateway}</td>
                                        <td>{$val.description}</td>
                                        <td>{$val.date_add}</td>
                                    </tr>
                                 {/foreach}
                                </tbody>
                            </table>
                            {$pagination_html}
                        </div>