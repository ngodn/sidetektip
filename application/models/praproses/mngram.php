<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mngram extends CI_Model {
    
    var $N;
    
    public function __construct() {
        parent::__construct();
        
        $GLOBALS['N']=4; //nilai N pada N-Gram
    }
    
    public function NGram($arrayMap=array()) {
        $length=count($arrayMap);
        $iter=($length-$GLOBALS['N'])+1;
        
        $arrayGram=array();
        //gram pertama
        if($GLOBALS['N']>1) {
            $gram='_';
            for($j=0;$j<$GLOBALS['N']-1;$j++) {
                $gram.=$arrayMap[$j];
            }
            $arrayGram[]=$gram;
        }
        
        //gram tengah
        for($i=0;$i<$iter;$i++) {
            $gram='';
            for($j=0;$j<$GLOBALS['N'];$j++) {
                $gram=$gram.$arrayMap[$i+$j];
            }
            $arrayGram[]=$gram;
        }
        
        //gram terakhir
        if($GLOBALS['N']>1) {
            $gram='';
            for($j=0;$j<$GLOBALS['N']-1;$j++) {
                $gram=$gram.$arrayMap[$iter+$j];
            }
            $arrayGram[]=$gram.'_';
        }
        
        return $arrayGram;
    }
}
?>
