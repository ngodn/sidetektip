<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mfirstcentroids extends CI_Model {
    
    var $randomSeed;
    
    public function __construct() {
        parent::__construct();
        
        $this->load->model('clustering/bisectkmeans/kmeans/mcosinesimilarity');
        
        $GLOBALS['randomSeed']=NULL;
    }
    
    public function firstCentroids($set=array(), $K=1) {
        $centroids=array();
        
        if($GLOBALS['randomSeed']!=NULL)
            srand($GLOBALS['randomSeed']);
        
        $firstCentKey=array_rand($set);
        $centroids[$firstCentKey]=$set[$firstCentKey];
        
        $temp=array();
        foreach($set as $docKey=>$docVal) {
            $temp[$docKey]=
            $this->mcosinesimilarity->cosineSimilarity($docVal, $set[$firstCentKey]);
        }
        
        for($i=2;$i<=$K;$i++) {
            $least=1.1;
            foreach($temp as $doc=>$dist) {
                if($dist<$least) {
                    $least=$dist;
                    $nextCentKey=$doc;
                }
            }
            $centroids[$nextCentKey]=$set[$nextCentKey];
            unset($temp[$doc]);
        }
        return $centroids;
    }
}
?>
