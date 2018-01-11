<?php echo form_open('cmain/result_table');?>
<div style="min-width:150px; position:relative; margin-right:10px; border:1px solid #bbb; float:left; padding:10px">
<table>
    <tr>
 	    <th>
        <td style="text-align: left; font-family:'Arial Black', Gadget, sans-serif; font-size:14px">Kontes</td>
        <td style="text-align: left; font-family:'Arial Black', Gadget, sans-serif; font-size:14px; padding-right:10px">
        <?php $kontes = 'id="kontes" name="kontes"'; ?>
        <?php echo form_dropdown('kontes', $options_contest, $contest, $kontes)?>
        </td>
        </th>
    </tr>    
</table>
</div>
<div  style="position:relative; float:left; padding:10px; margin-left:-35px;">
<table>
	<tr>
		<th>
        <td id="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <?php echo form_submit('run', 'Hasil')?></td>
    	</th>
	</tr>
</table>
</div>
<?php echo form_close()?>
