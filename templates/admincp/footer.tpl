 </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->

    <script src="{$config.dpath}js/jquery.js"></script>
{foreach $external2js as $key => $val}
 <script src="{$config['externaljs']}{$val}.js"  type="text/javascript"></script>
{/foreach}
    <!-- Bootstrap Core JavaScript -->
    <script src="{$config.dpath}js/bootstrap.min.js"></script>
    <script src="{$config.dpath}js/common.js"></script>

   

</body>

</html>
