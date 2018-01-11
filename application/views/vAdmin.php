<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/template.css" />
<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/tabs.css" />
<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/table/themes/blueresult/style.css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<title>SCTP</title>
</head>
<body>
<?php $this->load->view("vHead") ?>
<div id="main_atas" >
    <ul id="tabs">
        <li><?php echo  anchor('/cmain/','Cluster');?></li>
        <li><?php echo  anchor('/cmain/result_page','Laporan Kontes');?></li>
        <li><?php echo  anchor('/cmain/admin_page','Admin','id="current"');?></li>     
    </ul>
</div>
<div id="main_tengah2_result">
	<div id="main_tengah_content_error">
    <font size="3" color="#666666">Klik 'hapus' untuk membersihkan data yang tersimpan pada database sistem.</font>
    	<table class="tablesorter"> 
        <thead> 
        <tr>
            <th style="width:60%; text-align:center">Kontes</th> 
            <th style="width:10%; text-align:center"></th>        
            <th style=" text-align:center; font-size:14px; width:15%;">Admin</th>
            <th style=" text-align:center; font-size:14px; width:15%;">Tanggal</th>
        </tr>
        </thead> 
        <tbody> 
        <?php $a = 0; $date = date("d-m-Y");
		if(!empty($options_contest)){ 
		foreach ($options_contest as $id => $contest_name){ ?>
        <tr> 
            <td><?php echo $contest_name ?></td>
            <td style="text-align:center">
            <label id="button_hapus<?php echo $a ?>" onClick="hapus(<?php echo $a ?>)" style="color:#00F; text-decoration:underline; cursor:pointer"> hapus </label>   
            </td> 
            <td id='admin<?php echo $a ?>' style="text-align:center"></td>
            <td id='date<?php echo $a ?>' style="text-align:center"></td> 
        </tr>
        <?php
		$a++; 
		}
		}
		if(!empty($cn)){ 
		foreach ($cn as $id => $contest_name){
		?>
        <tr> 
            <td><?php echo $contest_name ?></td>
            <td style="text-align:center"> telah dihapus </td> 
            <td style="text-align:center"><?php echo $admin[$id] ?></td>
            <td style="text-align:center"><?php echo $tanggal[$id] ?></td> 
        </tr>
		<?php 
		$a++;
		}
		}
		?>
        </tbody>
        </table>       
    </div>
</div>
    <?php $this->load->view("vFooter") ?>
    
<script src="<?php echo base_url();?>css/js/jquery-1.7.2.min.js"></script>    
<script src="<?php echo base_url();?>css/js/jquery-1.4.js"></script>
<script type="text/javascript">
function hapus(a){
	contests = <?php echo json_encode($con) ?>;
	admin = <?php echo json_encode($user_system) ?>;
	date = <?php echo json_encode($date) ?>;
	id_contest = contests[a];
	var r = confirm("Apakah anda yakin?");
	if (r == true) {
	x = document.getElementById('button_hapus'+a);
	x.innerHTML = 'telah dihapus';
	x.style.color = '#000';
	x.style.textDecoration = 'none';
	y = document.getElementById('admin'+a);
	y.innerHTML = admin;
	z = document.getElementById('date'+a);
	z.innerHTML = date;
		$.ajax({
		   type : "POST",
		   url  : "<?php echo base_url(); ?>index.php/cmain/database_sistem",
		   data : {id_contest : id_contest, admin:admin},
		   success: function(data){
				}			   
		})	
	}
	
}

</script>
