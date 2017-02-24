<div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Balance</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 {foreach $users as $key => $val}	
                                    <tr>
                                        <td>{$val.first_name} {$val.last_name}</td>
                                        <td>{$val.email}</td>
                                        <td>${$val.balance}</td>
                                        <td>{$val.status}</td>
                                        <td><a href="{$config.url}/admincp/users/edit/{$val.id}"><i class="fa fa-edit fa-green"></i> Edit</a></td>
                                    </tr>
                                 {/foreach}
                                </tbody>
                            </table>
                            {$pagination_html}
                        </div>