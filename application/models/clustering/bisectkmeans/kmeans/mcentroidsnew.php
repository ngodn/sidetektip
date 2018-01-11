<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mcentroidsnew extends CI_Model {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function centroidsNew($cluster=array(), $set=array()) {
        $newCentroids=array();
        foreach($cluster as $C => $docs) {
            $temp=array();
            foreach($docs as $doc) {
                $temp[$doc]=$set[$doc];
            }
            $newCentroids[$C]=$this->means($temp);
        }
        return($newCentroids);
    }
    
    private function means($temp=array()) {
        $tempInv=array();
        foreach($temp as $doc => $terms) {
            foreach($terms as $term => $tf) {
                $tempInv[$term][$doc]=$tf;
            }
        }
        $means=array();
        foreach($tempInv as $term => $docs) {
            $n=0;
            $sum=0;
            foreach($docs as $doc => $tf) {
                $n++;
                $sum+=$tempInv[$term][$doc];
            }
            $means[$term]=$sum/$n;
        }
        return $means;
    }
}
?>
