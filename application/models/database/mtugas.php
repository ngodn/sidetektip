<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class mTugas extends CI_Model {

    public function __construct(){
        parent::__construct();
		
    }
    
	public function access($username){
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->select('id');
		$db2->from('users');
		$db2->where('username',$username);
		$query = $db2->get();	
		foreach($query->result() as $row){
		    $user_id = $row->id;  //$array menghasilkan associative array : $id => $name	
		}
		$contest_id = $this->access_contests($user_id);
		$options_contest = $this->generate_contests($contest_id);
		return $options_contest;
	}
	
	public function access_contests($user_id){
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->select('contest_id');
		$db2->from('contests_users');
		$db2->where('user_id',$user_id);
		$query = $db2->get();	
		foreach($query->result_array() as $row){
		    $contest_id[$row['contest_id']] = $row['contest_id'];  //$array menghasilkan associative array : $id => $name	
		}
		return $contest_id;
	}

    public function generate_contests($contest_id){
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->select('id,name,end_time');
		$db2->from('contests');
		$db2->where_in('id',$contest_id);
		$db2->order_by('name');
		$query = $db2->get();
		$d=strtotime("today");
		$now = date("Y-m-d h:i:sa", $d);
		foreach($query->result_array() as $row)
			{
				if($row['end_time'] > $now){ 
					$options_contest[$row['id']]=$row['name']." (masih berlangsung)";  //$array menghasilkan associative array : $id => $name	
				}
				else{
					$options_contest[$row['id']]=$row['name'];
				}
			}
		return $options_contest;	
    }
	
	public function generate_problems ($contest_id){ //query untuk mengambil nama problem dari kontes yang dipilih
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->select('problems.id,problems.title');
		$db2->from('problems');
		$db2->join('contests_problems','contests_problems.problem_id = problems.id');
		$db2->where('contests_problems.contest_id',$contest_id);
		$db2->order_by('problems.id');
		$query = $db2->get();
		foreach($query->result_array() as $row)
			{
				$options_problem[$row['id']]=$row['title'];  //$array menghasilkan associative array : $id => $title	
			}
		if($query->result_array())
		{
			return $options_problem;
		}
		else
		{
			$options_problem['problems_kosong']='tidak ada tugas';
			return $options_problem;
		}	
	}
	
	public function contest_name ($contest_id){ //query untuk mengambil nama problem dari kontes yang dipilih
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->select('name');
		$db2->from('contests');
		$db2->where('id',$contest_id);
		$query = $db2->get();
		foreach($query->result() as $row)
			{
				$contest_name = $row->name;  //$array menghasilkan associative array : $id => $name	
			}
		return $contest_name ;	
	}
	
	public function problem_name ($problem_id){ //query untuk mengambil nama problem dari kontes yang dipilih
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->select('title');
		$db2->from('problems');
		$db2->where('id',$problem_id);
		$query = $db2->get();
		foreach($query->result() as $row)
			{
				$problems_name = $row->title;  //$array menghasilkan associative array : $id => $title	
			}
		return $problems_name ;	
	}
	
	public function get_file($contest_id,$problem_id,$username=''){ //mengambil file yang akan di clustering
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
					//$line = preg_replace('/#.*/', '', $line);
					
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
	
	public function max_st($contest_id,$problem_id,$submitter_id){
	  	$db2 = $this->load->database('grouptwo', TRUE);
		$db2 ->select_max('submitted_time');
		$db2 ->from('submissions');
		$db2 ->where('problem_id',$problem_id);
		$db2 ->where('contest_id',$contest_id);
		$db2 ->where('submitter_id',$submitter_id);
		$query = $db2 ->get();	
		foreach($query->result() as $row){
			$st = $row->submitted_time;
			break;	
		}
		return $st;
	}
	
	public function get_token($problem_id){
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->select('token');
		$db2->from('problems');
		$db2->where('id',$problem_id);
		$query = $db2->get();	
		foreach($query->result() as $row){
		    $token = $row->token;  //$array menghasilkan associative array : $id => $name	
		}
		return $token;
	}
	
	public function max_submittedtime($contest_id,$problem_id){
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->select_max('submitted_time');
		$db2->from('submissions');
		$db2->where('contest_id',$contest_id);
		$db2->where('problem_id',$problem_id);
		$db2->where_not_in('submit_content',!NULL);
		$query = $db2->get();	
		foreach($query->result() as $row){
		    $max_submittedtime = $row->submitted_time;  //$array menghasilkan associative array : $id => $name	
		}
		return $max_submittedtime;
	}
	
	public function get_submitters($contest_id,$problem_id){
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2 ->distinct();
		$db2->select('users.username');
		$db2->from('submissions');
		$db2->join('users','submissions.submitter_id = users.id');
		$db2->where('submissions.contest_id',$contest_id);
		$db2->where('submissions.problem_id',$problem_id);
		$db2->where('submissions.score >', 0); //file yang diambil hanya file yang memiliki nilai skor diatas nol	
		$query = $db2->get();
		foreach($query->result_array() as $row){
			$submitters[] = $row['username'];
		}
		return $submitters;
	}
	
	public function get_participants($contest_id){
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2 ->distinct();
		$db2->select('users.username,contests_users.contest_id');
		$db2->from('contests_users');
		$db2->join('users','contests_users.user_id = users.id');
		$db2->where('contests_users.contest_id', $contest_id);
		$db2->where('contests_users.role', 2); //kode role untuk peserta
		$db2->order_by('users.username');
		$query = $db2->get();
		foreach($query->result_array() as $row){
			$participants[] = $row['username'];
		}
		return $participants;
	}
	
	public function sum_submit($contest_id,$problem_id,$username)
    {
		$db2 = $this->load->database('grouptwo', TRUE);
		$db2->where('submissions.contest_id',$contest_id);
		$db2->where('submissions.problem_id',$problem_id);
		$db2->where('users.username',$username); 
		$db2->from('submissions');
		$db2->join('users','submissions.submitter_id = users.id');
		$number = $db2->count_all_results();	
		return $number;	
    }	
}