 </div>
  <footer>
	<div class="container-fluid footer_block_2">
		<div class="row copy_right">
			<div class="col-md-12">
				<p class="text-center">All rights reserved. Copyrighted Wholesale-Express.ca 2015.</p>
			</div>
		</div>
	</div>
</footer>
      
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="{$config['externaljs']}common.js"  type="text/javascript"></script>
<script type="text/javascript"  language="javascript" src="{$config['externaljs']}bootstrap.js"></script>
<script type="text/javascript"  language="javascript" src="{$config['externaljs']}register.js"></script>
{foreach $external2js as $key => $val}
 <script src="{$config['externaljs']}{$val}.js"  type="text/javascript"></script>
{/foreach}
{if $register_fail == 1} <script type="text/javascript">
      $(function() { $('#myModal').modal('show'); 
  });
	</script> {/if}
	{if $login_fail == 1} <script type="text/javascript">
      $(function() { $('#login').modal('show'); 
  });
	</script> {/if}
  </body>
</html>