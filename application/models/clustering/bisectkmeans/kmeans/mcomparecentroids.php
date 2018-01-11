<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mcomparecentroids extends CI_Model {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function compareCentroids($centroidsNew=array(), $centroidsOld=array()) {
        $centroidsNew=array_values($centroidsNew);
        $centroidsOld=array_values($centroidsOld);
        
        if($centroidsNew==$centroidsOld)
            return TRUE;
        else
            return FALSE;
    }
}
?>
