<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mprosescluster extends CI_Model {
    
    public function __construct() {
        parent::__construct();
		 $this->load->model('praproses/mpraproses');
		 $this->load->model('clustering/mclustering');
    }	
    
	public function clustering($contest, $problem, $method, $i, $k, $file){ //proses metode clustering
		//praproses start (in: assignment, directory)
		list($termFreqTable, $numSubmitter)=
				$this->mpraproses->praproses($contest,$problem,$file);
				
		$path = 'xml/parsing/'.$problem.'.xml';
		
		//praproses end (out: tabel term frequency)
		if($numSubmitter > 1){
		//clustering start (in: tabel term freq, method, assignment)
		list($clusters, $numClusters)=
				$this->mclustering->metode_clustering($termFreqTable, $method, $problem, $i, $k, $path);
		}
		else if($numSubmitter = 1){
			foreach ($file as $id=>$kode){
				$id_peserta = $id;	
			}
			$clusters = array(array($id_peserta));
		}
		return $clusters;
		
	}

}   
?>