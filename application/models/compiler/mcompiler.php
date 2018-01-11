<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mcompiler extends CI_Model {
    
    public function __construct() {
        parent::__construct();
	}
    
    public function compile($username='', $problem='') {
		$out='compiler\exes\\'.$problem.'\\'.$username;
        $in= 'data\\'.$username.'\\'.$problem.'.c';
        $cmd='gcc -o '.$out.' '.$in;
        shell_exec($cmd);
	}
    
    public function run($username='', $problem='', $input='', $dir='', $id_token='', $data) {
		$in= $dir.'\\'.$id_token.'\\evaluator\files\\'.$data[$input*2-1];
        $out='compiler\outs\\'.$problem.'\\'.$input.'\\'.$username.'.tmp';
		$cmd='timeout 2s compiler\exes\\'.$problem.'\\'.$username.'.exe < '.$in.' > '.$out;
		shell_exec($cmd);
    }
    
    public function checkOut($outPath='', $keyPath='') {
        $out=$this->readOut($outPath);
        $key=$this->readOut($keyPath);
        if($out==$key)
            return '1';
        else
            return '0';
    }
    
    private function readOut($path='') {
        $ff=@fopen($path, 'r');
        
        if($ff==FALSE) {
            return 'fileError';
        } else {
            $arrayLine=file($path);
            $arrayTerm=array();
            while(list($row,$line)=each($arrayLine)){
                $line=trim($line);
                
                $tempTerm=array();
                $tempTerm=preg_split('/\s+/', $line);
                
                $arrayTermPerLine=array();
                foreach($tempTerm as $term) {
                    if($term!='') {
                        $arrayTermPerLine[]=$term;
                    }
                }
                $arrayTerm=array_merge($arrayTerm, $arrayTermPerLine);
            }
            return $arrayTerm;
        }
    }
}
?>
