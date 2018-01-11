<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mcosinesimilarity extends CI_Model {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function cosineSimilarity($doc=array(), $cent=array()) {
        //cosine(d,c)= d.c / ||d|| ||c||
        $numerator=$this->dotProduct($doc, $cent);
        
        $denominator=$this->vectorLength($doc)*$this->vectorLength($cent);
        
        return $numerator/$denominator;
    }
    
    private function dotProduct($doc=array(), $cent=array()) {
        //d.c = [a,b,c].[d,e,f] = ad + be + cf
        $dotProduct=0;
        foreach($doc as $key => $val) {
            $dotProduct+=($doc[$key]*$cent[$key]);
        }
        return $dotProduct;
    }
    
    private function vectorLength($doc=array()) {
        //||d|| = [a,b,c] = sqrt(a^2+b^2+c^2)
        $vectorLenght=0;
        foreach($doc as $key => $val) {
            $vectorLenght += $val*$val;
        }
        return sqrt($vectorLenght);
    }
}
?>