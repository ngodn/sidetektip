<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mxmlparsing extends CI_Model {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function createXMLParsing($arrayMap=array(), $arrayNGram=array(), $assignment='') {
        $doc = new DOMDocument('1.0');
        
        $doc->formatOutput = true;
        $result = $doc->createElement('result');
        $result = $doc->appendChild($result);
        
        foreach($arrayMap as $key => $val){
            $root = $doc->createElement('doc');
            $root = $result->appendChild($root);

            $nim = $doc->createElement('nim');
            $nim = $root->appendChild($nim);
            $nt = $doc->createTextNode($key);
            $nt = $nim->appendChild($nt);

            $sequence = $doc->createElement('sequence');
            $sequence = $root->appendChild($sequence);
            $st = $doc->createTextNode($val);
            $st = $sequence->appendChild($st);

            $term = $doc->createElement('term');
            $term = $root->appendChild($term);
            $tt = $doc->createTextNode($arrayNGram[$key]);
            $tt = $term->appendChild($tt);
        }

        $doc->save("xml/parsing/".$assignment.".xml");
        $XMLParsingPath = "xml/parsing/".$assignment.".xml";
        return $XMLParsingPath;
    }
    
    public function readXMLParsing($path='') {
        $g=fopen($path, 'r') or die ("can't open file");
        $f=file_get_contents($path);
        
        $dom=new DOMDocument;
        $dom->loadXML($f);
        //hapus whitespace
        $dom->preserveWhiteSpace=false;
        $tab=$dom->getElementsByTagName('doc');
        
        foreach($tab as $dc) {
            $nim1=$dc->getElementsByTagName('nim');
            $term1=$dc->getElementsByTagName('term');
            
            $nim=$nim1->item(0)->nodeValue;
            $term=$term1->item(0)->nodeValue;
            $doc[$nim]=$term;
        }
        return $doc;
    }
}
?>
