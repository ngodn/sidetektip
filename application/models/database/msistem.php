<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class mSistem extends CI_Model {

    public function __construct(){
        parent::__construct(); 
	}

	public function insert_clustering_option($contest_id,$problem_id,$method,$i,$k,$testcase_option,$st,$method_option,$hapus_include_option){
		$db1 = $this->load->database('groupone', TRUE);
		$data = array(
		   'contest_id' => $contest_id,
		   'problem_id' => $problem_id,
		   'method' => $method,
		   'i' => $i,
		   'k' => $k,
		   'testcase_option' => $testcase_option,
		   'method_option' => $method_option,
		   'hapus_include_option' => $hapus_include_option
		);
		$db1->insert('clustering_option', $data);
	}
	


	public function check_id($contest_id,$problem_id,$method,$i,$k,$testcase_option,$method_option,$hapus_include_option){
	  	$db1 = $this->load->database('groupone', TRUE);
		$db1 ->select('id');
		$db1 ->from('clustering_option');
		$db1 ->where('problem_id',$problem_id);
		$db1 ->where('contest_id',$contest_id);
		$db1 ->where('method',$method);
		if($i != NULL){
			$db1 ->where('i',$i);
		}
		if($k != NULL){
			$db1 ->where('k',$k);
		}
		$db1 ->where('testcase_option',$testcase_option);
		$db1 ->where('method_option',$method_option);
		$db1 ->where('hapus_include_option',$hapus_include_option);	
		$query = $db1 ->get();	
		foreach($query->result() as $row){
			$nomor = $row->id;	
			return $nomor;
		}
	}
	
	public function check_all_id($contest_id,$problem_id=''){
	  	$db1 = $this->load->database('groupone', TRUE);
		$db1 ->select('id');
		$db1 ->from('clustering_option');
		$db1 ->where('contest_id',$contest_id);
		if($problem_id != ''){
			$db1 ->where('problem_id',$problem_id);
		}
		$query = $db1 ->get();	
		foreach($query->result_array() as $row){
			$semua_id[] = $row['id'];
		}
		if(!empty($semua_id)){		
			return $semua_id;
		}
	}
	
	public function insert_clusters($contest,$problem,$method,$i,$k,$testcase_option,$clusters,$st,$method_option,$hapus_include_option){
        $c=1;
		$id = $this->check_id($contest,$problem,$method,$i,$k,$testcase_option,$method_option,$hapus_include_option);	
		foreach($clusters as $clus){
			foreach($clus as $username){
				$db1 = $this->load->database('groupone', TRUE);
				$data = array(
				   'clustering_option_id' => $id,
				   'username' => $username,
				   'clusters' => $c
				);
				$db1->insert('clusters', $data);
			}
			$c++;
		}
	}
	
	
	
	/*
	public function update_clusters($contest_id,$problem_id,$method,$i,$k,$testcase_option,$clusters,$st,$method_option){
        $c=1;
		$id = $this->check_id($contest_id,$problem_id,$method,$i,$k,$testcase_option,$method_option);
		foreach($clusters as $clus){
			foreach($clus as $username){
				$db1 = $this->load->database('groupone', TRUE);
				$data = array(
				   'clusters' => $c
				);
				$db1->where('clustering_option_id', $id);
				$db1->where('username', $username);
				$db1->update('clusters', $data);
				$this->update_plagiarism($contest_id,$problem_id,$username,$st); 
			}
			$c++;
		}
	}
	*/
	
	public function get_submitters($contest_id,$problem_id){
		$db1 = $this->load->database('groupone', TRUE);
		$db1 ->select('username');
		$db1 ->from('plagiarism');
		$db1 ->where('contest_id',$contest_id);
		$db1 ->where('problem_id',$problem_id);	
		$query = $db1 ->get();
		foreach($query->result_array() as $row){
			$submitters[] = $row['username'];
		}
		return $submitters;
	}
	 
	
	public function check_submitters($contest_id,$problem_id,$username){
		$db1 = $this->load->database('groupone', TRUE);
		$db1 ->from('plagiarism');
		$db1 ->where('contest_id',$contest_id);
		$db1 ->where('problem_id',$problem_id);	
		$db1 ->where('username',$username);	
		$number = $db1->count_all_results();
		if(!$number){
			$number=0;
		}
		return $number;
	}
	
	public function check_st($contest_id,$problem_id,$username,$st){
		$db1 = $this->load->database('groupone', TRUE);
		$db1 ->from('plagiarism');
		$db1 ->where('contest_id',$contest_id);
		$db1 ->where('problem_id',$problem_id);	
		$db1 ->where('username',$username);	
		$db1 ->where('submitted_time',$st);	
		$number = $db1->count_all_results();
		if(!$number){
			$number=0;
		}
		return $number;
	}
	
	public function delete_cluster($contest_id,$problem_id){
		$db1 = $this->load->database('groupone', TRUE);
		$semua_id = $this->check_all_id($contest_id,$problem_id);
		if(!empty($semua_id)){
			foreach($semua_id as $id){ 
				$db1->delete('clusters', array('clustering_option_id' => $id));
			}
			$db1->delete('clustering_option', array('contest_id' => $contest_id, 'problem_id' => $problem_id));
		}
	}
	
	/*
	public function delete_process($contest_id,$problem_id){
		$db1 = $this->load->database('groupone', TRUE);
		$this->delete_cluster($contest_id,$problem_id);
		$db1->delete('plagiarism', array('contest_id' => $contest_id, 'problem_id' => $problem_id));
	}
	*/
	
	public function delete_submitters($contest_id,$problem_id,$username){
		$db1 = $this->load->database('groupone', TRUE);
		$db1->delete('plagiarism', array('contest_id' => $contest_id, 'problem_id' => $problem_id, 'username' => $username));
		$db1->delete('notes', array('contest_id' => $contest_id, 'username' => $username));
	}
	
	public function insert_submitters($contest_id,$problem_id,$username,$submitted_time){
		$db1 = $this->load->database('groupone', TRUE);
		$data = array(
		   'contest_id' => $contest_id,
		   'problem_id' => $problem_id,
		   'username' => $username,
		   'submitted_time' => $submitted_time,
		   'plagiat' => 0
		);
		$db1->insert('plagiarism', $data); 		
	}
	
	/*
	public function update_clusters($contest_id,$problem_id,$method,$i,$k,$testcase_option,$clusters,$st,$method_option){
        $c=1;
		$id = $this->check_id($contest_id,$problem_id,$method,$i,$k,$testcase_option,$method_option);
		foreach($clusters as $clus){
			foreach($clus as $username){
				$db1 = $this->load->database('groupone', TRUE);
				$data = array(
				   'clusters' => $c
				);
				$db1->where('clustering_option_id', $id);
				$db1->where('username', $username);
				$db1->update('clusters', $data);
				$this->update_plagiarism($contest_id,$problem_id,$username,$st); 
			}
			$c++;
		}
	}
	
	//mengupdate data pada table plagiarism
	public function update_plagiarism($contest_id,$problem_id,$username,$st){
		$db1 = $this->load->database('groupone', TRUE);
		$data = array(
		   'submitted_time' => $st[$username]
		);
		$db1->where('contest_id', $contest_id);
		$db1->where('problem_id', $problem_id);
		$db1->where('username', $username);
		$db1->update('plagiarism', $data);
	}
	*/

	public function get_clusters($contest_id,$problem_id,$method,$i,$k,$testcase_option,$method_option,$hapus_include_option){
	  	$db1 = $this->load->database('groupone', TRUE);
		$id = $this->check_id($contest_id,$problem_id,$method,$i,$k,$testcase_option,$method_option,$hapus_include_option);
		$db1 ->select('username,clusters');
		$db1 ->from('clusters');
		$db1 ->where('clustering_option_id',$id);
		$query = $db1 ->get();	
		$c=1;
		$u=0;
		foreach($query->result_array() as $row){
			if($row['clusters']==$c){
				$clusters[$row['clusters']-1][$u] = $row['username'];
				$u++;
			}
			else{
				$u=0;
				$clusters[$row['clusters']-1][$u] = $row['username'];
				$u++;
				$c++;
			}
		}
		if(!empty($clusters)){
		return $clusters;
		}
	}
	
	public function cek_proses($contest_id,$problem_id,$method,$i,$k,$testcase_option,$method_option,$hapus_include_option){
	  	$db1 = $this->load->database('groupone', TRUE);
		$id = $this->check_id($contest_id,$problem_id,$method,$i,$k,$testcase_option,$method_option,$hapus_include_option);
		if(empty($id)){
			$id=0;
		}
		$db1 ->select('username,clusters');
		$db1 ->from('clusters');
		$db1 ->where('clustering_option_id',$id);
		$number = $db1->count_all_results();
		if(!$number){
			$number=0;
		}
		return $number;
	}
	
	public function check_plagiarism($contest_id,$problem_id){
	  	$db1 = $this->load->database('groupone', TRUE);
		$db1 ->select('username');
		$db1 ->from('plagiarism');
		$db1 ->where('contest_id',$contest_id);
		$db1 ->where('problem_id',$problem_id);
		$number = $db1->count_all_results();
		if(!$number){
			$number=0;
		}
		return $number;
	}
	
	public function max_submittedtime($contest_id,$problem_id){
	  	$db1 = $this->load->database('groupone', TRUE);
		$db1 ->select_max('submitted_time');
		$db1 ->from('plagiarism');

		$db1 ->where('problem_id',$problem_id);
		$db1 ->where('contest_id',$contest_id);
		$query = $db1 ->get();	
		foreach($query->result() as $row){
				$max_submittedtime  = $row->submitted_time;
		}
		return $max_submittedtime ;	
	}
	
	//mengambil informasi plagiat peserta
	public function plagiat($contest_id,$problem_id){
	  	$db1 = $this->load->database('groupone', TRUE);
		$db1 ->select('username,plagiat');
		$db1 ->from('plagiarism');
		$db1->where('contest_id', $contest_id);
		$db1->where('problem_id', $problem_id);
		$db1 ->order_by('username');
		$query = $db1 ->get();	
		
		if($query->result_array()){
			foreach($query->result_array() as $row){
				$plagiat[$row['username']] = $row['plagiat'];
			}
			return $plagiat;	
		}
		else{
			return NULL;
		}
	}
	
	public function data_cluster($contest_id,$problem_id){
	  	$db1 = $this->load->database('groupone', TRUE);
		$db1 ->select('username,plagiat,note,examiner');
		$db1 ->from('plagiarism');
		$db1->where('contest_id', $contest_id);
		$db1->where('problem_id', $problem_id);
		$db1 ->order_by('username');
		$query = $db1 ->get();
		$c = 0;			
		if($query->result_array()){
			foreach($query->result_array() as $row){
				$username[$c] = $row['username'];
				$plagiat[$row['username']] = $row['plagiat'];
				$note[$row['username']] = $row['note'];
				$examiner[$row['username']] = $row['examiner'];
				$c++;
			}
			return array($username,$plagiat,$note,$examiner);	
		}
		else{
			return array(NULL<NULL,NULL,NULL);
		}
	}
	
	public function nilai($contest_id,$problem_id){
		$db1 = $this->load->database('groupone', TRUE);
		$db1 ->select('username,plagiat');
		$db1 ->from('plagiarism');
		$db1 ->where('contest_id', $contest_id);
		$db1 ->where('problem_id', $problem_id);
		$db1 ->order_by('username');
		$query = $db1 ->get();
		foreach($query->result_array() as $row){
			$plagiat[$row['username']] = $row['plagiat'];
		}
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->select('users.username,submissions.score,submissions.submitted_time');
		$db2->from('submissions');
		$db2->join('users','submissions.submitter_id = users.id');
		$db2->where('submissions.contest_id',$contest_id);
		$db2->where('submissions.problem_id',$problem_id);
		$db2->order_by('submissions.submitted_time','desc');
		$query = $db2->get();
		foreach($query->result_array() as $row){ 	
			if(empty($nilai[$row['username']])){ //jika variable submitter[username] belum pernah diambil
				if(!empty($plagiat[$row['username']])){
					if($plagiat[$row['username']] == '1'){
						$score = 'plagiat';
					}
					else{
						$score = $row['score'];
					}
				}
				else{
					$score = $row['score'];
				}
			$nilai[$row['username']] = $score;
			$submitted_time[$row['username']] = $row['submitted_time'];
			}
		}
		if(!empty($nilai)){
			return array($nilai,$submitted_time);
		}
	}
	
	public function hasil($contest_id){
	  	$db1 = $this->load->database('groupone', TRUE);
		$db1 ->select('username,plagiat,problem_id');
		$db1 ->from('plagiarism');
		$db1->where('contest_id', $contest_id);
		$db1 ->order_by('username');
		$query = $db1 ->get();	
		if($query->result_array()){
			foreach($query->result_array() as $row){
				$problem[$row['problem_id']] = '';
				if($row['plagiat']==1){
					if(empty($sumplagiat[$row['username']])){
						$sumplagiat[$row['username']] = 1;	
						$plagiat[$row['problem_id']][$row['username']] = 1;
					}
					else{
						$sumplagiat[$row['username']]++ ;
						$plagiat[$row['problem_id']][$row['username']] = 1;
					}
				}
				else{
					if(empty($sumplagiat[$row['username']])){
						$sumplagiat[$row['username']] = 0;
						$plagiat[$row['problem_id']][$row['username']] = 0;
					}
					else{
						$sumplagiat[$row['username']]+= 0 ;
						$plagiat[$row['problem_id']][$row['username']] = 0;
					}
				}
			}
			return array($sumplagiat,$plagiat,$problem) ;	
		}
		else{
			return array(NULL,NULL,NULL);
		}
	}
	
	//mengubah status plagiat peserta
	public function update_plagiat($username,$plagiat,$contest,$problem,$us){
		$db1 = $this->load->database('groupone', TRUE);
		$data = array( 
		   'plagiat' => $plagiat,
		   'examiner' => $us
		);
		$db1->where('username', $username);
		$db1->where('contest_id', $contest);
		$db1->where('problem_id', $problem);
		$db1->update('plagiarism', $data); 
	}
	
	//mengubah catatan peserta pada tabel peserta
	public function update_note($username,$note,$contest,$problem,$us){
		$db1 = $this->load->database('groupone', TRUE);
		$data = array( 
		   'note' => $note,
		   'examiner' => $us
		);
		$db1->where('username', $username);
		$db1->where('contest_id', $contest);
		$db1->where('problem_id', $problem);
		$db1->update('plagiarism', $data); 
	}
	
	/*
	public function ambil_keterangan($contest_id){
		$db1 = $this->load->database('groupone', TRUE);
		$db1 ->from('notes');
		$db1 -> where('contest_id', $contest_id);
		$query = $db1 ->get();			
		foreach($query->result_array() as $row){
		    $note[$row['username']] = $row['note'];
		}
		if(empty($note))
		{
			$note = NULL;
		}
		return $note;
	}
	*/
	
	//mengecek keterangan sudah ada isi apa belum
	public function check_keterangan($username){
		$db1 = $this->load->database('groupone', TRUE);
		$db1 ->from('notes');
		$db1->where('username', $username);
		$query = $db1 ->get();			
		if($query->result_array()){
			return 1;	
		}
		else{
			return 0;
		}
	}
	/*
	public function insert_keterangan($username,$note,$contest){
		$db1 = $this->load->database('groupone', TRUE);
		$data = array( 
		   	'note' => $note,
			'username' => $username,
			'contest_id' => $contest
		);
		$db1->insert('notes', $data); 
	}
	
	public function update_keterangan($username,$note,$contest){
		$db1 = $this->load->database('groupone', TRUE);
		$data = array( 
		   'note' => $note,
		);
		$db1->where('username', $username);
		$db1->where('contest_id', $contest);
		$db1->update('notes', $data); 
	}
	*/
	public function update_testcase($contest_id,$problem_id){
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->distinct('submitter_id');
		$db2->from('submissions');
		$db2->where('contest_id',$contest_id);
		$db2->where('problem_id',$problem_id);
		$db2->where('score >', 0); //file yang diambil hanya file yang memiliki nilai skor diatas nol
		$query = $db2->get();
		foreach($query->result_array() as $row){
			$db2 = $this->load->database('grouptwo', TRUE);
			$value_testcase = '';
			$max_st = $this->max_st($contest_id,$problem_id,$row['submitter_id']);	
			$db2->select('users.username,submissions.grade_content');
			$db2->from('submissions');
			$db2->join('users','submissions.submitter_id = users.id');
			$db2->where('submissions.contest_id',$contest_id);
			$db2->where('submissions.problem_id',$problem_id);
			$db2->where('submissions.submitter_id',$row['submitter_id']);
			$db2->where('submissions.submitted_time',$max_st );
			$db2->order_by('submissions.submitted_time','desc');
			$query = $db2->get();
			foreach($query->result() as $row){
				$value_testcase = '';
				$total_case=preg_replace('/({"verdict").*("total_testcase":)/', '', $row->grade_content);
				$total_case=preg_replace('/(,").*/', '', $total_case);
				
				$line = str_replace('\n',"\n",$row->grade_content);
				$line = str_replace('\r',"\r",$line);
				$line = str_replace('\t',"\t",$line);
				$line=stripslashes($line);
				$line=preg_replace('/({"verdict").*("output":")/', '', $line);
				$line=preg_replace('/(Testcase)*/', '', $line);
				$line=preg_replace('/(Accepted)*/', '', $line);
				$line=preg_replace('/(Answer)*/', '', $line);
				$line=preg_replace('/(Exited with error status).*/', 'Error ()', $line);
				$line=preg_replace('/(Time limit exceeded).*/', 'Time', $line);
				$line=preg_replace('/( sec real, )*/', '', $line);
				$line=preg_replace('/( sec wall, )*/', '', $line);
				$line=preg_replace('/( syscalls)*/', '', $line);
				$line=preg_replace('/(#)*/', '', $line);
				$line=preg_replace('/(in :).*/', '', $line);
				$line=preg_replace('/(","total_testcase).*(})/', '', $line);	
				$keywords = preg_split("/[\s,]+/", $line);
				for($i=2;$i<$total_case*3+1;$i+=2){
					if(($keywords[$i]) == 'OK'){
						$value_testcase .= '1';
						$i++;
					}
					else if (($keywords[$i]) == 'Wrong'){
						$value_testcase .= '0';
					}
					else if (($keywords[$i]) == 'Time'){
						$value_testcase .= '2';
					}
					else if (($keywords[$i]) == ''){
						$value_testcase .= '3';
					}
					else if (($keywords[$i]) == 'Error'){
						$value_testcase .= '3';
					}
					
					if(empty($keywords[$i+2])){
						break;
					}
				}
				$data = array(
				   'value_testcase' => $value_testcase,
				);
				$db1 = $this->load->database('groupone', TRUE);	
				$db1->where('contest_id', $contest_id);
				$db1->where('problem_id', $problem_id);
				$db1->where('username', $row->username);
				$db1->update('plagiarism', $data);
				break;
			}
		}
	}
	
	public function max_st($contest_id,$problem_id,$submitter_id){
	  	$db2 = $this->load->database('grouptwo', TRUE);
		$db2 ->select_max('submitted_time');
		$db2 ->from('submissions');
		$db2 ->where('problem_id',$problem_id);
		$db2 ->where('contest_id',$contest_id);
		$db2 ->where('submitter_id',$submitter_id);
		$db2 ->where('score >',0);
		$query = $db2 ->get();	
		foreach($query->result() as $row){
			$st = $row->submitted_time;
			break;	
		}
		return $st;
	}
	
	public function cluster_testcase($contest_id,$problem_id){
	  	$db1 = $this->load->database('groupone', TRUE);
		$value_testcase = $this->value_testcase($contest_id,$problem_id);
		$a = 0;
		if(!empty($value_testcase)){
			//echo "$value_testcase = ".$value_testcase;
			foreach($value_testcase as $vc){
				$db1 ->select('username');
				$db1 ->from('plagiarism');
				$db1 ->where('problem_id',$problem_id);
				$db1 ->where('contest_id',$contest_id);
				$db1 ->where('value_testcase',$vc);
				$query = $db1 ->get();	
				$b = 0;
				foreach($query->result_array() as $row){
					$clusters[$a][$b] = $row['username'];
					$b++;
				}
				$a++;
			}
			if(!empty($clusters)){
				return $clusters;
			}	
		}
	}
	
	public function value_testcase($contest_id,$problem_id){
	  	$db1 = $this->load->database('groupone', TRUE);
		$db1 ->distinct();
		$db1 ->select('value_testcase');
		$db1 ->from('plagiarism');
		$db1 ->where('problem_id',$problem_id);
		$db1 ->where('contest_id',$contest_id);
		$query = $db1 ->get();	
		foreach($query->result_array() as $row){
			if($row['value_testcase'] != NULL){
				$value[] = $row['value_testcase'];
			}
			else if($row['value_testcase'] == NULL){
				echo "tes";
				return 1;

				break;
			}
		}
		if(!empty($value)){
			return $value;
		}
		else{
			return NULL;
		}
	}
	
	public function get_data_cluster($contest_id, $problem_id){
		$db1 = $this->load->database('groupone', TRUE);
		$db1 ->select('username,value_testcase,submitted_time,note,examiner');
		$db1 ->from('plagiarism');
		$db1 ->where('problem_id',$problem_id);
		$db1 ->where('contest_id',$contest_id);
		$query = $db1 ->get();	
		foreach($query->result_array() as $row){
			$value_testcase[$row['username']] = $row['value_testcase'];
			$note[$row['username']] = $row['note'];
			$examiner[$row['username']] = $row['examiner'];
		}
		if(!empty($value_testcase)){
			return array ($value_testcase, $note, $examiner);
		}
		else{
			return array(NULL,NULL,NULL);
		}
	}
	
	public function contests_system($con){
		$db1 = $this->load->database('groupone', TRUE);
		$db1 ->distinct();
		$db1 ->select('contest_id');
		$db1 ->from('clustering_option');
		$db1 ->where_in('contest_id',$con);
		$query = $db1 ->get();	
		foreach($query->result_array() as $row){
			$contest[] = $row['contest_id'];
		}
		if(isset($contest)){
			return $contest;
		}
	}
	
	public function hapus_data_koreksi($contest_id){
		$db1 = $this->load->database('groupone', TRUE);
		$semua_id = $this->check_all_id($contest_id);
		foreach($semua_id as $id){ 
			$db1->delete('clusters', array('clustering_option_id' => $id));
		}
		$db1->delete('clustering_option', array('contest_id' => $contest_id));
		$db1->delete('plagiarism', array('contest_id' => $contest_id));
	}
	
	public function data_info_clear(){
		$this->load->model('database/mtugas');
		$db1 = $this->load->database('groupone', TRUE);
		$db1 ->select('contest_id,admin,date');
		$db1 ->from('info_clear');
		$query = $db1 ->get();	
		foreach($query->result_array() as $row){
		$datetime1 = date("d-m-Y",strtotime("-1months"));
		$datetime2 = date("d-m-Y",strtotime($row['date']));
			if ($datetime1 >= $datetime2){
				$db1->delete('info_clear', array('contest_id' => $row['contest_id'])); 
			}
			else{
				$contest_name[$row['contest_id']] = $this->mtugas->contest_name($row['contest_id']);
				$admin[$row['contest_id']]= $row['admin'];
				$date[$row['contest_id']]= date("d-M-Y",strtotime($row['date']));
			}
		}
		if(isset($admin)){
			return array($contest_name,$admin,$date);
		}
		else{
			return array(NULL,NULL,NULL);
		}
	}
	
	public function insert_info_clear($contest_id,$admin){
		$db1 = $this->load->database('groupone', TRUE);
		$data = array(
		   'contest_id' => $contest_id,
		   'admin' => $admin,
		   'date' => date("Y-m-d")
		);
		$db1->insert('info_clear', $data);
	}
	
	public function hapus_data_info_clear($contest_id){
		$db1 = $this->load->database('groupone', TRUE);
		$db1->delete('info_clear', array('contest_id' => $contest_id));
	}

	public function hilangkan_include($contest_id, $problem_id, $username = '') {
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->select('users.username,submissions.submit_content,submissions.submitted_time,submissions.grade_content,submissions.score');
		$db2->from('submissions');
		$db2->join('users','submissions.submitter_id = users.id');
		$db2->where('submissions.contest_id',$contest_id);
		$db2->where('submissions.problem_id',$problem_id);
		if($username != NULL){
			$db2->where_in('users.username',$username);
		}
		$db2->where('submissions.score >', 0); //file yang diambil hanya file yang memiliki nilai skor diatas nol
		$db2->order_by('submissions.submitted_time','desc');
		$query = $db2->get();
		foreach($query->result_array() as $row){ 	
			if(empty($submitter[$row['username']])){ //jika variable submitter[username] belum pernah diambil
				$submitter[$row['username']]=$row['submitted_time'];
				if(!empty($row['submit_content'])){ //jika ada file
					$grade_content = str_replace('\n',"\n",$row['grade_content']);
					$grade_content = str_replace('\r',"\r",$grade_content);
					$grade_content = str_replace('\t',"\t",$grade_content);
					$grade_content = stripslashes($grade_content);
					$grade_content = preg_replace('/({"verdict").*("output":")/', '', $grade_content);
					$grade_content = preg_replace('/(Accepted)*/', '', $grade_content);
					$grade_content = preg_replace('/(in :).*/', '', $grade_content);
					$grade_content = preg_replace('/(","total_testcase).*(})/', '', $grade_content);
					$grade_content = $grade_content;
					$grade_content = str_replace('OK',"OK <br>",$grade_content);
					$grade_content = str_replace('Time limit exceeded',"Time limit exceeded <br>",$grade_content);
					$grade_content = str_replace('Wrong Answer',"Wrong Answer <br>",$grade_content);
					$grade_content = preg_replace('/(Exited with error status).*/', 'Error <br>', $grade_content);
					$grade_content = preg_replace('/(\(0).*(syscalls\))/', '', $grade_content);
					
					$line = preg_replace('/({\"source_lang).*(source_content":")/', '',  $row['submit_content']);
					$line = substr($line,0,strlen($line)-2); 
					
					$line = str_replace("\\\\n","##?",$line);
					$line = str_replace("\\\\t","##",$line);
					$line = str_replace("\\\\r","#*",$line);
					//$line=preg_replace('/\"}\z/', '', $line);
					// //n -> //N //x
					
					//$line = str_replace('\n',"\n",$line);
					$line = str_replace('\r',"\r",$line);
					$line = str_replace('\t',"\t",$line);
					//$line = str_replace('<ios',"< ios",$line);
					//$line = str_replace('<iomanip',"< iosmanip",$line);
					$line = str_replace('<',"&lt;",$line);
					//$line = stripslashes($line);	
					$line = str_replace("##?",'\n',$line);
					$line = str_replace("##",'\t',$line);
					$line = str_replace("#*",'\r',$line);

					// $output = "";
					// foreach ($line as $temp) {
					// 	$output = $temp;
					// }
					$line = preg_replace('/#i.*/', '', $line);
					$write = fopen("temp.c","w");
					fwrite($write, $line);
					$line = shell_exec("gcc -E temp.c");
					$line = preg_replace('/#.*/', '', $line);
					fclose($write);
					shell_exec("rm -r temp.c");

					$file[$row['username']] = $line;
					$st[$row['username']] = $row['submitted_time'];	
					$gc[$row['username']] = $grade_content;
					$score[$row['username']] = $row['score'];
				}
			}
		}
		if(empty($file))
		{
			$file = NULL;
			$st = NULL;
			$gc = NULL;
			$score = NULL;
		}
		return array($file,$st,$gc,$score);	
    }
}