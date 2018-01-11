<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mx extends CI_Model {
    
    public function __construct() {
        parent::__construct();    
    }
    
    public function calculateX($kmeansResult=array(), $simtable=array()) {
        $cosines=array();
        foreach($kmeansResult as $C => $docs) {
            foreach($docs as $doc) {
                $cosines[$C][$doc]=$simtable[$doc][$C];
            }
        }
        
        $x=array();
        foreach($cosines as $C => $docs) {
            $sum=0;
            foreach($docs as $cosine) {
                $sum+=$cosine;
            }
            $x[$C]=$sum/count($docs);
        }
        return $x;
    }
}
?>
