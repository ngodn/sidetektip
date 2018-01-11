<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Completelink extends CI_Model {

    public function __construct() {
        parent::__construct();

        $this->load->model('clustering/agglomerative/similiarity/msimtable');
        $this->load->model('clustering/agglomerative/similiarity/singlelinkagglo');
    }

    public function singleLink($termFreqTable,$iParam) {
		ini_set('memory_limit', '256M');
        $simTable = $this->msimtable->simTable($termFreqTable, $termFreqTable);
        $arraySim = array();
        $kelompok = array();
        $nilai = array();
        $clustersTree = array();
        $ITree = array();
        $nrp = array();
        $i = 0;
        foreach ($simTable as $key => $baris){
            $arraySim[] = $baris;
            $nrp[] = $key;
            $kelompok[] = $i++;
        }
        //print_r($nrp);
        $maxDoc = count($kelompok);
        $nilaiI = 1;
        $anggotaCluster = array();
        $nilaiTotal = array();
        $flag = array();
        for ($i = 0; $i < ($maxDoc); $i++){
            $nilaiTotal[$i] = 1;
            $anggotaCluster[$i] = 1;
        }
        $loop = 0;
        do{
            $maxSim = 0;
            $d1 = -1;
            $d2 = -1;
            for ($i = 0; $i < ($maxDoc-1); $i++){
                for ($j = $i+1; $j < $maxDoc; $j++){
                    if ($arraySim[$i][$j] > $maxSim){
                        $maxSim = $arraySim[$i][$j];
                        $d1 = $i;
                        $d2 = $j;
                    }
                }
            }
            $a = $maxSim;
            if ($d1 != -1){
                //echo "Loop Ke # $loop : Kelompok dokumen terdekat adalah ".$kelompok[$d1]." dan ".$kelompok[$d2]." dengan similaritas = ".$arraySim[$d1][$d2]."</br>";
                
                for ($i = 0; $i < $maxDoc; $i++){
                    if (($kelompok[$i] != $kelompok[$d1]) or ($kelompok[$i] != $kelompok[$d2])){
                        for ($j = 0; $j < $maxDoc; $j++){
                            if (($kelompok[$j] == $kelompok[$d1]) or ($kelompok[$j] == $kelompok[$d2])){
                                if ($arraySim[$i][$d1] < $arraySim[$i][$d2]){
                                    $arraySim[$i][$j] = $arraySim[$i][$d1];
                                    $arraySim[$j][$i] = $arraySim[$i][$j];
                                
                                }
                                else{
                                    $arraySim[$i][$j] = $arraySim[$i][$d2];
                                    $arraySim[$j][$i] = $arraySim[$i][$j];
                                    //echo "Tes $i $j\n";
                                }
                            }
                        }
                    }
                }
                $kel1 = $kelompok[$d1];
                $kel2 = $kelompok[$d2];
                
                        for ($i = 0; $i < $maxDoc; $i++){
                            if (($kelompok[$i] == $kel1) or ($kelompok[$i] == $kel2)){
                                for ($j = 0; $j < $maxDoc; $j++){
                                    if (($kelompok[$j] == $kel1) or ($kelompok[$j] == $kel2)){                                        
                                        $kelompok[$j] = $kel2;
					$arraySim[$i][$j] = 0;
					$arraySim[$j][$i] = 0;
                                    }
                                }
                            }
			}
                 if ($anggotaCluster[$kel1] > $anggotaCluster[$kel2]){
                    $nilaiTotal[$kel1] *= $a;
                    $nilaiTotal[$kel2] = $nilaiTotal[$kel1];
                    $anggotaCluster[$kel1] += $anggotaCluster[$kel2];
                    $anggotaCluster[$kel2] = $anggotaCluster[$kel1];
                 }
                 else{
                    $nilaiTotal[$kel2] *= $a;
                    $nilaiTotal[$kel1] = $nilaiTotal[$kel2];
                    $anggotaCluster[$kel2] += $anggotaCluster[$kel1];
                    $anggotaCluster[$kel1] = $anggotaCluster[$kel2];
                 }
            }
            for ($z = 0; $z < $maxDoc; $z++){
                $flag[$z] = false;
            }
            $total = 0;
            $count = 0;
            for ($z = 0; $z < $maxDoc; $z++){
                if ($flag[$kelompok[$z]] == false){
                    $flag[$kelompok[$z]] = true;
                    $total += $nilaiTotal[$kelompok[$z]];
                    $count++;
                    //$nilaiI += $nilaiTotal[$kelompok[$z]]/$anggotaCluster[$kelompok[$z]];
                }
            }
            $nilaiI = $total/$count;
            //echo "Nilai I : ".$nilaiI."</br>";     
           
            $flag2 = array();
            $indeks = array();
            $ind = 0;
            $clusters = array();
            for ($z = 0; $z < $maxDoc; $z++){
                $flag2[$z] = false;
            }
            for ($z = 0; $z < $maxDoc; $z++){
                if ($flag2[$kelompok[$z]] == false){
                    $flag2[$kelompok[$z]] = true;
                    $indeks[$kelompok[$z]] = $ind;
                    $clusters[$ind] = array();
                    $clusters[$ind][] = $nrp[$z];
                    $ind++;
                }
                else{
                    $clusters[$indeks[$kelompok[$z]]][] = $nrp[$z];
                }
            }
            $clustersTree[$loop] = $clusters;
            $ITree[$loop] = $nilaiI;
            $loop++;
            
        } while ($nilaiI > $iParam && $loop < 100000);
        
        //print_r($clusters);
        return $clusters;
    }

}

?>
