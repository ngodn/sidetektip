<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SCTP</title>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/template.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/scroll/style.css"/>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/scroll/scroll.css"/>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/tabs.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/table/themes/bluecluster/style.css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script src="<?php echo base_url();?>css/js/jquery-1.4.js"></script>
    <script src="<?php echo base_url();?>css/js/jquery-1.7.2.min.js"></script>
</head>
<body onLoad="proses_baru()">
	<?php $this->load->view("vHead") ?>
    <div id="main_atas" >
        <ul id="tabs">
            <li><?php echo  anchor('/cmain/','Cluster','id="current"');?></li>
            <li><?php echo  anchor('/cmain/result_page','Laporan Kontes');?></li>
         	<li><?php echo  anchor('/cmain/admin_page','Admin');?></li>    
        </ul>
        <div id="main_atas_content_menu"> <?php $this->load->view("vMenuCluster")?> 		
        </div>
    </div>
    <?php $this->load->view("vContentCluster") ?>
    <?php $this->load->view("vFooter") ?>
</body>
</html>




<script type="text/javascript">
	pilih = new Array();
	pilih['bisecting_kmeans'] = 'i';
	pilih['kmeans'] = 'k';
	pilih['single_linkage'] = 'i';
	pilih['average_linkage'] = 'i';
	pilih['complete_linkage'] = 'i';
	//add new method here
		
	$(document).ready(function(){
        $("#method").change(function(){
      		var method = $("#method").val();
			var a = document.getElementById('font_i');
			var b = document.getElementById('i');
			var c = document.getElementById('font_k');
			var d = document.getElementById('k');
			var e = document.getElementById('test_case');
			var f = document.getElementById('tc');
			if(pilih[method] == 'i'){
				a.style.visibility = 'visible';
				b.style.visibility = 'visible';
				b.value = '0.95';
				c.style.visibility = 'hidden';
				d.style.visibility = 'hidden';
				e.style.visibility = 'visible';
				f.style.visibility = 'visible'
			}
			else if(pilih[method] == 'k'){
				a.style.visibility = 'hidden';
				b.style.visibility = 'hidden';
				c.style.visibility = 'visible';
				d.style.visibility = 'visible';
				e.style.visibility = 'hidden';
				f.style.visibility = 'hidden'
			}
			else{
				a.style.visibility = 'hidden';
				b.style.visibility = 'hidden';
				c.style.visibility = 'hidden';
				d.style.visibility = 'hidden';
			}
        });
    });
	
	function checkbox(){
		var a = document.getElementById('font_i');
		var b = document.getElementById('i');
		var c = document.getElementById('font_k');
		var d = document.getElementById('k');	
		if(document.getElementById('metode_clustering').checked){
			document.getElementById('mclustering').style.visibility = 'visible';
			var method = $("#method").val();
			if(pilih[method] == 'i'){
				a.style.visibility = 'visible';
				b.style.visibility = 'visible';
				c.style.visibility = 'hidden';
				d.style.visibility = 'hidden';
			}
			else if(pilih[method] == 'k'){
				a.style.visibility = 'hidden';
				b.style.visibility = 'hidden';
				c.style.visibility = 'visible';
				d.style.visibility = 'visible';
			}
			else{
				a.style.visibility = 'hidden';
				b.style.visibility = 'hidden';
				c.style.visibility = 'hidden';
				d.style.visibility = 'hidden';
			}

		}
       	else{
          	document.getElementById('mclustering').style.visibility = 'hidden';
			a.style.visibility = 'hidden';
			b.style.visibility = 'hidden';
			c.style.visibility = 'hidden';
			d.style.visibility = 'hidden';
		}
		if(!(document.getElementById('metode_clustering').checked) && !(document.getElementById('test_case').checked) && !(document.getElementById('hapus_include').checked)){
			document.getElementById('submit').style.visibility = 'hidden';
		}
        else{
        	document.getElementById('submit').style.visibility = 'visible';
		}
	}
	
	function proses_baru(){ //fungsi menyimpan pembaharuan plagiat
	clusters = <?php echo json_encode($clusters) ?>;
		if(clusters){
			iosOverlay({
				text: "Proses Selesai",
				duration: 819,
				icon: "<?php echo base_url();?>css/overlay/img/check.png"
			});
		}
	}	
</script>

