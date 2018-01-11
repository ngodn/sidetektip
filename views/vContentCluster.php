<div id="main_tengah2">
	
	<div id="main_tengah_content">
        <div id="tengah_kiri" style=" background-color:#333">
        <table class="tablesorter2"> 
            <thead> 
            <tr>
                <th id='headcluster' class="headcluster" style="width:70%; text-align:center; cursor:pointer" onclick="clusters_sorter(1)" onmouseover="tkiri_over(1)" onmouseout="tkiri_out(1)">Cluster</th> 
                <th id='headsc' style="width:30%; text-align:center; cursor:pointer" onclick="clusters_sorter(2)" onmouseover="tkiri_over(2)" onmouseout="tkiri_out(2)"></th> 
                <th style="text-align:center; position:relative; min-width:5.5px; cursor:pointer" onclick="reset_warna(1)"></th>
            </tr>
            </thead>
        </table>
            <div style="overflow:auto; height:341px; border-bottom:1px solid #ddd; margin-top:-3px">
            <?php
            $c=1;
            ?>
            <table class="tablesorter2">
            <tbody id="table2"> 
            <?php 
            $c=1;
            if (!empty($clusters)){ 
			?>
            <!--
			<tr> 
                <td id="c0" onclick="warna_cluster(0);id_peserta(-1)" style="width:70.8%; text-align:center; cursor:pointer; font: bold 13.5px/32px Arial"><?php echo "Semua"; ?></td>
                <td id="cc0" onclick="warna_cluster(0);id_peserta(-1)" style="text-align:center; width:29.2%; cursor:pointer; font: bold 13.5px/32px Arial;"><?php echo count($clusters, COUNT_RECURSIVE) ?></td> 
            </tr>    
            -->
                <?php
                foreach($clusters as $docs) {
                ?>
                <tr> 
                    <td id="c<?php echo $c ?>" onclick="warna_cluster(<?php echo $c ?>);id_peserta(<?php echo $c-1 ?>)" style="width:70.8%; text-align:center; cursor:pointer; font: bold 13.5px/32px Arial"><?php echo 'Cluster '.$c; ?></td>
                    <td id="cc<?php echo $c ?>" onclick="warna_cluster(<?php echo $c ?>);id_peserta(<?php echo $c-1 ?>)" style="text-align:center; width:29.2%; cursor:pointer; font: bold 13.5px/32px Arial;"><?php echo count($docs) ?></td> 
                </tr>
                <?php
				$c++;
                } 
				if($c > 11){
				}
				else{
					for ($d=0;$d<11-$c;$d++){
					?>
					<tr> 
						<td style="text-align:center; width:70.8%;"></td>
						<td style="text-align:center; width:29.2%; font: bold 13.5px/32px Arial"><font style='visibility:hidden'>_</font></td>  
					</tr>
					<?php
					}
				}
            }
            else{
                for ($d=0;$d<11;$d++){
            ?>
            <tr> 
                <td style="text-align:center; width:70.8%;"></td>
				<td style="text-align:center; width:29.2%; font: bold 13.5px/32px Arial"><font style='visibility:hidden'>_</font></td>   
            </tr>
            <?php
                }
            }
            ?>
            </tbody> 
            </table> 
            </div>
		</div>
             
        <div id="tengah_tengah">
            <table class="tablesorter3"> 
                <thead style="min-height:50px; width:90%; background:#333; color:#FFF"> 
                    <tr>
                    <th id="th1" style="width:25%; text-align:center;cursor:pointer" onclick="sorter(0),sorter_thead(1)" onmouseover="tt_over(1)" onmouseout="tt_out(1)">ID Peserta</th> 
                    <th id="th2" style="width:10%; text-align:center;cursor:pointer" onclick="sorter(1),sorter_thead(2)" onmouseover="tt_over(2)" onmouseout="tt_out(2)">Jumlah Submit</th>
                    <th id="th3" style="width:25%; text-align:center;cursor:pointer" onclick="sorter(2),sorter_thead(3)" onmouseover="tt_over(3)" onmouseout="tt_out(3)">Submit Terakhir</th> 
                    <th style="width:5%; text-align:center; cursor:context-menu"><input id='checklist_all' type="checkbox" onclick="check_all()"/></th>
                    <th id="th4" style="width:10%; text-align:center;cursor:pointer" onclick="sorter(3),sorter_thead(4)" onmouseover="tt_over(4)" onmouseout="tt_out(4)">Nilai</th> 
                    <th id="th5" style="width:25%; text-align:center;cursor:pointer" onclick="sorter(4),sorter_thead(5)" onmouseover="tt_over(5)" onmouseout="tt_out(5)">Pemeriksa</th> 
                    <th style="text-align:center; position:relative; min-width:3px; cursor:pointer" onclick="reset_warna(2)"></th>
                    </tr>
                </thead>  
            </table>
          <div style="overflow:auto; vertical-align:center; height:340px; border-bottom:1px solid #ddd; margin-top:-3px">
          <table class="tablesorter3"> 
                <tbody id="peserta" style="background:#fefefe;padding:5px;">
                 <?php for ($d=0;$d<10;$d++){?> 
                    <tr style="height:32px"><td style="width:24.2%; position:relative;"><font style='visibility:hidden'>_blank</font></td>
                    <td style="width:10.5%"></td>
                    <td style="width:24.5%"></td>
                    <td style="width:5.8%"></td>
                    <td style="width:10.2%"></td>
                    <td style="width:24.8%"></td>
          			</tr>
                    
                 <?php } ?>
                </tbody>
          </table> 
  		  </div>
		</div>
        
        <div id="tengah_kanan" style="color:#000;background-color:#333">
        <h3 style="text-align:center; color:#FFF" >Kode Program</h3> 
            <div class="scroll-pane3" style="background-color:#fafafa; max-height:280px">
               <h3 id='expanderHead' style='cursor:pointer; margin-left:25px'>grade content<span id='expanderSign'>+</span></h3>
               <div id='expanderContent' style='display:none;margin-left:40px; max-height:240px; color:#003; font-size:14px; font:'Courier New', Courier, monospace'></div>
               <hr>
               <div id='kode_program' style='padding-left:25px;padding-top:5px; padding-bottom:10px; font-size:14px;'></div>
            </div>
            <hr>
            <div id="keterangan" style="height:58px; margin-top:-12px; background:#fafafa">
            	
            </div>
		</div>
        
	</div>
    
  	<?php if (!empty($clusters)) { ?>
	<div id="div_fbk" style="padding-left:25px; position:relative; margin-top:-2px">
    <input id='fbk' onclick='show_banding_kode()' type='checkbox' style='background:#CCC; margin-bottom:10px; margin-left:10px'/> Fitur pembandingan kode program
    <div style="float:right; position:relative; padding-right:42%; margin-top:-3px">
		<?php echo form_open('cmain/cetak_cluster');?>
	   	<?php
        $data = array(
			  'id'		 => 'kontes',
              'name'	 => 'kontes',
			  'value'    => $contest,
              'style'	 => 'visibility:hidden'
			);	
		echo form_input($data);
		 $data = array(
			  'id'		 => 'tugas',
			  'name'	 => 'tugas',
              'value'    => $problem,
       		  'style'	 => 'visibility:hidden'
            );
		echo form_input($data);
		?>
        <?php echo form_submit('run', 'Ekspor')?>
        <?php echo form_close()?> 
        </div>
    </div>
	<?php
	}
	else{
    ?>
    <div id="div_fbk" style="padding-left:25px; padding-top:0px; position:relative; visibility:hidden">
    </div>
    <?php }
	?>
    
    <div id="bk" style="min-width:97%; position:relative; margin-left:2%; margin-top:-20px">	    
    </div>
    
</div>



<?php if (!empty($file))
{
	$clust = 0;	
	$no_kode = 0;
	$no = 0;
	foreach($clusters as $docs) //$clustrs = array('cluster(array('username')')
	{    
		$cluster_baru[$clust] = $docs; 		
		$clust++;
		foreach($docs as $username) 
		{  	
			$user[$username] = $no_kode;
			foreach ($file as $id=>$kode)
			{
				if($id == $username)
				{
					
					
					
					$kode_program[$no] = $kode;	
					$nama[$no] = $username;
					$no++;
				}
			} 
		$no_kode++;
		}
	}
}
?>

<link rel="stylesheet" href="<?php echo base_url();?>css/overlay/css/iosOverlay.css">
<link rel="stylesheet" href="<?php echo base_url();?>css/overlay/css/prettify.css">
<script src="<?php echo base_url();?>css/collapsible/jquery-1.5.0.min.js"></script>
<script src="<?php echo base_url();?>css/overlay/js/jquery.min.js"></script>
<script src="<?php echo base_url();?>css/overlay/js/iosOverlay.js"></script> 
<script src="<?php echo base_url();?>css/overlay/js/prettify.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#expanderHead").click(function(){
		$("#expanderContent").slideToggle();
		if ($("#expanderSign").text() == "+"){
			$("#expanderSign").html("−")
		}
		else {
			$("#expanderSign").text("+")
		}
	});
});
</script>
<script>
p= new Array(); //array global data plagiat
n= new Array(); //array global data keterangan
sim= new Array();
var c;
var show_tk; //tampilan tengah kanan yang sedang aktif
var zi; //variabel global untuk mengoper cluster yang aktif
var desc_usr=0; 
var desc_ss=0;
var desc_st=0;
var desc_sc=0;
var desc_nl=0;
var desc_ex=0;
var desc_c=0;
var tkiri = 0; //tengah kanan
var tt = 0;
var c_tk = 0; //content tengah kanan
var v_fbk = 0; //daftar peserta ke kode program
var pes = 0; //peserta pada banding kode
var clus_bk = null; //cluster pada banging kode
var peserta1 = null;
var peserta2 = null;

function id_peserta(a)
{
	clusters = <?php echo json_encode($cluster_baru) ?>;	
	no_kode = <?php echo json_encode($user) ?>;
	score = <?php echo json_encode($nilai) ?>;
	plagiat = <?php echo json_encode($plagiat) ?>;
	supervisor = <?php echo json_encode($examiner) ?>;
	us  = <?php echo json_encode($user_system) ?>;
	sum_submit = <?php echo json_encode($sum_submit) ?>;
	submit_time= <?php echo json_encode($submitted_time) ?>;
	peserta = clusters[a]; //clusters mengandung semua isi id peserta dari tiap cluster	
	len = peserta.length;
	nomor = no_kode[peserta[len-1]];
	waktu = new Date(submit_time[peserta[len-1]]);
	c = a;
	zi = a; 
	if(p[peserta[len-1]]==1){
		nilai = 0;
		examiner = us;
	}
	else if(p[peserta[len-1]]==0){
		nilai = score[peserta[len-1]];
		examiner = us;
	}
	else{
		examiner = supervisor[peserta[len-1]];
		if(plagiat[peserta[len-1]]==1){
			nilai = 0;
		}
		else{
			nilai = score[peserta[len-1]];
		}
	}
	if(sim[peserta[len-1]] == 1){
		examiner = us;
	}
	
	cluster_peserta = "<tr id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td style='width:24%'>"+peserta[len-1]+"</td><td  style='width:10.6%'>"+sum_submit[peserta[len-1]]+"</td><td  style='width:24.3%'>"+waktu.toLocaleString()+"</td><td style='width:5.8%'><acronym title='centang jika peserta melakukan plagiat'><input id='"+peserta[len-1]+"' type='checkbox' value='"+peserta[len-1]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+peserta[len-1]+"' style='width:10%'>"+nilai+"</td><td id='np"+peserta[len-1]+"' style='width:24.3%'>"+examiner+"</td></tr>";
	
	for (i=peserta.length-2;i>-1;i--)
	{
		nomor = no_kode[peserta[i]];
		waktu = new Date(submit_time[peserta[i]]);
		if(p[peserta[i]]==1){
			nilai = 0;
			examiner = us;
		}
		else if(p[peserta[i]]==0){
			nilai = score[peserta[i]];
			examiner = us;
		}
		else{
			examiner = supervisor[peserta[i]];
			if(plagiat[peserta[i]]==1){
				nilai = 0;
			}
			else{
				nilai = score[peserta[i]];
			}
		}
		if(sim[peserta[i]] == 1){
			examiner = us;
		}
		cluster_peserta += "<tr  id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td>"+peserta[i]+"</td><td>"+sum_submit[peserta[i]]+"</td><td>"+waktu.toLocaleString()+"</td><td><acronym title='centang jika peserta melakukan plagiat'><input id='"+peserta[i]+"' type='checkbox' value='"+peserta[i]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+peserta[i]+"'>"+nilai+"</td><td id='np"+peserta[i]+"'>"+examiner+"</td></tr>";
	}
	if(10-peserta.length>0){
		for (f=0;f<10-peserta.length;f++)
		{
			cluster_peserta += "<tr style='height:32px'><td></td><td><font style='visibility:hidden'>_blank</font></td><td></td><td></td><td></td><td></td></tr>";
		}
	}
	for(i=1;i<4;i++){
		var x = document.getElementById('th'+i);
		x.style.background = '#333';
		x.style.color = '#fff';
	}
	var y = document.getElementById('peserta');
	y.innerHTML = cluster_peserta;
	plagiat_checklist(a,0);
	//keterangan(a,0);
}

function clusters_sorter(k)
{
	clusters = <?php echo json_encode($cluster_baru) ?>;
	clus = new Array();
	alread = new Array();
	
	clus = [clusters[0].length];

	for (i=1;i<clusters.length;i++)
	{
		clus.push(clusters[i].length);			
	}
	
	if(k==1){
	if(desc_c%2 == 1){
		for(i=0;i<clusters.length;i++){
			if(i==0){
			x = i+1;
			tabel = "<tr><td id='c"+x+"' onclick='warna_cluster("+x+");id_peserta("+i+")' style='width:70.8%; text-align:center; cursor:pointer; font: bold 13.5px/32px Arial, sans-serif;'>Cluster "+x+"</td><td id='cc"+x+"' onclick='warna_cluster("+x+");id_peserta("+i+")' style='text-align:center; width:29.2%; cursor:pointer; font: bold 15px/32px Arial, sans-serif;'>"+clusters[i].length+"</td></tr>";
			}
			else{
			x = i+1;	
			tabel += "<tr><td id='c"+x+"' onclick='warna_cluster("+x+");id_peserta("+i+")' style='width:70.8%; text-align:center; cursor:pointer; font: bold 13.5px/32px Arial, sans-serif;'>Cluster "+x+"</td><td id='cc"+x+"' onclick='warna_cluster("+x+");id_peserta("+i+")' style='text-align:center; width:29.2%; cursor:pointer; font: bold 15px/32px Arial, sans-serif;'>"+clusters[i].length+"</td></tr>";
			}
		}
	}
	
	else{
		for(i=clusters.length;i>0;i--){
			if(i==clusters.length){
			x = i-1;
			tabel = "<tr><td id='c"+i+"' onclick='warna_cluster("+i+");id_peserta("+x+")' style='width:70.8%; text-align:center; cursor:pointer; font: bold 13.5px/32px Arial, sans-serif;'>Cluster "+i+"</td><td id='cc"+i+"' onclick='warna_cluster("+i+");id_peserta("+x+")' style='text-align:center; width:29.2%; cursor:pointer; font: bold 15px/32px Arial, sans-serif;'>"+clusters[x].length+"</td></tr>";
			}
			else{
			x = i-1;	
			tabel += "<tr><td id='c"+i+"' onclick='warna_cluster("+i+");id_peserta("+x+")' style='width:70.8%; text-align:center; cursor:pointer; font: bold 13.5px/32px Arial, sans-serif;'>Cluster "+i+"</td><td id='cc"+i+"' onclick='warna_cluster("+i+");id_peserta("+x+")' style='text-align:center; width:29.2%; cursor:pointer; font: bold 15px/32px Arial, sans-serif;'>"+clusters[x].length+"</td></tr>";
			}
		}
	}
	desc_c +=1;
	tkiri = 1;
	var headclusters = document.getElementById('headcluster');
	headcluster.style.background = '#555';
	var headsc = document.getElementById('headsc');
	headsc.style.background = '#333';
	}
	else if(k == 2)
	{
	if(desc_sc%2 == 0){
		clus.sort(function(a, b){return a-b});
	}
	else{
		clus.sort(function(a, b){return b-a});
	}
	for(i=0;i<clusters.length;i++){
 			for(j=0;j<clusters.length;j++){
				if(clus[i] == clusters[j].length && alread[j] != 1){
				if(i==0){	
				x = j+1;	
				tabel = "<tr><td id='c"+x+"' onclick='warna_cluster("+x+");id_peserta("+j+")' style='width:70.8%; text-align:center; cursor:pointer; font: bold 13.5px/32px Arial, sans-serif;'>Cluster "+x+"</td><td id='cc"+x+"' onclick='warna_cluster("+x+");id_peserta("+j+")' style='text-align:center; width:29.2%; cursor:pointer; font: bold 15px/32px Arial, sans-serif;'>"+clus[i]+"</td></tr>";
				}
				else{
				x = j+1;
				tabel += "<tr><td id='c"+x+"' onclick='warna_cluster("+x+");id_peserta("+j+")' style='width:70.8%; text-align:center; cursor:pointer; font: bold 13.5px/32px Arial, sans-serif;'>Cluster "+x+"</td><td id='cc"+x+"' onclick='warna_cluster("+x+");id_peserta("+j+")' style='text-align:center; width:29.2%; cursor:pointer; font: bold 15px/32px Arial, sans-serif;'>"+clus[i]+"</td></tr>";
				}
				alread[j]=1;
				break;
			 	} 	
			}
	}
	desc_sc += 1;
	tkiri=2;
	var headsc = document.getElementById('headsc');
	headsc.style.background = '#555';
	var headclusters = document.getElementById('headcluster');
	headcluster.style.background = '#333';
	}
	
	if(10-clusters.length>0){
		for (f=0;f<10-clusters.length;f++){
			tabel += "<tr><td style='font: bold 15px/32px Arial, sans-serif;'><font style='visibility:hidden'>_blank</font></td><td></td></tr>";
		}
	}
	
	var y = document.getElementById('table2');
	y.innerHTML = tabel;
}

function sorter(s){ //fungsi sort asc desc table
	clusters = <?php echo json_encode($cluster_baru) ?>;	
	no_kode = <?php echo json_encode($user) ?>;
	sum_submit = <?php echo json_encode($sum_submit) ?>;
	submit_time= <?php echo json_encode($submitted_time) ?>;
	score = <?php echo json_encode($nilai) ?>;
	plagiat = <?php echo json_encode($plagiat) ?>;
	supervisor = <?php echo json_encode($examiner) ?>;
	us  = <?php echo json_encode($user_system) ?>;
	peserta = clusters[c]; //clusters mengandung semua isi id peserta dari tiap cluster	
	usr = new Array();
	ss = new Array();
	st = new Array();
	ex = new Array();
	exm = new Array();
	nl = new Array();
	nli = new Array();
	already = new Array();
	if(s == 0){ //sort by id_peserta
		usr = [peserta[0]];
		for (i=1;i<peserta.length;i++)
		{
			usr.push(peserta[i]);		
		}
		usr.sort();
		if(desc_usr%2 == 1){
		usr.reverse();
		}
		nomor = no_kode[usr[0]];
		waktu = new Date(submit_time[usr[0]]);

		if(p[usr[0]]==1){
			nilai = 0;
			examiner = us;
		}
		else if(p[usr[0]]==0){
			nilai = score[usr[0]];
			examiner = us;
		}
		else{
			examiner = supervisor[usr[0]];
			if(plagiat[usr[0]]==1){
				nilai = 0;
			}
			else{
				nilai = score[usr[0]];
			}
		}
		if(sim[usr[0]] == 1){
			examiner = us;
		}
		
		cluster_peserta = "<tr id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td style='width:24%'>"+usr[0]+"</td><td  style='width:10.6%'>"+sum_submit[usr[0]]+"</td><td  style='width:24.3%'>"+waktu.toLocaleString()+"</td><td style='width:5.8%'><acronym title='centang jika peserta melakukan plagiat'><input id='"+usr[0]+"' type='checkbox' value='"+usr[0]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+usr[0]+"' style='width:10%'>"+nilai+"</td><td id='np"+usr[0]+"' style='width:24.3%'>"+examiner+"</td></tr>"
	 	for (i=1;i<peserta.length;i++)
		{
			if(p[usr[i]]==1){
			nilai = 0;
			examiner = us;
			}
			else if(p[usr[i]]==0){
				nilai = score[usr[i]];
				examiner = us;
			}
			else{
				examiner = supervisor[usr[i]];
				if(plagiat[usr[i]]==1){
					nilai = 0;
				}
				else{
					nilai = score[usr[i]];
				}
			}
			if(sim[usr[i]] == 1){
				examiner = us;
			}
		
			nomor = no_kode[usr[i]];
			waktu = new Date(submit_time[usr[i]]);
			cluster_peserta += "<tr  id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td>"+usr[i]+"</td><td>"+sum_submit[usr[i]]+"</td><td>"+waktu.toLocaleString()+"</td><td><acronym title='centang jika peserta melakukan plagiat'><input id='"+usr[i]+"' type='checkbox' value='"+usr[i]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+usr[i]+"'>"+nilai+"</td><td id='np"+usr[i]+"'>"+examiner+"</td></tr>"
		}
		desc_usr += 1;	
		tt = 1;
	}
	else if(s == 1){ //sort by jumlah submit
		ss = [sum_submit[peserta[0]]];
		for (i=1;i<peserta.length;i++)
		{
			ss.push(sum_submit[peserta[i]]);			
		}
		if(desc_ss%2 == 0){
			ss.sort(function(a, b){return a-b});
		}
		else{
			ss.sort(function(a, b){return b-a});
		}
		for(i=0;i<ss.length;i++){
 			for(j=0;j<peserta.length;j++){
				if(ss[i] == sum_submit[peserta[j]] && already[peserta[j]]!=1){
					
					if(p[peserta[j]]==1){
						nilai = 0;
						examiner = us;
					}
					else if(p[peserta[j]]==0){
						nilai = score[peserta[j]];
						examiner = us;
					}
					else{
						examiner = supervisor[peserta[j]];
						if(plagiat[peserta[j]]==1){
							nilai = 0;
						}
						else{
							nilai = score[peserta[j]];
						}
					}
					if(sim[peserta[j]] == 1){
						examiner = us;
					}
					
					if(i==0){
						nomor = no_kode[peserta[j]]
						waktu = new Date(submit_time[peserta[j]]);
						cluster_peserta = "<tr id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td style='width:24%'>"+peserta[j]+"</td><td  style='width:10.6%'>"+sum_submit[peserta[j]]+"</td><td  style='width:24.3%'>"+waktu.toLocaleString()+"</td><td style='width:5.8%'><acronym title='centang jika peserta melakukan plagiat'><input id='"+peserta[j]+"' type='checkbox' value='"+peserta[j]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+peserta[j]+"' style='width:10%'>"+nilai+"</td><td id='np"+peserta[j]+"' style='width:24.3%'>"+examiner+"</td></tr>";		
					}
					else{
						nomor = no_kode[peserta[j]]
						waktu = new Date(submit_time[peserta[j]]);
						cluster_peserta += "<tr  id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td>"+peserta[j]+"</td><td>"+sum_submit[peserta[j]]+"</td><td>"+waktu.toLocaleString()+"</td><td><acronym title='centang jika peserta melakukan plagiat'><input id='"+peserta[j]+"' type='checkbox' value='"+peserta[j]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+peserta[j]+"'>"+nilai+"</td><td id='np"+peserta[j]+"'>"+examiner+"</td></tr>";
					}
					already[peserta[j]]=1;
					break;
				}
			}
		}
		desc_ss += 1;
		tt=2;
	}
	else if(s == 2){ //sort by waktu submit
		st= [submit_time[peserta[0]]];
		for (i=1;i<peserta.length;i++)
		{
			st.push(submit_time[peserta[i]]);			
		}
		st.sort();
		if(desc_st%2 == 1){
			st.reverse();
		}
		for(i=0;i<st.length;i++){
 			for(j=0;j<peserta.length;j++){
				if(st[i] == submit_time[peserta[j]] && already[peserta[j]]!=1){
					
					if(p[peserta[j]]==1){
						nilai = 0;
						examiner = us;
					}
					else if(p[peserta[j]]==0){
						nilai = score[peserta[j]];
						examiner = us;
					}
					else{
						examiner = supervisor[peserta[j]];
						if(plagiat[peserta[j]]==1){
							nilai = 0;
						}
						else{
							nilai = score[peserta[j]];
						}
					}
					if(sim[peserta[j]] == 1){
						examiner = us;
					}
					
					if(i==0){
						nomor = no_kode[peserta[j]];
						waktu = new Date(submit_time[peserta[j]]);
						cluster_peserta = "<tr id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td style='width:24%'>"+peserta[j]+"</td><td  style='width:10.6%'>"+sum_submit[peserta[j]]+"</td><td  style='width:24.3%'>"+waktu.toLocaleString()+"</td><td style='width:5.8%'><acronym title='centang jika peserta melakukan plagiat'><input id='"+peserta[j]+"' type='checkbox' value='"+peserta[j]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+peserta[j]+"' style='width:10%'>"+nilai+"</td><td id='np"+peserta[j]+"' style='width:24.3%'>"+examiner+"</td></tr>";	
					}
					else{
						nomor = no_kode[peserta[j]];
						waktu = new Date(submit_time[peserta[j]]);
						cluster_peserta += "<tr  id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td>"+peserta[j]+"</td><td>"+sum_submit[peserta[j]]+"</td><td>"+waktu.toLocaleString()+"</td><td><acronym title='centang jika peserta melakukan plagiat'><input id='"+peserta[j]+"' type='checkbox' value='"+peserta[j]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+peserta[j]+"'>"+nilai+"</td><td id='np"+peserta[j]+"'>"+examiner+"</td></tr>";	
					}
					already[peserta[j]]=1;
					break;
				}
			}
		}
		desc_st+= 1;
		tt=3;
	}
	
	else if(s == 3){ //sort by waktu submit
		for (i=0;i<peserta.length;i++)
		{
			if(p[peserta[i]]==1){
			nl[peserta[i]] = 0;
			}
			else if(p[peserta[i]]==0){
				nl[peserta[i]] = score[peserta[i]];
			}
			else{
				if(plagiat[peserta[i]]==1){
					nl[peserta[i]] = 0;
				}
				else{
					nl[peserta[i]] = score[peserta[i]];
				}
			}
		}
		nli.push(nl[peserta[0]]);
		for (i=1;i<peserta.length;i++)
		{
			nli.push(nl[peserta[i]]);			
		}
		if(desc_nl%2 == 0){
			nli.sort(function(a, b){return a-b});
		}
		else{
			nli.sort(function(a, b){return b-a});
		}
		for(i=0;i<nli.length;i++){
 			for(j=0;j<peserta.length;j++){
				if(p[peserta[j]]==1){
					nilai = 0;
					examiner = us;
				}
				else if(p[peserta[j]]==0){
					nilai = score[peserta[j]];
					examiner = us;
				}
				else{
					examiner = supervisor[peserta[j]];
					if(plagiat[peserta[j]]==1){
						nilai = 0;
					}
					else{
						nilai = score[peserta[j]];
					}
				}
				if(sim[peserta[j]] == 1){
					examiner = us;
				}
				if(nli[i] == nilai && already[peserta[j]]!=1){
					if(i==0){
						nomor = no_kode[peserta[j]];
						waktu = new Date(submit_time[peserta[j]]);
						cluster_peserta = "<tr id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td style='width:24%'>"+peserta[j]+"</td><td  style='width:10.6%'>"+sum_submit[peserta[j]]+"</td><td  style='width:24.3%'>"+waktu.toLocaleString()+"</td><td style='width:5.8%'><acronym title='centang jika peserta melakukan plagiat'><input id='"+peserta[j]+"' type='checkbox' value='"+peserta[j]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+peserta[j]+"' style='width:10%'>"+nilai+"</td><td id='np"+peserta[j]+"' style='width:24.3%'>"+examiner+"</td></tr>";	
					}
					else{
						nomor = no_kode[peserta[j]];
						waktu = new Date(submit_time[peserta[j]]);
						cluster_peserta += "<tr  id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td>"+peserta[j]+"</td><td>"+sum_submit[peserta[j]]+"</td><td>"+waktu.toLocaleString()+"</td><td><acronym title='centang jika peserta melakukan plagiat'><input id='"+peserta[j]+"' type='checkbox' value='"+peserta[j]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+peserta[j]+"'>"+nilai+"</td><td id='np"+peserta[j]+"'>"+examiner+"</td></tr>";	
					}
					already[peserta[j]]=1;
					break;
				}
			}
		}
		desc_nl+= 1;
		tt=4;
	}
	
	else if(s == 4){ //sort by waktu submit
		for (i=0;i<peserta.length;i++)
		{
			if(p[peserta[i]]==1){
				ex[peserta[i]] = us;
			}
			else if(p[peserta[i]]==0){
				ex[peserta[i]] = us;
			}
			else{
				ex[peserta[i]] = supervisor[peserta[i]];
			}
			if(sim[peserta[i]] == 1){
				ex[peserta[i]] = us;
			}
		}
		exm.push(ex[peserta[0]]);
		for (i=1;i<peserta.length;i++)
		{
			exm.push(ex[peserta[i]]);			
		}
		exm.sort();
		if(desc_ex%2 == 1){
			exm.reverse();
		}
		for(i=0;i<exm.length;i++){
 			for(j=0;j<peserta.length;j++){
				if(p[peserta[j]]==1){
					nilai = 0;
					examiner = us;
				}
				else if(p[peserta[j]]==0){
					nilai = score[peserta[j]];
					examiner = us;
				}
				else{
					examiner = supervisor[peserta[j]];
					if(plagiat[peserta[j]]==1){
						nilai = 0;
					}
					else{
						nilai = score[peserta[j]];
					}
				}
				if(sim[peserta[j]] == 1){
					examiner = us;
				}
				if(exm[i] == examiner && already[peserta[j]]!=1){
					if(i==0){
						nomor = no_kode[peserta[j]];
						waktu = new Date(submit_time[peserta[j]]);
						cluster_peserta = "<tr id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td style='width:24%'>"+peserta[j]+"</td><td  style='width:10.6%'>"+sum_submit[peserta[j]]+"</td><td  style='width:24.3%'>"+waktu.toLocaleString()+"</td><td style='width:5.8%'><acronym title='centang jika peserta melakukan plagiat'><input id='"+peserta[j]+"' type='checkbox' value='"+peserta[j]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+peserta[j]+"' style='width:10%'>"+nilai+"</td><td id='np"+peserta[j]+"' style='width:24.3%'>"+examiner+"</td></tr>";	
					}
					else{
						nomor = no_kode[peserta[j]];
						waktu = new Date(submit_time[peserta[j]]);
						cluster_peserta += "<tr  id="+nomor+" onclick='banding_kode("+nomor+","+c+");kode_program("+nomor+");warna("+nomor+","+c+");show_dp("+nomor+")' style='cursor:pointer;height:32px'><td>"+peserta[j]+"</td><td>"+sum_submit[peserta[j]]+"</td><td>"+waktu.toLocaleString()+"</td><td><acronym title='centang jika peserta melakukan plagiat'><input id='"+peserta[j]+"' type='checkbox' value='"+peserta[j]+"' onclick='update_plagiat("+nomor+");plagiat_checklist("+nomor+",1)' /></acronym></td><td id='skor"+peserta[j]+"'>"+nilai+"</td><td id='np"+peserta[j]+"'>"+examiner+"</td></tr>";	
					}
					already[peserta[j]]=1;
					break;
				}
			}
		}
		desc_ex+= 1;
		tt=5;
	}
	
	if(10-peserta.length>0){
		for (f=0;f<10-peserta.length;f++)
		{
			cluster_peserta += "<tr style='height:32px'><td></td><td><font style='visibility:hidden'>_blank</font></td><td></td><td></td><td></td><td></td></tr>";
		}
	}
	var y = document.getElementById('peserta');
	y.innerHTML = cluster_peserta;
	plagiat_checklist(zi,0);
}

function plagiat_checklist(a,b){ //fungsi checklist checkbox plagiat
	clusters = <?php echo json_encode($cluster_baru) ?>;	
	plagiat = <?php echo json_encode($plagiat) ?>;
	nama  = <?php echo json_encode($nama) ?>;
	username = nama[a];
	peserta = clusters[a]; //clusters mengandung semua isi id peserta dari tiap cluster	
	if(b==0){
		for (i=0;i<peserta.length;i++){	
			if(p[peserta[i]]==1){
				var x = document.getElementById(peserta[i]);
				x.checked = true;
			}
			else if(p[peserta[i]]==0){
				var x = document.getElementById(peserta[i]);
				x.checked = false;
			}
			else{
				if(plagiat[peserta[i]]==1){
					var x = document.getElementById(peserta[i]);
					x.checked = true;
				}
				else{
					var x = document.getElementById(peserta[i]);
					x.checked = false;
				}
			}
		}
	}
	else if(b==1){
		if(document.getElementById(username).checked){ 
			p[username] = 1;
		}
		else{
			p[username] = 0;
		}
	}
}

function warna(a,b){ //fungsi warna baris username yang sedang aktif;
	clusters = <?php echo json_encode($cluster_baru) ?>;	
	no_kode = <?php echo json_encode($user) ?>;
	peserta = clusters[b]; //clusters mengandung semua isi id peserta dari tiap cluster	
	if(v_fbk == 0){
		for (i=0;i<peserta.length;i++)
		{
			var x = document.getElementById(no_kode[peserta[i]]);
			x.style.background = '#fff';
		}
		var x = document.getElementById(a);
		x.style.background = '#90bfcd';
	}
	
	else{
		for (i=0;i<peserta.length;i++)
		{
			var x = document.getElementById(no_kode[peserta[i]]);
			x.style.background = '#fff';
		}
		if(peserta1 != peserta2){
			if(clus_bk != null || peserta1!=null){
				if(clus_bk == b || pes%2 == 1){
					var x = document.getElementById(no_kode[peserta1]);
					x.style.background = '#90bfcd';
				}
			}
			if(peserta2!=null){ 
				if(clus_bk != null){
					if(clus_bk == b || pes%2 == 0){
						var y = document.getElementById(no_kode[peserta2]);
						y.style.background = '#F93';
					}
				}
			}
		}
		else{
			var x = document.getElementById(no_kode[peserta1]);
			x.style.background = '#90bfcd';
			var x = document.getElementById(no_kode[peserta2]);
			x.style.background = '#90bfcd';
		}
	}
	clus_bk = b;
}

function sorter_thead(a){ //fungsi warna baris yang sedang aktif;
	for(i=1;i<6;i++){
		var x = document.getElementById('th'+i);
		x.style.background = '#333';
		x.style.color = '#fff';
	}
	var x = document.getElementById('th'+a);
	x.style.background = '#555';
	x.style.color = '#fff';
}

function reset_warna(a){ //fungsi warna cluster yang sedang aktif
	if(a==1)
	{
		var x = document.getElementById('headcluster');
		x.style.background = '#333';
		var y = document.getElementById('headsc');
		y.style.background = '#333';
		tkiri = 0;
	}
	else{
		var x = document.getElementById('th1');
		x.style.background = '#333';
		var y = document.getElementById('th2');
		y.style.background = '#333';
		var z = document.getElementById('th3');
		z.style.background = '#333';
		tt = 0;
	}
}

function warna_cluster(a){ //fungsi warna cluster yang sedang aktif
	clusters = <?php echo json_encode($cluster_baru) ?>;	
	for (i=1;i<=clusters.length;i++)
	{
		var x = document.getElementById('c'+i);
		x.style.background = '#eee';
		var y = document.getElementById('cc'+i);
		y.style.background = '#eee';
	}
	var x = document.getElementById('c'+a);
	x.style.background = '#09c';
	var y = document.getElementById('cc'+a);
	y.style.background = '#09c';
}

function warnaover(a){ //fungsi warna cluster yang sedang aktif
	if(a == 1){ b = 'headcluster';}
	else if(a == 2){ b = 'headsc';}
	var y = document.getElementById(b);
	y.style.background = '#09c';
}

function tkiri_over(a){ //fungsi warna cluster yang sedang aktif
	if(a == 1){ b = 'headcluster';}
	else if(a == 2){ b = 'headsc';}
	var headsc = document.getElementById(b);
	headsc.style.background = '#555';

}

function tkiri_out(a){ //fungsi warna cluster yang sedang aktif
	if(a == 1 && tkiri != 1){ b = 'headcluster';}
	else if(a == 2 && tkiri != 2){ b = 'headsc';}
	else { b = null;}
	if(b!=null){
		var headsc = document.getElementById(b);
		headsc.style.background = '#333';
	}
}

function tt_over(a){ //fungsi warna cluster yang sedang aktif
	if(a == 1){ b = 'th1';}
	else if(a == 2){ b = 'th2';}
	else if(a == 3){ b = 'th3';}
	else if(a == 4){ b = 'th4';}
	else if(a == 5){ b = 'th5';}
	var y = document.getElementById(b);
	y.style.background = '#555';

}

function tt_out(a){ //fungsi warna cluster yang sedang aktif
	if(a == 1 && tt != 1){ b = 'th1';}
	else if(a == 2 && tt != 2){ b = 'th2';}
	else if(a == 3 && tt != 3){ b = 'th3';}
	else if(a == 4 && tt != 4){ b = 'th4';}
	else if(a == 5 && tt != 5){ b = 'th5';}
	else { b = null;}
	if(b!=null){
		var y = document.getElementById(b);
		y.style.background = '#333';
	}
}

function show_dp(a){	
	plagiat = <?php echo json_encode($plagiat) ?>;
	score  = <?php echo json_encode($nilai) ?>;
	us  = <?php echo json_encode($user_system) ?>;
	supervisor = <?php echo json_encode($examiner) ?>;
	username = nama[a];
	if(p[username]==1){
		nilai = 0;
		examiner = us;
	}
	else if(p[username]==0){
		nilai = score[username];
		examiner = us;
	}
	else{
		if(plagiat[username]==1){
			nilai = 0;
			examiner = supervisor[username];
		}
		else{
			nilai = score[username];
			examiner = supervisor[username];
		}
	}
	if(sim[username] == 1){
		examiner = us;
	}
	var y = document.getElementById('np'+username);
	y.innerHTML = examiner;
	var x = document.getElementById('skor'+username);
	x.innerHTML = nilai;
}

function kode_program(a) //button
{
	code = <?php echo json_encode($kode_program) ?>;
	gc = <?php echo json_encode($grade_content) ?>;	
	nama  = <?php echo json_encode($nama) ?>;
	note = <?php echo json_encode($note) ?>;
	username = nama[a];
	if(sim[username] != 1){
		ket = note[username];	
	}
	else{
		ket = n[username];
	}
	keterangan = "<input id='n"+username+"' type='text' style='width:370px; padding-left:5px; padding-right:5px; margin-top:20px; margin-left:20px; margin-right:10px' value='"+ket+"' /><button onClick='update_keterangan("+a+")'>simpan</button>";
	program = "<div style:'margin-top:-5px'>"+username+"</div><img src='\<?php echo base_url() ?>images/Notepad.png' height='20' width='20' alt='' onClick='show_kodeprogram("+a+")' style='margin-top:-18px; margin-left:80px; cursor:pointer'><pre><code style='font-size:14px'> "+code[a]+"</code></pre>";
	grade_content = gc[username];
	var x = document.getElementById('kode_program');
	var y = document.getElementById('expanderContent');
	var z = document.getElementById('keterangan');
	x.innerHTML = program;
	y.innerHTML = grade_content;
	z.innerHTML = keterangan;
}

function show_kodeprogram(a) //fungsi menampilkan kode program
{
	code = <?php echo json_encode($kode_program) ?>;	
	gc = <?php echo json_encode($grade_content) ?>;	
	nama  = <?php echo json_encode($nama) ?>;
	username = nama[a];
	program = "//"+username+"<pre><code style='font-size:14px'> "+code[a]+"</code></pre>";
    var myWindow = window.open("", "", "width=600, height=600");
    myWindow.document.write(program);
}

function show_banding_kode(){
	if(document.getElementById('fbk').checked){
	content_bk = "<div id='banding_kode'><div id='bankod1' ><div style='color:#000;background-color:#90bfcd; color:#FFF; height:33px; border-radius:10px; text-align:center; padding-top:5px; font: bold 13px/32px Arial, sans-serif; '><label id='bk_c1' style='font: bold 13px/32px Arial, sans-serif; color:#000'>cluster</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id='bk_ip1' style='font: bold 17px/32px Arial, sans-serif; color:#333'>ID Peserta</label></div><div style='color:#000;background-color:#333; height:5px'></div><div style='background:#fafafa; height:540px; padding-top:5px; '><div class='scroll-pane3' style='background-color:#eee; min-height:525px; width:97%; margin:0px auto 0px auto; margin-top:5px;'><div id='bk_kp1' style='padding-top:15px; padding-left:10px; width:98%; margin:0px auto 0px auto;'></div></div></div></div><div id='bankod2'><div style='color:#000;background-color:#F93; color:#FFF; height:33px; border-radius:10px; text-align:center; padding-top:5px; font: bold 13px/32px Arial, sans-serif; '><label id='bk_ip2' style='font: bold 17px/32px Arial, sans-serif;color:#333'>ID Peserta</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id='bk_c2' style='font: bold 13px/32px Arial, sans-serif;color:#000'>cluster</label></div><div style='color:#000;background-color:#333; height:5px'></div><div style='background:#fafafa; height:540px; padding-top:5px;'><div class='scroll-pane3' style='background-color:#eee; min-height:525px; width:97%; margin:0px auto 0px auto; margin-top:5px;'><div id='bk_kp2' style='padding-top:15px; width:98%; margin:0px auto 0px auto; padding-left:10px;'></div></div></div></div></div>";
	v_fbk = 1;
	}
	else {
	content_bk = ' ';
	v_fbk = 0;
	b=0;
	peserta1 = '';
	peserta2 = '';
	}
	var x = document.getElementById('bk');
	x.innerHTML = content_bk;
	
}

function banding_kode(a,b){
	if(v_fbk == 1){
	code = <?php echo json_encode($kode_program) ?>;	
	nama  = <?php echo json_encode($nama) ?>;
	username = nama[a];
	if(peserta1 == username ){
		b = b+1;
		peserta1 = username;
		peserta2 = username;
		kode = "<pre><code style='font-size:14px'> "+code[a]+"</code></pre>";
		var x = document.getElementById('bk_kp2');
		x.innerHTML = kode;		
		var y = document.getElementById('bk_ip2');
		y.innerHTML = username;	
		var z = document.getElementById('bk_c2');
		z.innerHTML = 'cluster '+b;	
		pes=1;
	}
	else if(peserta2 == username){
		b = b+1;
		peserta1 = username;
		peserta2 = username;
		kode = "<pre><code style='font-size:14px'> "+code[a]+"</code></pre>";
		var x = document.getElementById('bk_kp1');
		x.innerHTML = kode;		
		var y = document.getElementById('bk_ip1');
		y.innerHTML = username;	
		var z = document.getElementById('bk_c1');
		z.innerHTML = 'cluster '+b;	
		pes=1
	}
	else{
		if(pes%2 == 0){
			b = b+1;
			peserta1 = username;
			kode = "<pre><code style='font-size:14px'> "+code[a]+"</code></pre>";
			var x = document.getElementById('bk_kp1');
			x.innerHTML = kode;	
			var y = document.getElementById('bk_ip1');
			y.innerHTML = peserta1;
			var z = document.getElementById('bk_c1');
			z.innerHTML = 'cluster '+b;
			pes=1;
		}
		else{
			b = b+1;
			peserta2 = username;
			kode = "<pre><code style='font-size:14px'> "+code[a]+"</code></pre>";
			var x = document.getElementById('bk_kp2');
			x.innerHTML = kode;		
			var y = document.getElementById('bk_ip2');
			y.innerHTML = peserta2;	
			var z = document.getElementById('bk_c2');
			z.innerHTML = 'cluster '+b;
			pes=2;
		}
	}
	
	}
}

function check_all(){
	if(zi != null){
		clusters = <?php echo json_encode($cluster_baru) ?>;	
		no_kode = <?php echo json_encode($user) ?>;
		peserta = clusters[zi]; 
			var r = confirm("Apakah anda yakin melakukan ini?");
			if (r == true) {
				if(document.getElementById('checklist_all').checked){ 
					for(i=0; i<peserta.length; i++){
						nomor = no_kode[peserta[i]];
						var x = document.getElementById(peserta[i]);
						x.checked = true;
						update_plagiat(nomor);
						p[peserta[i]] = 1;
					}
				}
				else{
					for(i=0; i<peserta.length ; i++){
						nomor = no_kode[peserta[i]];
						var x = document.getElementById(peserta[i]);
						x.checked = false;
						update_plagiat(nomor);					
						p[peserta[i]]=0;
					}
				}
			}
	}
}

function update_plagiat(a){ //fungsi menyimpan pembaharuan plagiat
	nama  = <?php echo json_encode($nama) ?>;
	contest  = <?php echo json_encode($contest) ?>;
	problem  = <?php echo json_encode($problem) ?>;
	us  = <?php echo json_encode($user_system) ?>;
	username = nama[a];	
		if(document.getElementById(username).checked){ 
			plagiat = 1;
		}
		else{
			plagiat = 0;
	}
	$.ajax({
	   type : "POST",
	   url  : "<?php echo base_url(); ?>index.php/cmain/update_plagiat",
	   data : {username : username, plagiat : plagiat, contest:contest, problem:problem, us:us},
	   success: function(data){
			}			   
	})	
}
	
function update_keterangan(a){ //fungsi menyimpan pembaharuan plagiat
	nama  = <?php echo json_encode($nama) ?>;
	contest  = <?php echo json_encode($contest) ?>;
	problem  = <?php echo json_encode($problem) ?>;
	us  = <?php echo json_encode($user_system) ?>;
	username = nama[a];	
	sim[username] = 1;
	note = document.getElementById('n'+username).value;
	n[username] = note;
	$.ajax({
   	type : "POST",
   	url  : "<?php echo base_url(); ?>index.php/cmain/update_note",
   	data : {username : username, note : note, contest:contest, problem:problem, us : us},
   	success: function(data){
					iosOverlay({
					text: "Berhasil",
					duration: 413,
					icon: "<?php echo base_url();?>css/overlay/img/check.png"
					});
				}		   
	   })
	x = document.getElementById('n'+username);
	x.style.background = '#FC6';
}

function table3_sort(){
	$("#table3").tablesorter({ 
        // pass the headers argument and assing a object 
        headers: {            
        } 
    }); 
}
</script>
<script type="text/javascript" src="<?php echo base_url();?>css/table/jquery.tablesorter.min.js"></script>
<script>
$(document).ready(function() { 
    $("#table3").tablesorter({ 
        // pass the headers argument and assing a object 
        headers: {            
        } 
    }); 
});
</script>

