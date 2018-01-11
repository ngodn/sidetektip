<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class cLogin extends CI_Controller
{
       function __construct()
 		{
			session_start();
			parent::__construct();
 		} 
  
        public function index()
        {
			  if ( isset($_SESSION['username']) ) { //cek apakah session ada
                 redirect('cmain'); //redirect controller c_home
              } 
              $this->load->library('form_validation'); //load library form_validation
			         $this->form_validation->set_rules('username', 'Username', 'required'); //cek, validasi username
              $this->form_validation->set_rules('password', 'Password', 'required'); //cek, validasi password
              $hasil = array('hasil'=>'');
			  if ( $this->form_validation->run() == TRUE ) { //apabila validasi true(benar semua)
                 $this->load->model('database/muser'); // load model m_user
                 $result = $this->muser->cek_user_login( //jalankan fungsi cek_user_login dari model m_user
                             $this->input->post('username'), //menangkap username dari form
                             $this->input->post('password') //menangkap password dari form
                          );
                  
                             
                        if ( $result == 'benar') { //apabila result = true(ada data)
								$_SESSION['username'] = $this->input->post('username'); //create session
                                redirect('cmain'); // redirect controller cmain
                         }
						else if ( $result == 'password') 
						{
             $hasil= array('hasil' => 'password');  //menyatakan password salah
            }
						else
						{
							$hasil= array('hasil' => 'username');	//menyatakan username tidak terdata
						}
          }  
               
			   	
				$this->load->view('vForm',$hasil); 
        }
         
        public function logout() //fungsi logout
        {
             session_destroy(); //session destroy
             $this->index();//redirect function index()
        }
}