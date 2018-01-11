<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mbisectkmeans extends CI_Model {
    
    var $ITER;
    
    public function __construct() {
        parent::__construct();
        
        $this->load->model('clustering/bisectkmeans/kmeans/mkmeans');
        $this->load->model('clustering/bisectkmeans/mx');
        
        $GLOBALS['ITER']=5;
    }

    public function bisectKMeans($termFreqTable=array(), $iParam=1) {
        $clusters=array();      $x=array(0);        $centroids=array(0);
        $clustersTree=array();  $ITree=array();
        $stopList=array();      $iterasi=1;
        
        //1. seluruh dokumen dijadikan 1 cluster awal
        foreach($termFreqTable as $doc => $terms)
            $clusters[0][]=$doc;
        
        //periksa, jika hanya ada 1 dokumen maka tidak perlu di-kmeans
        $numDocs=count($termFreqTable);
        if($numDocs<=1) {
            return $clusters;
        } else {
            do {
                //echo $iterasi.'<br>';
                //2. pilih cluster dgn anggota terbanyak & tdk ada dalam stop list
                $clusChosen=0; $temp=0;
                foreach($clusters as $C => $docs) {
                    $d=count($docs);
                    if($d>$temp && !in_array($C, $stopList)) {
                        $clusChosen=$C;
                        $temp=$d;
                    }
                }
                //cek apakah cluster yg dipilih anggotanya sudah homogen
                if(abs(1-$x[$clusChosen])<0.00001) {
                    //jika iya masukkan ke dalam stop list
                    $stopList[]=$clusChosen;
                } else {
                    //persiapkan term freq dokumen2 yg akan dipisah
                    $docsChosen=$clusters[$clusChosen];
                
                    $set=array();
                    foreach($docsChosen as $doc)
                        $set[$doc]=$termFreqTable[$doc];

                    //3. bagi jadi 2 cluster dgn menggunakan k-means sebanyak ITER kali
                    $clusNewTemp=array(); $xNewTemp=array(); $tNewTemp=array();
                    for($t=1;$t<=$GLOBALS['ITER'];$t++) {
                        list($kmeansResult,$simtable,$centsNew)=$this->mkmeans->KMeans($set, 2);

                        $xNew=$this->mx->calculateX($kmeansResult, $simtable);
                        $tNew=array_sum($xNew)/count($kmeansResult);

                        $clusNewTemp[$t]=$kmeansResult;
                        $xNewTemp[$t]=$xNew;
                        $tNewTemp[$t]=$tNew;
                        $centsNewTemp[$t]=$centsNew;
                    }
                    //print_r($clusNewTemp); echo '<br>';
                    //print_r($xNewTemp); echo '<br>';
                    //print_r($iNewTemp); echo '<br>';

                    //lalu pilih hasil pemisahan cluster yg terbaik
                    $tChosen=0; $max=0;
                    foreach($tNewTemp as $t=>$tNew) {
                        if($tNew>$max) {
                            $max=$tNew;
                            $tChosen=$t;
                        }
                    }
                    //echo $tChosen.'<br>';
                    $kmeansResult=$clusNewTemp[$tChosen];
                    $newXs=$xNewTemp[$tChosen];
                    $newCents=$centsNewTemp[$tChosen];
                    //print_r($kmeansResult); echo '<br>';

                    //hapus cluster yg di-kmeans & tambahkan 2 cluster baru hasil kmeans
                    unset($clusters[$clusChosen]);
                    foreach($kmeansResult as $docs)
                        $clusters[]=$docs;

                    unset($x[$clusChosen]);
                    foreach($newXs as $newX)
                        $x[]=$newX;
                    
                    unset($centroids[$clusChosen]);
                    foreach($newCents as $newCent)
                        $centroids[]=$newCent;

                    $numClus=count($clusters);
                    $I=array_sum($x)/$numClus;

                    //$clusters=array_values($clusters);
                    //$x=array_values($x);

                    //print_r($clusters); echo '-clus<br>';
                    //print_r($x); echo'<br>';
                    //echo 'Clusts: '.$numClus.'<br>';
                    
                    $clustersTree[$iterasi]=$clusters;
                    $ITree[$iterasi]=$I;
                    $iterasi++;
                    
                    //4. apabila I<=i ulangi langkah 2 & 3
                }
                //print_r($stopList); echo '-stop<br>';
                //echo count($clusters).':'.count($stopList).'<br>';
            } while($I<$iParam && $numClus>count($stopList));
            return $clusters;
        }
    }
}
?>
