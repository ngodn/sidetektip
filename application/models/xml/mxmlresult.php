<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mxmlresult extends CI_Model {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function createXMLResult($clusters=array(), $assignment='', $centroids) {
        $doc=new DOMDocument('1.0');
        
        $doc->formatOutput = true;
        $result=$doc->createElement('result');
        $result=$doc->appendChild($result);
        
        foreach($clusters as $C => $docs) {
            $cluster=$doc->createElement('cluster');
            $cluster=$result->appendChild($cluster);
            
            $cName=$doc->createElement('name');
            $cName=$cluster->appendChild($cName);
            $cnm=$doc->createTextNode($C);
            $cnm=$cName->appendChild($cnm);
            
            $cCentroid=$doc->createElement('centroid');
            $cCentroid=$cluster->appendChild($cCentroid);
            foreach($centroids[$C] as $term=>$val) {
                $tm=$doc->createElement('term');
                $tm=$cCentroid->appendChild($tm);
                $t=$doc->createTextNode($term.':'.$val);
                $t=$tm->appendChild($t);
            }
            
            $member=$doc->createElement('member');
            $member=$cluster->appendChild($member);
            foreach($docs as $doc_) {
                $dc=$doc->createElement('doc');
                $dc=$member->appendChild($dc);
                $d=$doc->createTextNode($doc_);
                $d=$dc->appendChild($d);
            }
        }
        $doc->save("xml/result/".$assignment.".xml");
        $XMLResultPath = "xml/result/".$assignment.".xml";
        return $XMLResultPath;
    }
    
    //hanya clusters tanpa centroids
    public function readXMLResult($path='') {
        $result=array();
        
        $g=@fopen($path, 'r');
        if(!$g)
            return 'file_not_found';
        
        $f=file_get_contents($path);
        
        $dom=new DOMDocument;
        $dom->loadXML($f);
        //hapus whitespace
        $dom->preserveWhiteSpace=false;
        $tab=$dom->getElementsByTagName('cluster');
        
        foreach($tab as $clus) {
            $cName=$clus->getElementsByTagName('name');
            $member=$clus->getElementsByTagName('member');
            
            $cnm=$cName->item(0)->nodeValue;
            
            foreach($member as $mb) {
                $docs=$mb->getElementsByTagName('doc');
                $i=0;
                foreach($docs as $doc_) {
                    $d=$docs->item($i)->nodeValue;
                    $result[$d]=$cnm;
                    $i++;
                }
            }
        }
        return $result;
    }
    
    //hanya centroids
    public function readXMLResultCentroids($path='') {
        $result=array();
        
        $g=@fopen($path, 'r');
        if(!$g)
            return 'file_not_found';
        
        $f=file_get_contents($path);
        
        $dom=new DOMDocument;
        $dom->loadXML($f);
        //hapus whitespace
        $dom->preserveWhiteSpace=false;
        $tab=$dom->getElementsByTagName('cluster');
        
        foreach($tab as $clus) {
            $cName=$clus->getElementsByTagName('name');
            $centroid=$clus->getElementsByTagName('centroid');
            
            $cnm=$cName->item(0)->nodeValue;
            
            foreach($centroid as $cent) {
                $terms=$cent->getElementsByTagName('term');
                $i=0;
                foreach($terms as $term) {
                    $tm=$terms->item($i)->nodeValue;
                    $t=preg_split('/\:/', $tm);
                    $result[$cnm][$t[0]]=$t[1];
                    $i++;
                }
            }
        }
        return $result;
    }
}
?>
