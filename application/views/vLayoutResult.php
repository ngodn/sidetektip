<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SCTP</title>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/template.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/tabs.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/table/themes/blueresult/style.css"/>
    <script type="text/javascript" src="<?php echo base_url();?>css/table/jquery-latest.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>css/table/jquery.tablesorter.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>css/table/jquery.metadata.js"></script>
    <script src="<?php echo base_url();?>css/js/jquery-1.4.js"></script>
    <script src="<?php echo base_url();?>css/js/jquery-1.7.2.min.js"></script>
    </script>
</head>
<body>
	<?php $this->load->view("vHead") ?>
    <div id="main_atas" >
        <ul id="tabs">
          <li><?php echo  anchor('/cmain/','Cluster');?></li>
          <li><?php echo  anchor('/cmain/result_page','Laporan Kontes','id="current"');?></li> 
          <li><?php echo  anchor('/cmain/admin_page','Admin');?></li> 
        </ul>
        <div id="main_atas_content_menu_result"> <?php $this->load->view("vMenuResult")?> </div>
    </div>
    <?php $this->load->view("vContentResult"); ?>
    <?php $this->load->view("vFooter") ?>
</body>
</html>

<script type="text/javascript">
$(document).ready(function() 
    { 
        $("#myTable").tablesorter(); 
    } 
); 

$(function() {		
		$("#tablesorter-demo").tablesorter({sortList:[[1,0],[2,0]], widgets: ['zebra']});
		$("#options").tablesorter({sortList: [[0,0]], headers: { 3:{sorter: false}, 4:{sorter: false}}});
	});	
</script>

 

