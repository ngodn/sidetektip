<?php if (!defined('BASEPATH')) exit('No direct script access allowed'); 
class mUser extends CI_Model
{
         
        function __construct(){
 			parent::__construct();
 		}

        function cek_user_login($username, $password) {	
		$db2 = $this->load->database('groupone', TRUE);
		$db2->select('*');
		$db2->from('users');
		$db2->where('users.username',$username);
		$db2->where('users.password',$password);
		$db2->join('contests_users','contests_users.user_id = users.id');
		$role = array ('1');
		$db2->where_in('contests_users.role',$role);
		$db2->limit(1);
		$query = $db2->get();	
			if ($query->num_rows() == 1) { // jika data = 1
					return 'benar';
			}
			else
			{
				$db2->select('*');
				$db2->from('users');
				$db2->where('users.username',$username);
				$db2->join('contests_users','contests_users.user_id = users.id');
				$role = array ('1','2');
				$db2->where_in('contests_users.role',$role);
				$db2->limit(1);
				$query = $db2->get();	
				
					if ($query->num_rows() == 1){ // jika data = 1 
					return 'password'; // menyatakan password salah
					}
			}
        }
}