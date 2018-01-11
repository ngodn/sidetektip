<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/* 
 *  ======================================= 
 *  Author     : Muhammad Fachrul Arli - 2014
 *  Email      : fachrul.arly@gmail.com  
 *  ======================================= 
*/ 
class cmain extends CI_Controller {
    
    public function __construct() {
        session_start();
		parent::__construct();
		$this->load->library(array('PHPExcel','PHPExcel/IOFactory'));
		if ( !isset($_SESSION['username']) ) {
				redirect('clogin');
		}
		
    }
				
    public function index() {
		set_time_limit(900); 
		$this->load->model('database/mtugas');
		$this->load->model('database/msistem');
		$options_contest = $this->mtugas->access($_SESSION['username']); //pilihan-pilihan kontes berdaskan username
		foreach ($options_contest as $dc1 => $dc2)
		{
			$contest[] = $dc1;
		}
		$options_problem = $this->mtugas->generate_problems($contest[0]); //nama tugas berdasarkan kontes yang dipilih
		
	 	$data=array(
			'contest' => '',
			'problem' => '',
			'method' => 'average_linkage', //metode default
			'i' => '0.95',
			'k' => '',
			'process' => FALSE,
			'metode_clustering' => TRUE,
			'test_case' => TRUE,
			'hapus_include' => TRUE,
			'options_contest' => $options_contest,
			'options_problem' => $options_problem,
			'user_system' => $_SESSION['username']
		);
        $this->load->view('vLayoutCluster', $data);
	}
	
	//controller clustering
    public function cluster(){ 
        if($this->input->post('run')==''){
            redirect('cmain');
		}
        else {
			$select['bisecting_kmeans'] = 'i';
			$select['kmeans'] = 'k';
			$select['single_linkage'] = 'i';
			$select['average_linkage'] = 'i';
			$select['complete_linkage'] = 'i';
            //tambah method baru disini, sesuaikan pilihan untuk i atau k seperti contoh yang diatas
			
			$this->load->model('clustering/mprosescluster');
			$problem = $this->input->post('tugas');
			$contest = $this->input->post('kontes');
            $method = $this->input->post('method');
		 	$proses = $this->input->post('proses');
			
			if($select[$method] == 'i'){
				$i = $this->input->post('i');
				$k = NULL;
			}
			else if($select[$method] == 'k'){
				$k = $this->input->post('k');
				$i = NULL;	
			}
			else{
				$k = NULL;
				$i = NULL;	
			}
			
			$test_case = $this->input->post('test_case');
			$metode_clustering = $this->input->post('metode_clustering');
			$hapus_include = $this->input->post('hapus_include');
			$this->load->model('database/mtugas');	
			$this->load->model('database/msistem');	
			$this->msistem->hapus_data_info_clear($contest);
			list($file,$st,$gc,$score) = $this->mtugas->get_file($contest,$problem); //variabel file mengandung array associative : username => kode_program
			if($file != NULL){	
				foreach ($file as $peserta=>$kode){
					$sum_submit[$peserta] = $this->mtugas->sum_submit($contest,$problem,$peserta);	
				}
			
				$st_lx = $this->mtugas->max_submittedtime($contest,$problem);  //waktu pengumpul terakhir pada database TOKI
				$st_sistem = $this->msistem->max_submittedtime($contest,$problem) ; //waktu pengumpul terakhir pada database sistem (tabel plagiarism)
			
			//memeriksa checkbox pada menu halaman cluster
			//---//
				if(!empty($test_case)){ //jika checkbox testcase dicentang maka akan ditampilkan
					$testcase_option = 1;
				}
				else{ //jika tikda dicentang, maka tidak akan ditampilkan
					$testcase_option = 0;
				}
				if(!empty($metode_clustering)){ //jika metode clustering dicentang maka akan ditampilkan
					$metode_clustering = 1;
				}
				else{ //jika tidak dicentang, maka tidak akan ditampilkan
					$metode_clustering = 0;
				}
				if(!empty($hapus_include)){ //jika hapus_include dicentang maka akan ditampilkan
					$hapus_include_option = 1;
				}
				else{ //jika tidak dicentang, maka tidak akan ditampilkan
					$hapus_include_option = 0;
				}
				//---//
			
			
		
				//memeriksa adakah peserta yang melakukan pengumpulan baru	
				//---//
				if($st_lx != $st_sistem || !empty($proses)){
					if(!empty($st_sistem)){
						$this->msistem->delete_cluster($contest,$problem);
						$submitters = $this->msistem->get_submitters($contest,$problem); //mengambil data yang mengumpulkan tugas dari database sistem
						foreach($submitters as $username) {  	
							if(empty($sum_submit[$username])){ //jika peserta tidak lagi terdata pada kontes
								$this->msistem->delete_submitters($contest,$problem,$username);	
							}
							else{
								$value = $this->msistem->check_st($contest,$problem,$username,$st[$username]);
								if($value == 0){ //jika peserta melakukan pengumpulan baru
									$this->msistem->delete_submitters($contest,$problem,$username);
								}
							}
						}
					}
					$new_submitters = $this->mtugas->get_submitters($contest,$problem);
					foreach($new_submitters as $username) {
						$value = $this->msistem->check_submitters($contest,$problem,$username);
						if($value == 0){
							$this->msistem->insert_submitters($contest,$problem,$username,$st[$username]);	
						}  
					}
				}
				//----//
				
				$cek_proses = $this->msistem->cek_proses($contest,$problem,$method,$i,$k,$testcase_option,$metode_clustering,$hapus_include_option); 
				
				if($cek_proses == 0){ //jika proses belum pernah dilakukan
				
				//memeriksa proses clustering yang digunakan
				//---//

					if(!empty($metode_clustering)&&!empty($test_case)&&!empty($hapus_include)&&$select[$method]!='k'){						
						$this->msistem->update_testcase($contest,$problem);
						//echo $value_testcase;die();
						$tesc = $this->msistem->cluster_testcase($contest,$problem);

						$a=0;
							foreach($tesc as $tc){	
							foreach($tc as $submitter_username){
								$usr[] = $submitter_username; 
							}
					
							list($file,$st,$gc,$score) = $this->msistem->hilangkan_include($contest,$problem,$usr);	

							$tmpclusters = $this->mprosescluster->clustering($contest,$problem,$method,$i,$k,$file); //melakukan praproses dan clustering	
					
							foreach($tmpclusters as $docs){
								$b=0;
								foreach($docs as $username){
									$clusters[$a][$b]= $username;
									$b++;
								} 
								$a++; 	
							}
							unset($usr); 
							unset($tmpclusters);
						}
					
						list($file,$st,$gc,$score) = $this->mtugas->get_file($contest,$problem);

					}
					else if(!empty($metode_clustering)&&!empty($hapus_include)&&$select[$method]!='k'){
						$tesc =  $this->msistem->cluster_testcase($contest,$problem);
						$a=0;
							foreach($tesc as $tc){	
							foreach($tc as $submitter_username){
								$usr[] = $submitter_username; 
							}
						
							list($file,$st,$gc,$score) = $this->msistem->hilangkan_include($contest,$problem,$usr);
						
							$tmpclusters = $this->mprosescluster->clustering($contest,$problem,$method,$i,$k,$file); //melakukan praproses dan clustering	
							
							foreach($tmpclusters as $docs){
								$b=0;
								foreach($docs as $username){
									$clusters[$a][$b]= $username;
									$b++;
								} 
								$a++; 	
							}
							unset($usr); 
							unset($tmpclusters);
						}
					
						list($file,$st,$gc,$score) = $this->mtugas->get_file($contest,$problem);
					}
					else if(!empty($test_case)&&!empty($hapus_include)&&$select[$method]!='k'){
						$this->msistem->update_testcase($contest,$problem);
						$tesc =  $this->msistem->cluster_testcase($contest,$problem);
						$a=0;
							foreach($tesc as $tc){	
							foreach($tc as $submitter_username){
								$usr[] = $submitter_username; 
							}
						
							list($file,$st,$gc,$score) = $this->msistem->hilangkan_include($contest,$problem,$usr);
						
							$tmpclusters = $this->mprosescluster->clustering($contest,$problem,$method,$i,$k,$file); //melakukan praproses dan clustering	

							foreach($tmpclusters as $docs){
								$b=0;
								foreach($docs as $username){
									$clusters[$a][$b]= $username;
									$b++;
								} 
								$a++; 	
							}
							unset($usr); 
							unset($tmpclusters);
						}
					
						list($file,$st,$gc,$score) = $this->mtugas->get_file($contest,$problem);
					}
					else if(!empty($metode_clustering)&&!empty($test_case)&&$select[$method]!='k'){ //jika menggunanakan testcase dan metode clustering 
						$this->msistem->update_testcase($contest,$problem);
						$tesc =  $this->msistem->cluster_testcase($contest,$problem);
						$a=0;
							foreach($tesc as $tc){	
							foreach($tc as $submitter_username){
								$usr[] = $submitter_username; 
							}
						
							list($file,$st,$gc,$score) = $this->mtugas->get_file($contest,$problem,$usr);
						
							$tmpclusters = $this->mprosescluster->clustering($contest,$problem,$method,$i,$k,$file); //melakukan praproses dan clustering	

							foreach($tmpclusters as $docs){
								$b=0;
								foreach($docs as $username){
									$clusters[$a][$b]= $username;
									$b++;
								} 
								$a++; 	
							}
							unset($usr); 
							unset($tmpclusters);
						}
					
						list($file,$st,$gc,$score) = $this->mtugas->get_file($contest,$problem);
					}
					else if (!empty($metode_clustering)){ //jika hanya menggunanakan metode clustering 
						$clusters = $this->mprosescluster->clustering($contest,$problem,$method,$i,$k,$file); //melakukan praproses dan clustering
					}
					else if (!empty($test_case)){ //jika hanya menggunanakan clustering berdasarkan testcase
						$this->msistem->update_testcase($contest,$problem);
						$clusters =  $this->msistem->cluster_testcase($contest,$problem);
					}
					else if (!empty($hapus_include)){
						$clusters = $this->msistem->cluster_testcase($contest,$problem);
					}
					//---//
				
				}
				else{
					$clusters = $this->msistem->get_clusters($contest,$problem,$method,$i,$k,$testcase_option,$metode_clustering,$hapus_include_option);
				}

				if($cek_proses == 0){ //jika proses clustering belum pernah dilakukan
					$this->msistem->insert_clustering_option($contest,$problem,$method,$i,$k,$testcase_option,$st,$metode_clustering,$hapus_include_option);//table 
					$this->msistem->insert_clusters($contest,$problem,$method,$i,$k,$testcase_option,$clusters,$st,$metode_clustering,$hapus_include_option); 
				}

				$options_contest = $this->mtugas->access($_SESSION['username']);
				list($id_peserta,$plagiat,$note,$examiner) = $this->msistem->data_cluster($contest,$problem);
				//list($file,$st,$gc,$score) = $this->msistem->hilangkan_include($contest,$problem);

				$data=array(
					'contest' => $contest,
					'problem' => $problem,
					'method' => $method, //nama metode clustering
					'sum_submit' => $sum_submit,
					'i' => $i,
					'metode_clustering' => $metode_clustering, //checkbox
					'test_case' => $test_case, //checkbox
					'hapus_include' => $hapus_include, //checkbox
					'file' => $file,
					'submitted_time' => $st,
					'grade_content' => $gc,
					'plagiat' => $plagiat,
					'note' => $note,
					'nilai' => $score,
					'process' => $proses,
					'id_peserta' => $id_peserta,
					'clusters' => $clusters,
					'examiner' => $examiner,
					'options_contest' => $options_contest,
					'options_problem' => $this->mtugas->generate_problems($contest),
					'user_system' => $_SESSION['username'],
					);
				// echo $file['user34'];
				// echo $file['user32'];
				// echo $file['user29'];
				// echo $file['user27'];
				// echo $file['user24'];
				// echo $file['user19'];
				// echo $file['user14'];
				// echo $file['user9'];
				// die();
				$this->load->view('vLayoutCluster',$data);
			}
			else{
				 $error = array(
							'error' => 'belum ada file yang dapat diproses',
							'user_system' => $_SESSION['username']
				 );
				$this->load->view('vErrordata', $error); //error karena tidak ada file
			}
		}
    }
	
	public function get_problem(){ //harusnya pindah ke model
	 	$this->load->model('database/mtugas');
		$contest = $this->input->post('kontes');
		$problem =  $this->mtugas->generate_problems($contest);
		foreach ($problem as $p1 => $p2){	
			$data .= "<option value='$p1'>$p2</option>\n";	
		}
		
		echo $data;
	}	
	
	public function result_page(){
		$this->load->model('database/mtugas');
		$options_contest = $this->mtugas->access($_SESSION['username']);
		/*
		foreach ($options_contest as $dc1 => $dc2)
		{
			$contest[] = $dc1;
		}
		*/
		//$array2 = $this->mtugas->generate_problems($contest[0]);

		$data=array(
			'contest' => '',
			'user_system' => $_SESSION['username'],
			'options_contest' => $options_contest,
		);
		$this->load->view('vLayoutResult',$data);
	}
	
	//menampilkan data ke table pada halaman result
	public function result_table(){
		if($this->input->post('run')=='')
            redirect('cmain/result_page');
        else {
		$this->load->model('database/msistem');	
		$this->load->model('database/mtugas');

		$contest = $this->input->post('kontes');
		$username = $this->mtugas->get_participants($contest);
		list($sumplagiat,$plagiat,$problem) =
							 $this->msistem->hasil($contest);
							 
		if(empty($sumplagiat)){
			$username = 1;
		}
		
		//$keterangan = $this->msistem->ambil_keterangan($contest);
		$options_problem = $this->mtugas->generate_problems($contest);
		
		$data=array(
			'title' => 'Result',
			'contest' => $contest,
			'username' => $username,
			'sumplagiat' => $sumplagiat,
			'plagiat' => $plagiat,
			'problem' => $problem,
			'options_contest' => $options_contest = $this->mtugas->access($_SESSION['username']),
			'options_problem' => $options_problem,
			'user_system' => $_SESSION['username']
		);
		$this->load->view('vLayoutResult',$data);
		}
	}
	
	public function admin_page(){
		$this->load->model('database/mtugas');
		$this->load->model('database/msistem');
		$contests = $this->mtugas->access($_SESSION['username']);
		foreach($contests as $id => $name){
			$contest_id[] = $id;
		}
		list($cn,$admin,$tanggal) = $this->msistem->data_info_clear(); 
		$id_contest = $this->msistem->contests_system($contest_id);
		if(isset($id_contest)){
		foreach($id_contest as $id){
			$options_contest[$id] = $this->mtugas->contest_name($id);
		}
		}
		else{
			$options_contest = NULL;
		}
		$data=array(
			'con' => $id_contest,
			'cn' => $cn,
			'admin' => $admin,
			'tanggal' => $tanggal,
			'user_system' => $_SESSION['username'],
			'options_contest' => $options_contest,
		);
		$this->load->view('vAdmin',$data);
	}
	
	public function database_sistem(){
		$this->load->model('database/msistem');
		$id_contest = $this->input->post('id_contest');
		$admin = $this->input->post('admin');
		$this->msistem->hapus_data_koreksi($id_contest);
		$this->msistem->insert_info_clear($id_contest,$admin);
	}
	
	public function update_plagiat(){ //update data plagiat dari halaman cluster
		$this->load->model('database/msistem');
		$username = $this->input->post('username');
		$plagiat = $this->input->post('plagiat');
		$contest = $this->input->post('contest');
		$problem = $this->input->post('problem');
		$us = $this->input->post('us');
		$this->msistem->update_plagiat($username,$plagiat,$contest,$problem,$us);
	}

	public function update_note(){ //update data keterangan dari halaman cluster
		$this->load->model('database/msistem');
		$username = $this->input->post('username');
		$note = $this->input->post('note');
		$contest = $this->input->post('contest');
		$problem = $this->input->post('problem');
		$us = $this->input->post('us');
		$this->msistem->update_note($username,$note,$contest,$problem,$us);
	}
	
	public function cetak_cluster(){
		$this->load->model('database/msistem');
		$this->load->model('database/mtugas');

		$contest = $this->input->post('kontes'); 
		$problem = $this->input->post('tugas'); 
		
		list($nilai,$submitted_time)= $this->msistem->nilai($contest,$problem);
		$contest_name= $this->mtugas->contest_name($contest);
		$problem_name= $this->mtugas->problem_name($problem);
		$participants= $this->mtugas->get_participants($contest);
		list($value_testcase, $note, $examiner) = $this->msistem->get_data_cluster($contest,$problem);	//mengambil data dari database sistem pada tabel plagiarism	
		
	    $objPHPExcel = new PHPExcel();
 
        $objset = $objPHPExcel->setActiveSheetIndex(0); //inisiasi set object
        $objget = $objPHPExcel->getActiveSheet();  //inisiasi get object
 
        $objget->setTitle('SCTP'); //sheet title
        $objset->setCellValue('A1',$contest_name.'. '.$problem_name ); //insert cell value
        $objget->getStyle('A1')->getFont()->setBold(true)  // set font weight
                ->setSize(15);    //set font size
 		$objset->setCellValue('A3',"Test Case -> 0 = salah; 1 = benar; 2 = time limit; 3 = error");
		
        //table header
		$cols = array("A","B","C","D","E","F");
		$val = array("ID Peserta","Nilai","Submit Terakhir (y-m-d h:m:s)","Test Case","Pemeriksa","Keterangan");
        for($a=0; $a<6; $a++){
				$objset->setCellValue($cols[$a].'4', $val[$a]);

				$objget->getStyle($cols[$a].'4')->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
				$objget->getStyle($cols[$a].'4')->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
				$objget->getStyle($cols[$a].'4')->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
				$objget->getStyle($cols[$a].'4')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
				//set alignment
				$objget->getStyle($cols[$a].'4')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
				//set font weight
				$objget->getStyle($cols[$a].'4')->getFont()->setBold(true) ;
		}
		
		$n=5;
		
		
		foreach($participants as $username){
			if(!isset($value_testcase[$username])){
				$value_testcase[$username] = '';
				$note[$username] = '';
				$examiner[$username] = '';
			}
			if(!isset($nilai[$username])){
				$nilai[$username] = '';
				$value_testcase[$username] = '';
				$note[$username] = '';
				$examiner[$username] = '';
				$submitted_time[$username] = ' - ';
			}
			$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A'.$n, $username)
			->setCellValue('B'.$n, $nilai[$username])
			->setCellValue('C'.$n, $submitted_time[$username])
			->setCellValue('D'.$n, $value_testcase[$username])
			->setCellValue('E'.$n, $examiner[$username])
			->setCellValue('F'.$n, $note[$username]);	
			$n++;
		}
		
		// Redirect output to a client’s web browser (Excel2007)
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');
		
		// If you're serving to IE over SSL, then the following may be needed
		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
		header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header ('Pragma: public'); // HTTP/1.0
		
		//simpan dalam file sample.xls
		$objWriter = IOFactory::createWriter($objPHPExcel, 'Excel2007');                
		$objWriter->save('php://output');
		exit;
	}
	
	public function cetak_laporankontes(){
		$this->load->model('database/msistem');	
		$this->load->model('database/mtugas');

		$contest = $this->input->post('kontes');
		$contest_name= $this->mtugas->contest_name($contest);
		$username = $this->mtugas->get_participants($contest);
		list($sumplagiat,$plagiat,$problem) = $this->msistem->hasil($contest);
							 
		if(empty($sumplagiat)){
			$username = 1;
		}
		
		$options_problem = $this->mtugas->generate_problems($contest);		
		$participants= $this->mtugas->get_participants($contest);
			
	    $objPHPExcel = new PHPExcel();
 
        $objset = $objPHPExcel->setActiveSheetIndex(0); //inisiasi set object
        $objget = $objPHPExcel->getActiveSheet();  //inisiasi get object
 
        $objget->setTitle('SCTP'); //sheet title
        $objset->setCellValue('A1',$contest_name); //insert cell value
        $objget->getStyle('A1')->getFont()->setBold(true)  // set font weight
                ->setSize(15);    //set font size
 		$objset->setCellValue('A3'," \" 0 \" = tidak plagiat ;   \" 1 \" = plagiat ;   \" - \" = tidak mengumpulkan/nilai nol"); //insert cell value
		
        //table header
		$a1 = 67;
		$a2 = 65; 
		$iter = 1 ;
		$no = 2;
		$cols[0] = "A";
		$cols[1] = "B";
		$val[0] = "ID Peserta";
		$val[1] = "Jumlah Plagiat";
		foreach($options_problem as $id => $title){
			if($iter==1){
				$cols[$no] = chr($a1);
				$val[$no]= $title;
				$a1++;
				if($a1 > 90){
					$iter = 2;
					$a1 = 65;
				}
				$no++;
			}
			else{
				$cols[$no] = chr($a1).chr($a2);
				$val[$no] = $title;
				$a2++;
				if($a2 > 90){
					$a2 = 65;
					$a1++;
				}
				$no++;
			}
			
		}
		
        for($a=0; $a<$no; $a++){
				$objset->setCellValue($cols[$a].'4', $val[$a]);

				$objget->getStyle($cols[$a].'4')->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
				$objget->getStyle($cols[$a].'4')->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
				$objget->getStyle($cols[$a].'4')->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
				$objget->getStyle($cols[$a].'4')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
				//set alignment
				$objget->getStyle($cols[$a].'4')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
				//set font weight
				$objget->getStyle($cols[$a].'4')->getFont()->setBold(true) ;
		}
		
		$n=5;	
		foreach($participants as $username){
			if(!isset($sumplagiat[$username])){
				$sumplagiat[$username] = ' ';
			}
			$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A'.$n, $username)
			->setCellValue('B'.$n, $sumplagiat[$username]);
			$n++;
		}
		
		$a=2;
		$n=5;	
		foreach($participants as $us){
			foreach($options_problem as $id => $tittle){
				if(isset($problem[$id])){	
					if(!isset($plagiat[$id][$us])){	
						$plagiat[$id][$us] = ' - ';
					}
				}
				else{
					$plagiat[$id][$us] = ' - ';
				}
			$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue($cols[$a].$n, $plagiat[$id][$us]);
				if($a<$no){
					$a++;
				}
			}
		$a = 2;
		$n++;
		}
		
		// Redirect output to a client’s web browser (Excel2007)
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');
		
		// If you're serving to IE over SSL, then the following may be needed
		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
		header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header ('Pragma: public'); // HTTP/1.0
		
		//simpan dalam file sample.xls
		$objWriter = IOFactory::createWriter($objPHPExcel, 'Excel2007');                
		$objWriter->save('php://output');
		exit;
	}
	
}
