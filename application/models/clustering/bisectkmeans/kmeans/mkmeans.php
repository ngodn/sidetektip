<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mkmeans extends CI_Model {
    
    var $maxIter;
    
    public function __construct() {
        
        parent::__construct();
        
        $GLOBALS['maxIter']=5; //makasimal iterasi k-means
        
        $this->load->model('clustering/bisectkmeans/kmeans/mfirstcentroids');
        $this->load->model('clustering/bisectkmeans/kmeans/msimtable');
        $this->load->model('clustering/bisectkmeans/kmeans/mclustersnew');
        $this->load->model('clustering/bisectkmeans/kmeans/mcentroidsnew');
        $this->load->model('clustering/bisectkmeans/kmeans/mcomparecentroids');
    }
    
    public function kmeans($set=array(), $K=1) {
        $iter=0;
        $same=FALSE;
        
        //1. pilih centroid awal: 1 random, sisanya cari jarak yg terjauh
        $centroids=$this->mfirstcentroids->firstCentroids($set, $K);
        
        do {
            $iter++;
            //echo $iter.'<br>';
            //2. hitung jarak kemiripan setiap document ke centroid
            $simTable=$this->msimtable->simTable($centroids, $set);
            //print_r($simTable); echo '<br>';

            //3. masukkan setiap dokumen ke cluster yg jarak centroid-nya terdekat
            $clustersNew=$this->mclustersnew->clustersNew($simTable);
            //print_r($clustersNew); echo '<br>';

            //4. hitung centroid baru
            $centroidsNew=$this->mcentroidsnew->centroidsNew($clustersNew, $set);
            //print_r($centroidsNew); echo '<br>';

            //5. cek apakah nilai centroid yg baru sama dgn centroid sebelumnya,
            //   jika berbeda ulangi langkah 2, 3, 4.
            if($iter>1)
                $same=$this->mcomparecentroids->compareCentroids($centroidsNew, $centroids);
                
            if($iter==1 || $same==FALSE) {
                $stop=FALSE;
                $centroids=$centroidsNew;
                $clustersOld=$clustersNew;
            } else
                $stop=TRUE;
        //echo '<br>';    
        } while($iter<$GLOBALS['maxIter'] && $stop==FALSE);
        
        return array($clustersNew, $simTable, $centroidsNew);
    }
}
?>
