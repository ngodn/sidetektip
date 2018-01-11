<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mclustering extends CI_Model {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function metode_clustering($termFreqTable=array(), $method='', $assignment='', $i='', $k='', $path='') {
/*CLUSTER:bisectkmeans START*/
			if($method=='bisecting_kmeans') {
				//bisect k-means start. input: tabel term frequency
				$this->load->model('clustering/bisectkmeans/mbisectkmeans');
				$clusters =
						$this->mbisectkmeans->bisectKMeans($termFreqTable, $i); //mengambil hasil cluster dari metode bisecting kMeans
			} 
/*CLUSTER:bisectkmeans START*/			
			else if($method=='kmeans') {
				$this->load->model('clustering/kmeans/mkmeans');
				if($k!=""){
				 $mode = "manual";
					list($result,$cent,$prev) = $this->mkmeans->kMeans($path,$k,$mode); //mengambil hasil cluster dari metode kMeans
				}else{
				$mode = "auto";
					$result = $this->mkmeans->autoClustering($path,$mode); //mengambil hasil cluster dari metode kMeans tanpa memberi inputan k
                }
				$a=0;
				foreach($result as $key1=>$key2){
					$b=0;
					foreach($key2 as $key3 => $val){
						$clusters[$a][$b] = $key3 ;
						$b++;
					}
				$a++;
				}
			}
			else if($method=='single_linkage'){
				$this->load->model('clustering/agglomerative/msinglelink');
				$clusters = $this->msinglelink->singleLink($termFreqTable,$i);	
			}
			else if($method=='complete_linkage'){
				$this->load->model('clustering/agglomerative/completelink');
				$clusters = $this->completelink->singleLink($termFreqTable,$i);
			}      
			else if($method=='average_linkage'){
				$this->load->model('clustering/agglomerative/averagelink');
				$clusters= $this->averagelink->singleLink($termFreqTable,$i);
			}   
/*CLUSTERING NEW*/	
		
			$numClusters=count($clusters);
			return array($clusters, $numClusters);
			
    }
}
?>