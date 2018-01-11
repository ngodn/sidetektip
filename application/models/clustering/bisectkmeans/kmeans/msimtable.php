<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Msimtable extends CI_Model {
    
    public function __construct() {
        parent::__construct();
        
        $this->load->model('clustering/bisectkmeans/kmeans/mcosinesimilarity');
    }
    
    public function simTable($centroids=array(), $set=array()) {
        $simTable=array();
        foreach($centroids as $centKey => $centVal) {
            foreach($set as $docKey => $docVal) {
                $simTable[$docKey][]=
                    $this->mcosinesimilarity->cosineSimilarity($docVal, $centVal);
            }
        }
        return $simTable;
    }
}
?>
