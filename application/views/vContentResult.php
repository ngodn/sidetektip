<div id="main_tengah2_result" style="overflow:scroll; max-height:480px">

	<div id="main_tengah_content_result" > 
        <?php
        $c=1;
        $no=0;
        if(!empty($username)){
			?>
            <div style="float:left; margin-left:-13%">
			<?php echo form_open('cmain/cetak_laporankontes');?>
			<?php
            $data = array(
                  'id'		 => 'kontes',
                  'name'	 => 'kontes',
                  'value'    => $contest,
                  'style'	 => 'visibility:hidden'
                );	
            echo form_input($data);
            ?>
            <?php echo form_submit('run', 'Ekspor')?>
            <?php echo form_close()?>
            </div>
            <button disabled="disabled" style="min-width:99%">
			<table class="tablesorter"> 
            <thead> 
            <tr>
                <th style="width:4%; text-align:center">No</th> 
                <th style="width:15%; text-align:center">ID Peserta</th>        
                <th style=" text-align:center; font-size:14px; width:6%;"> Jumlah Plagiat</th>
                <?php
				foreach($options_problem as $problems_name){
				?>
					<th style=" text-align:center; font-size:14px"><?php echo $problems_name?></th>
				<?php
                }
				?>
            </tr>
            </thead> 
            <tbody> 
            <?php
            if($username!=1){
                foreach($username as $us){
        		?>
                <tr> 
                    <td style="text-align:center"><?php echo $c; $c++; ?></td>
                    <td style="text-align:center"><?php echo $us ?></td> 
                   	<?php if(isset($sumplagiat[$us])){?>
                    <td style="text-align:center"><?php echo $sumplagiat[$us] ?></td>
                    <?php
					}
					else{
					?>
                    <td style="text-align:center"> - </td>
                    <?php
					}
						foreach($options_problem as $id => $title){
							if(isset($problem[$id])){	
								if(isset($plagiat[$id][$us])){	
								?>
                                <td style="text-align:center"><?php echo $plagiat[$id][$us]; ?></td>
                                <?php	
								}
								else{
								?>
                                <td style="text-align:center"> - </td>
                                <?php
								}
							}
							else{
								?>
                                <td style="text-align:center">  </td>
                                <?php
							}
						}
                    
					?>   
                </tr>
        		<?php
                    $no++;
                }
            }
            else{
        ?>
            <h2 style="text-align:center">Kontes ini belum memiliki data hasil. Lakukan proses cluster terlebih dahulu.</h2>
        <?php
            }
        ?>
        </tbody>
        <?php
        }
		?>
        </table>
    </div>
</div>




<link rel="stylesheet" href="<?php echo base_url();?>css/overlay/css/iosOverlay.css">
<link rel="stylesheet" href="<?php echo base_url();?>css/overlay/css/prettify.css">
<script src="<?php echo base_url();?>css/overlay/js/jquery.min.js"></script>
<script src="<?php echo base_url();?>css/overlay/js/iosOverlay.js"></script> 
<script src="<?php echo base_url();?>css/overlay/js/prettify.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>css/table/jquery.tablesorter.min.js"></script>
<script>
$(document).ready(function() { 
    $("table").tablesorter({ 
        // pass the headers argument and assing a object 
        headers: { 
            // assign the secound column (we start counting zero) 
            0: { 
                // disable it by setting the property sorter to false 
                sorter: false 
            }, 
        } 
    }); 
});
</script>