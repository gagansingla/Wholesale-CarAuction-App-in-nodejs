<div class="col-lg-12 m-top-20">
               <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Message</th>
                                        <th>Status</th>
                                        <th>Date Added</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 {foreach $messages as $key => $val}   
                                    <tr>
                                        <td>{$val.fname}</td>
                                        <td>{$val.messages_short}..</td>
                                        <td>{$val.date_add}</td>
                                        
                                    </tr>
                                 {/foreach}
                                </tbody>
                            </table>
                            {$pagination_html}
                        </div>
 </div>
                </div>