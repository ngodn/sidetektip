<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mclustersnew extends CI_Model {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function clustersNew($simTable=array()) {
        $clustersNew=array();
        foreach($simTable as $doc => $val) {
            $temp=0;
            $clus='';
            foreach($val as $C => $dist) {
                if($dist>$temp) {
                    $temp=$dist;
                    $clus=$C;
                }
            }
            $clustersNew[$clus][]=$doc;
        }
        return $clustersNew;
    }
}
?>
