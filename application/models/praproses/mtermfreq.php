<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mtermfreq extends CI_Model {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function termFreq($termParsing=array()) {
        $termFreqTable=array();
        $allTerm=array();
        //per doc
        foreach($termParsing as $nim => $strTerm) {
            $strTerm=trim($strTerm);            
            //pisah tiap term
            $arrayTerm=preg_split('/\s+/', $strTerm);
            
            //cek satu2 term dalam doc, setiap ketemu tambah 1
            foreach($arrayTerm as $term) {
                if(isset($termFreqTable[$nim][$term])) {
                    $termFreqTable[$nim][$term]+=1;
                } else {
                    $termFreqTable[$nim][$term]=1;
                    if(array_search($term,$allTerm)==FALSE) {
                        $allTerm[]=$term;
                    }
                }
            }
        }
        //term yg tidak ada pada doc diberi nilai 0
        $allNim=array_keys($termParsing);
        foreach($allNim as $nim) {
            foreach($allTerm as $term) {
                if(!isset($termFreqTable[$nim][$term])) {
                    $termFreqTable[$nim][$term]=0;
                }
            }
        }
        return $termFreqTable;
    }
}