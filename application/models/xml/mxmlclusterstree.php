<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mxmlclusterstree extends CI_Model {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function createXMLClustersTree($clustersTree=array(), $ITree=array(), $assignment='') {
        $doc=new DOMDocument('1.0');
        
        $doc->formatOutput = true;
        $result=$doc->createElement('result');
        $result=$doc->appendChild($result);
        
        foreach($clustersTree as $iter=>$clusters) {
            $iteration=$doc->createElement('iteration');
            $iteration=$result->appendChild($iteration);
            
            $iNum=$doc->createElement('number');
            $iNum=$iteration->appendChild($iNum);
            $inm=$doc->createTextNode($iter);
            $inm=$iNum->appendChild($inm);
            
            $iAvg=$doc->createElement('average');
            $iAvg=$iteration->appendChild($iAvg);
            $iag=$doc->createTextNode($ITree[$iter]);
            $iag=$iAvg->appendChild($iag);
            
            $iClus=$doc->createElement('clusters');
            $iClus=$iteration->appendChild($iClus);
            
            foreach($clusters as $C=>$docs) {
                $cluster=$doc->createElement('cluster');
                $cluster=$iClus->appendChild($cluster);

                $cName=$doc->createElement('name');
                $cName=$cluster->appendChild($cName);
                $cnm=$doc->createTextNode($C);
                $cnm=$cName->appendChild($cnm);

                $member=$doc->createElement('member');
                $member=$cluster->appendChild($member);

                foreach($docs as $doc_) {
                    $dc=$doc->createElement('doc');
                    $dc=$member->appendChild($dc);
                    $d=$doc->createTextNode($doc_);
                    $d=$dc->appendChild($d);
                }
            }
        }
        $doc->save("xml/clusters_tree/".$assignment.".xml");
        $XMLClustersTreePath = "xml/clusters_tree/".$assignment.".xml";
        return $XMLClustersTreePath;
    }
}
?>
