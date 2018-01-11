<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/template.css" />
<title>SCTP</title>
</head>
<body>
<?php $this->load->view("vHead") ?>
<div id="main_tengah2_result">
	<div id="main_tengah_content_error">
    	<br><br><br><br><br><br>
		<h1><?php echo $error ?></h1>
     	<h3><?php echo  anchor('/cmain/','kembali ke Cluster');?></h3>        
    </div>
</div>
    <?php $this->load->view("vFooter") ?>
