<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/login.css" />

<div style="text-align:center;  font-family: Arial; color:#FFF; padding-top:200px">Aplikasi berjalan baik pada browser <font color="#00CCFF">Google Chrome</font></div>
<section class="login">
	<div class="titulo">Staff Login</div>
    <?php 
	if($hasil == 'password'){
		echo   '<div class="verify">';
		echo '<font style="alignment-adjust:middle" color="#333"> password anda salah </font>';
		echo '</div>';
	}
	else if($hasil == 'username'){
		echo  '<div class="verify">';
		echo '<font style="alignment-adjust:middle" color="#333"> username anda tidak terdaftar </font>';
		echo '</div>';
	}

?>

    <?php echo form_open('clogin');
	
    $data = array(
              'name'	        => 'username',
              'id'      	    => 'username',
			  'type'			=> 'text',
			  'placeholder'		=> 'Username',
			  'data-icon'		=> 'U'
            );

	echo form_input($data);
	
	 $data = array(
              'name'	        => 'password',
              'id'      	    => 'password',
			  'type'			=> 'password',
			  'placeholder'		=> 'Password',
			  'data-icon'		=> 'x'
            );

	echo form_password($data);
  ?>
        <div class="olvido">
          
        </div>
  <?php
   	 $data = array(
              'class'	        => 'enviar',
			  'type'			=> 'submit',
			  'value'			=> 'LOGIN',
			  'style'			=> 'cursor:pointer'
            );

		echo form_submit($data);
  ?>
   <?php echo form_close(); ?>
</section>


