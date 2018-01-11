<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mparsing extends CI_Model {
    
    var $commFlag;
    
    public function __construct() {
        parent::__construct();
    }
    
	//public function parsing($file){
    public function parsing($path) {

        if($path==FALSE) {
            return 'fileError';
        } else {
            $arrayLine=array($path);
            $arrayTerm=array();
            $GLOBALS['commFlag']=FALSE;
            while(list($row,$line) = each($arrayLine)){
                //hilangkan whitespace di awal dan akhir line
                $line=trim($line);
                
                //hilangkan preprocessor directive
                $line=$this->removePreDirect($line);
                
                //hilangkan comment
                $line=$this->removeComment($line);
                
                //pisah operator, bracket, tanda baca, dll, dgn spasi
                $line=$this->pisahKeyword($line);
                
                //jadikan lowercase
                $line=strtolower($line);
                
                //tokenisasi
                $arrayTerm=array_merge($arrayTerm, $this->tokenisasi($line));
            }
            return $arrayTerm;
        }
    }
    
    private function removePreDirect($line='') {
        $line=preg_replace('/^#.*/', '', $line);
        return $line;
    }
    
    private function removeComment($line='') {
        //untuk comment tipe '//'
        $line=preg_replace('/\/\/.*/', '', $line);
        
        //untuk comment tipe '/*...*/'
        $line=preg_replace('/(\/\*).*(\*\/)/', '', $line);
        
        //untuk comment tipe '/*...' dan '...*/'
        $pattern1='/(\/\*).*/';
        $pattern2='/.*(\*\/)/';
        if($GLOBALS['commFlag']==FALSE) {
            if(preg_match($pattern1, $line)) {
                $line=preg_replace($pattern1, '', $line);
                $GLOBALS['commFlag']=TRUE;
            }
        } else {
            if(preg_match($pattern2, $line)) {
                $line=preg_replace($pattern2, '', $line);
                $GLOBALS['commFlag']=FALSE;
            } else {
                $line='';
            }
        }
        return $line;
    }
    
    private function pisahKeyword($line='') {
        //syntax dipisahkan dgn spasi di depan dan belakang
        $pattern='/([|:&!%(){},;=<>+-\/\*\.])/';
        $replace=' $1 ';
        $line=preg_replace($pattern, $replace, $line);
        
        //string dijadikan symbol '@'
        $patternStr='/([\"].*[\"])/';
        $replaceStr='@';
        $line=preg_replace($patternStr, $replaceStr, $line);
        
        //hilangkan ';'
        $line=preg_replace('/;/', '', $line);
        
        return $line;
    }
    
    private function tokenisasi($line='') {
        //potong2 line per spasi
        $tempTerm=preg_split('/\s+/', $line);
        
        //cek jika null abaikan
        $arrayTermPerLine=array();
        foreach($tempTerm as $term) {
            if($term!='') {
                $arrayTermPerLine[]=$term;
            }
        }
        return $arrayTermPerLine;
    }
}

?>
