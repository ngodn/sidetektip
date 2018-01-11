<?php echo form_open('cmain/cluster');?>
<?php
	$select['bisecting_kmeans'] = 'i';
	$select['kmeans'] = 'k';
	$select['single_linkage'] = 'i';
	$select['average_linkage'] = 'i';
	$select['complete_linkage'] = 'i';
	//tambah metode baru disini
	
	$options=array( 
		//tambah nama metode baru disini
		'average_linkage' => 'Average Linkage',
		'bisecting_kmeans' => 'Bisecting K-means',
		'complete_linkage' => 'Complete Linkage',
		'kmeans' => 'K-Means',
		'single_linkage' => 'Single Linkage',
	);
?>
<div style="min-width:150px; position:relative; margin-right:10px; float:left">
<?php
$data = array(
		'style'		=>	'max-height:59px; min-height:59px'
	);
echo form_fieldset('',$data);
?> 
<table>
    <tr>
 	    <th>
        <td style="text-align: left; font-family:sans-serif; font-size:14px; padding-bottom:5px">Kontes</td>
        <td style="text-align: left; font-family:sans-serif; font-size:14px; padding-bottom:5px">
        <?php $kontes = 'id="kontes" name="kontes"'; ?>
        <?php echo form_dropdown('kontes', $options_contest, $contest,$kontes)?>
        </td>
        </th>
	</tr>
	<tr>
       <th>
      <td style="text-align: left; font-family:sans-serif; font-size:14px">Tugas</td>     
        <td>
        <?php $tugas = 'id="tugas" name="tugas"'; ?>
        <?php echo form_dropdown('tugas', $options_problem, $problem, $tugas)?>
        </td>
        </th>
    </tr>    
</table>
<?php
echo form_fieldset_close();
?>
</div>

<div style="margin-right:-5px; position:relative; margin-top:-6px; float:left">
<?php
$data = array(
		'style'		=>	'max-height:65px; min-height:65px'
	);
echo form_fieldset('Proses Clustering',$data);
?>
<table>
     <tr>
       <th>
       <td style="text-align: left; font-family:sans-serif; font-size:14px; padding-bottom:7px">
        <?php
        $data = array(
			'name'      => 'metode_clustering',
            'id'        => 'metode_clustering',
            'value'   	=> 'actived',
			'checked'	=> $metode_clustering,
			'onclick'	=> 'checkbox()'
            );
        
        echo form_checkbox($data);
		echo ' metode clustering';
        ?>
        </td>
        </th>
    </tr>
    <tr>
        <th>
        <td style="text-align: left; font-family:sans-serif; font-size:14px">
        <?php
		if($select[$method] == 'k'){
			$h='hidden';
		}
		else{
			$h='visibility';
		}
        $data = array(
   			'name'    		=> 'test_case',
            'id'       		=> 'test_case',
			'checked'		=> $test_case,
			'value'			=> 'actived',
            'onclick'		=> 'checkbox()',
			'style'         => "visibility:$h"   
			);
        echo form_checkbox($data);
        ?>
        <font id='tc' style="visibility:<?php echo $h ?>"> <?php echo 'kesamaan test case'; ?> </font>
        <?php
		?>
        </td>
        </th>
    </tr>
</table>
<?php
echo form_fieldset_close();
?>

</div>

<div  style="margin-right:5px; position:relative; margin-top:-8px; float:left; padding-top:3px; margin-left:10px; max-width:350px; min-height:25px; max-height:25px">
<?php
$data = array(
		'style'		=>	'max-height:40px; min-height:40px; margin-bottom:5px'
	);
echo form_fieldset('Metode', $data);
?> 
<table>
    <tr>
    	<th>
       	<?php if (empty($metode_clustering)){ ?>
    		<td id='mclustering' style="font-family:sans-serif; font-size:14px; visibility:hidden;padding-bottom:5px">
  		<?php
		$v = 'hidden';
		}
		else {
		?>
        <td id='mclustering' style="font-family:sans-serif; font-size:14px; visibility:visible;padding-bottom:5px">
        <?php
		$v = 'visible';
		}
		$methodjs = 'id="method" name="method"';
		echo form_dropdown('method', $options, $method, $methodjs);
	    if (!empty($metode_clustering)){	
			if($select[$method] == 'k'){
				$k = 'visible';
				$bk = 'hidden';
				$databk = 'id="i" style="visibility:hidden"';
			}
			else if($select[$method] == 'i'){
				$k = 'hidden';
				$bk = 'visible';
				$databk = 'id="i" style="visibility:visible"';
			}
			else{
				$k = 'hidden';
				$bk = 'hidden';
				$databk = 'id="i" style="visibility:hidden"';
			}
		}
		else{
			$k = 'hidden';
			$bk = 'hidden';
			$databk = 'id="i" style="visibility:hidden"';
		}
		?>
       	</td>
        <td>
        <font id="font_i" style="visibility:<?php echo $bk ?>">&nbsp;&nbsp; i </font>
        <?php
        $options=array(
            '1.00' => '1.00',
            '0.99' => '0.99',
            '0.98' => '0.98',
            '0.97' => '0.97',
            '0.96' => '0.96',
            '0.95' => '0.95',
            '0.94' => '0.94',
            '0.93' => '0.93',
            '0.92' => '0.92',
            '0.91' => '0.91',
            '0.90' => '0.90',
            '0.89' => '0.89',
            '0.88' => '0.88',
            '0.87' => '0.87',
            '0.86' => '0.86',
            '0.85' => '0.85',
            '0.84' => '0.84',
            '0.83' => '0.83',
            '0.82' => '0.82',
            '0.81' => '0.81',
        );    
		echo form_dropdown('i', $options, $i, $databk);
		?>
        <font id="font_k" style="margin-left:-70px; padding-top:2px; position:absolute; visibility:<?php echo $k?>">k</font>
        <?php 
		if($k == 'visible' && !empty($metode_clustering)){
			$data = array(
			  'name'        => 'k',
			  'id'          => 'k',
			  'style'       => 'width:35px; height:20px; margin-left:-55px; margin-right:25px; visibility:visible'       
			);
		}
		else{
			$data = array(
			  'name'        => 'k',
			  'id'          => 'k',
			  'style'       => 'width:35px; height:20px; margin-left:-55px; margin-right:25px; visibility:hidden'       
			);
	
		}
        echo form_input($data);
   		?>
    
        </td>
        </th>
    </tr>
</table>
<?php
echo form_fieldset_close();
?>

<?php
$data = array(
	'name'      => 'proses',
	'id'        => 'proses',
	'value'		=> 'actived',
	'checked'	=> $process
);

echo form_checkbox($data);
echo ' modus penelitian';
?>
</div>
<div  style="float:left; margin-left:-15px; min-height:35px; max-height:35px; padding-right:30px; padding-top:21px; padding-bottom:16px">
<table>
	<tr>
		<th>
        <td id="submit" onclick="fbk()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <?php echo form_submit('run', 'Proses')?></td>
    	</th>
	</tr>
</table>
</div>
<?php echo form_close()?>

<script>  
    $(document).ready(function(){
        $("#kontes").change(function(){
            var kontes = $("#kontes").val();
            $.ajax({
               type : "POST",
               url  : "<?php echo base_url(); ?>index.php/cmain/get_problem",
               data : {kontes: kontes},
               success: function(data){
                   $("#tugas").html(data);
               }
            });
		});
    });
</script>