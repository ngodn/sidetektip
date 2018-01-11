<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mpraproses extends CI_Model {
    
    public function __construct() {
        parent::__construct();
       
        $this->load->model('praproses/mparsing');
        $this->load->model('praproses/mmapping');
        $this->load->model('praproses/mngram');
        $this->load->model('xml/mxmlparsing');
        $this->load->model('praproses/mtermfreq');
    }
    
    public function praproses($contest_id='',$problem_id='',$file='') {
        
        //membaca setiap file assignment yg dipilih
        $numSubmitter = 0;
		$arrayMap=array();
        $arrayNGram=array();

        //foreach($username as usr)
        foreach($file as $username => $kode ) {
                $path=$kode; //kode program disimpan dalam variabel path
				$username_submitter = $username;

                //hilangkan whitespace, preprocessor directive, comment, pisah keyword, tokenisasi
                $parsingResult=$this->mparsing->parsing($path);
			
                if($parsingResult!='fileError') {
					$numSubmitter++;

                    //konversi keyword -> symbol
                    $mappingResult=$this->mmapping->mapping($parsingResult);

                    //NGram
                    $NGramResult=$this->mngram->NGram($mappingResult);

                    //buat string untuk disimpan ke XML
                    $docName=$username_submitter;
                    
                    list($arrayMap, $arrayNGram)=
                        $this->createStrings($docName, $arrayMap, $arrayNGram, $mappingResult, $NGramResult);
                }
			
            }
        
        //simpan ke XML
        $XMLParsingPath=
            $this->mxmlparsing->createXMLParsing($arrayMap, $arrayNGram, $problem_id);
        
        //baca file XML
        $termParsing=$this->mxmlparsing->readXMLParsing($XMLParsingPath);
        
        //buat tabel term frequency
        $termFreqTable=$this->mtermfreq->termFreq($termParsing);
        
        return array($termFreqTable, $numSubmitter);
    }
    
    private function createStrings($submitter_id='', $arrayMap=array(), $arrayNGram=array(), $mappingResult=array(), $NGramResult=array()) {
        $strMap='';
        foreach($mappingResult as $map) {
            $strMap.=$map;
        }
        $arrayMap[$submitter_id]=$strMap;

        $strNGram='';
        foreach($NGramResult as $NGram) {
            $strNGram.=$NGram.' ';
        }
        $arrayNGram[$submitter_id]=$strNGram;
        
        return array($arrayMap, $arrayNGram);
    }
}

?>
