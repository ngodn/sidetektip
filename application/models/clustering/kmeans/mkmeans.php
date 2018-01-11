<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of mKMeans
 *
 * @author Michael Jackson
 */
class mKMeans extends CI_Model{
    var $maxCluster;
    var $centroid;
    var $prevC;
    var $result;
    var $chsn;

    public function __construct() {
        parent::__construct();
    }

//setter getter
    function setMaxCluster($maxCluster=1){
        $this->maxCluster = $maxCluster;
    }
    function getMaxCluster(){
        return $this->maxCluster;
    }
    function setCentroid($centroid){
        $this->centroid = $centroid;
    }
    function getCentroid(){
        return $this->centroid;
    }
    function setPrevC($prevC){
        $this->prevC = $prevC;
    }
    function getPrevC(){
        return $this->prevC;
    }
    function setResult($result){
        $this->result = $result;
    }
    function getResult(){
        return $this->result;
    }
    function setPrevChsnCent($c){
       
        $this->chsn[]=$c;
    }
    function getPrevChsnCent(){
        $q=0;
        foreach($this->chsn as $i=>$nim){         
        $q++;
        }

        //var_dump($this->chsn);
        $q--;
        $chsn = $this->chsn[$q];
        //echo "chsn = $chsn<br>";
        return $chsn;
    }
	
	 function tokenisasiXML($path=''){ //path hasil parsing pertama
        /*
         * funsi untuk membaca dan mengekstrak file xml yang telah dibuat dengan format tertentu
         */
        //$path = 'xml/parsing_pjj0101.xml';
        $read =$this->readXMLFile1($path); //array $doc[$nim] = $term

        $arrayline= array();
        $freq=array();
        $nimDterm = array();

        foreach($read as $nimL => $termL){

            $termL = trim($termL);
            $termL = preg_replace("/^\s*/","",$termL); //buang white space di depan
            $termL = preg_replace("/\s*$/","",$termL); //buang white space di belakang

            unset($arrayLine); //mengosongkan array
            unset($temp);
            $arrayLine = preg_split("/\s+/", $termL); //$termL itu string
    

            foreach ($arrayLine as $d){
                    $temp[]=$d;
                    if(isset($freq["$d"])){
                        $freq["$d"]+= 1;
                    }else{
                        $freq["$d"]=1; //$freq => term dan jumlahny di doc
                    }

                    if(isset($nimDterm["$nimL"]["$d"])){
                        $nimDterm["$nimL"]["$d"]+=1;
                    }else{
                        $nimDterm["$nimL"]["$d"]=1;
                    }

              
            }
        }
         
            return array($freq,$nimDterm);
    }
	
	function readXMLFile1($path=''){
                    //$path = 'xml/test.xml';
                    $g = fopen($path, 'r') or die ("can't open file");
                    $f = file_get_contents($path);
                  //  echo "$f";
                    $dom = new DOMDocument;

                    $dom->loadXML($f);
                    /*** discard white space ***/
                    $dom->preserveWhiteSpace = false;

                    $tab=$dom->getElementsByTagName('doc');

                    foreach ($tab as $dc){
						$nim1 = $dc->getElementsByTagName('nim');
						$term1 = $dc->getElementsByTagName('term');
	
						$nim = $nim1->item(0)->nodeValue;
						$term = $term1->item(0)->nodeValue;
						$doc[$nim] = $term;
						//echo '<br />'.$nim1->item(0)->nodeValue.'<br />';
						//echo $term1->item(0)->nodeValue.'<br />';
                    }
                return $doc;
                }
	
   	function kMeans($path=array(),$k=0, $mode="auto", $centroid=array(),$prevC="c0",$result=array()){ //$path -> path file xml
        //$path = 'xml/parsing_pjj0101.xml';
        list($freq,$nimDterm)=$this->tokenisasiXML($path); 

		
        $f = array_keys($freq);
        $n = array_keys($nimDterm);
        //tabel jumlah term pada masing2 dokumen , term frequency table
        foreach($n as $nim){ //loop sebanyak doc
            foreach($f as $term){ //loop sebanyak all term

                if(isset($nimDterm[$nim][$term])){
                    $t[$nim][$term]=$nimDterm[$nim][$term];
                    }else{
                         $t[$nim][$term]=0;
                     }

            }
        }
		
		//$t = array();
		//$t = $termFreqTable;

        if($mode=="manual"){
			list($centroid,$dataNim) = $this->random_seeds($t,$k,$n);
                        $this->exportDataNimXML($dataNim);
                        //var_dump($centroid);
		}
		else if($mode=="auto"){
			if(empty($centroid)){
                                $k=1;
				list($centroid,$dataNim) = $this->random_seeds($t,$k,$n);
				$prevC="c0";
				
			}else{
            	$c = $this->jarakTerjauh($result); //nim yang paling jauh dari centroidnya yang telah dihitung sebelum                                    
                list($centroid1,$prevC) = $this->random_seeds_auto($t,1,$n,$prevC,$c); 
				$centroid[$prevC] = $centroid1[$prevC];
			}
		}
       

        //init. grup
      
        $grupLama = $this->init_grup($t);
   
        //init $cek = 1 => grup belum sama
        $cek = 1;
        $iterasi = 1;

        while($cek != 0){ //selama grupBru != grupLama

        $jarak = $this->hitung_jarak_dc($t, $centroid);

 
        $grupBaru=$this->gruping($t, $jarak);


            $kelGrup = $this->kelompok_doc_sesuai_grup($centroid, $grupBaru, $jarak);
 
            $centroidBaru = $this->hitung_centroid_baru($centroid, $kelGrup, $t);
            $centroid = $centroidBaru;

        //checking grupBaru == grupLama ? returnny 0 atw 1 ;
        $cek = $this->array_associative_compare($grupLama, $grupBaru);
        $grupLama = $grupBaru;
        $iterasi++;
		}
        //var_dump($kelGrup);
        return array($kelGrup,$centroid,$prevC);
	}
	
	
    function autoClustering($path='',$mode="", $k=1, $c=1){   
        $this->setMaxCluster($k);
        while($k<=$this->getMaxCluster()){
            list($result,$centroid,$prevC) = $this->kMeans($path, $k, $mode, $this->getCentroid(),$this->getPrevC(),$this->getResult());
            
            $this->setResult($result);
            //hitung jarak tiap doc dengan centroidnya masing2
            //$this->hitung_jarak_dc($t, $centroid);


            $avgAll = $this->avgCluster($result);

            if($avgAll > 0.97){ // batasan minimum rata2 jarak cosine ke cluster 0.9 - 0.91
                                // coba 0.80 - 0.99 and max iteration 100
           
                //var_dump($this->chsn);
                $this->exportDataNimXML($this->chsn,"auto"); //kalau mau tau centroid apa saja yg diambil
                return $result;
                
                //$this->exportDataNimXML($this->getPrevChsnCent(),"auto"); //kalau mau tau centroid apa saja yg diambil
                break;
            }
            
            $k++;
            $this->setMaxCluster($k);
            $this->setCentroid($centroid);
            $this->setPrevC($prevC); //string nama cluster sebelumny , ex: "c1" untuk iterasi ke 3
            $x=$this->getPrevC();
            //echo "prevC now di auto: $x<br>";
            
            //echo "prev centroid di auto:";
            //var_dump($this->getCentroid());
        }
        
            
    }
    function avgCluster($result=array()){
            $avgEach = array();
            $sumAvgEach=0;
            $avgAll=0;
            $c=0;
            foreach($result as $cluster => $member){

                $temp=0;
                //$i=count($member);
                $i=0;
                foreach($member as $nim => $cos ){
                    $temp += $cos;
                    //$i++;
                    //echo "<br>$i =: $temp<br>";
                    $i++;

                }
                if($i==0){$i=1;} //g ada member
                $avgEach[$cluster] = $temp/$i; //?
                $sumAvgEach += $avgEach[$cluster];
                $c++;
            }
            $avgAll=$sumAvgEach/$c;
            return $avgAll;
    }

//supporting function
    function random_seeds($t=array(),$cluster=1,$doc=array()){
        $this->load->helper('array_helper');
        $sprev='';
            for($i=0;$i<$cluster;$i++){
                $s=random_element($doc);
                if($s!=$sprev){
                    //$centroid[$i]=$t[$s];
                    $centroid["c$i"]=$t[$s];
                    $this->setPrevChsnCent($s);
                    $dataNim[]=$s;
                    //echo $s; nim aja
                }else{ //$s == $prev -> ulang counter
                $i--;}
                $sprev=$s; //checker if $s udah d masukkin
             }
        return array($centroid,$dataNim);
    }
    function jarakTerjauh($result=array()){
        $max=1;
        $nims="";
        //hitung jarak terjauh
        foreach ($result as $cent=>$member){
            
            foreach ($member as $nim => $dist){
                if($dist<$max){
                    $max=$dist;
                    $temp[$nim] = $dist;

                }

            }

        }
        //hitung yang terkecil dari yang terkecil
        $max=1;
        foreach ($temp as $nim => $dist){
            if($dist<$max){
                    $max=$dist;
                   $nims = $nim;
                    
                }
        }
        //echo "<br> FUNCTION jarakTerjauh | <br> nim dengan jarak terjauh dari centroidnya : $nims<br>";
        return $nims;
    }
    function random_seeds_auto($t=array(),$cluster=1,$doc=array(),$prevC="c0", $c=""){
        //belum di cek klw auto seed yang d ambil udah d ambil sebelumnya g?
		
            $this->load->helper('array_helper');
            $sprev='';
            for($i=0;$i<$cluster;$i++){
                //$s=random_element($doc);
                //if($s!=$sprev){
                if($c!=$this->getPrevChsnCent()){
                    $prevCnum = strtok($prevC, 'c');
                    $prevCnum = intval($prevCnum);
                    $prevCnum++;
                    //echo "<br>prevnum random seed: $prevCnum<br>";
                    $prevC="c"."$prevCnum";
                    //echo "<br>prevC now : c$prevCnum<br>";
                        //$centroid["$prevC"]=$t[$s];
                    //coba dari jarak terjauh
                    $centroid["$prevC"]=$t[$c];
                    $this->setPrevChsnCent($c);
                }else{ //$s == $prev -> ulang counter
                $i--;}
                //$sprev=$s; //checker if $s udah d masukkin
                $sprev=$c;
             }
        return array($centroid,$prevC);
    }
    function init_grup($array = array()){
        foreach($array as $n => $r){
                $grup[$n] = -1;
            }
        return $grup;
    }
    function norm_vektor($array=array()){
        $norm = 0;
        foreach($array as $key1=>$val1){ //looping sebanyak jumlah $array1
          
                    $norm += pow($val1,2);

        }
        return sqrt($norm);
    }
    function normalisasi_panjang($vektor=array(),$norm=1){
        $np = array();
        foreach($vektor as $key => $val){
            $np[$key] = $val/$norm;
        }
        return $np;
    }
    function cosine_sim($vektor1=array(), $vektor2=array()){
        $jc = 0;
        $norm1 = $this->norm_vektor($vektor1);
        $norm2 = $this->norm_vektor($vektor2);

        $normalisasiPanjangDoc1 = $this->normalisasi_panjang($vektor1, $norm1);
        $normalisasiPanjangDoc2 = $this->normalisasi_panjang($vektor2, $norm2);

        foreach($normalisasiPanjangDoc1 as $key1=>$val1){ //looping sebanyak jumlah $array1
                $jc += $val1*$normalisasiPanjangDoc2[$key1];
        }

        return $jc;
    }
    function hitung_jarak_euclid($array=array(),$array2=array()){

    $jc = 0;
        foreach($array as $key1=>$val1){ //looping sebanyak jumlah $array1
                /*  //$array2[];
                    //looping sebanyak jumlah elemen
                    //foreach($val1 as $key2=>$val2){ */
                    $jc += pow(($val1 - $array2[$key1]),2);
                /*  // $jc=sqrt($jc);
                    //$cd[$cluster][$doc]=$jc;
                    //} */
        }
        return sqrt($jc);
    }
    function hitung_jarak_dc($t,$centroid){
        foreach($t as $nim=>$term1){
                foreach($centroid as $centro => $term2)
                    {
                    //jarak euclid
                    //$jarak[$nim][$centro] = $this->hitung_jarak_euclid($term1, $term2);
                    //jarak cosine
                    $jarak[$nim][$centro] = $this->cosine_sim($term1, $term2);
                    }
              //  foreach($term as $key=>$val){
              //  }
            }
        return $jarak;
    }
    
//min jarak untuk euclid
    function min_2_dimensi($input=array()){
        //init buat pembanding pertama
        $min = max($input);
        $d='c0';
        foreach($input as $c => $val){
            if($val < $min)
                {
                $min = $val;
                $d = $c;
                }

            }
        //$for
        return $d;
    }
//jarak min untuk cosine ; cos 0 = 1
    function max_cosine_2_dimensi($input=array()){
        $max = min($input);
        $d='c0';
        foreach($input as $c => $val){
            if($val > $max)
                {
                $max = $val;  //ctt : grup masuk yang index terkecil
                $d = $c;
                }

            }
        return $d;
    }

//gruping function
    function gruping($t,$jarak){
        foreach($t as $n => $r){
                //$grup[$n] =  $this->min_2_dimensi($jarak[$n]);
                $grup[$n] =  $this->max_cosine_2_dimensi($jarak[$n]);
            }
        return $grup;
    }
	
    function kelompok_doc_sesuai_grup($centroid,$grupBaru, $jarak){
        foreach ($centroid as $nama=>$termArray){
                    $kelGrup[$nama]=array();
                    foreach($grupBaru as $nim=>$cluster){
                        if($cluster == $nama){                
                        	$kelGrup[$nama][$nim]=$jarak[$nim][$nama]; //perubahan dsni
						}
					}
		}
        return $kelGrup;

    }
    function hitung_centroid_baru($centroid,$kelGrup,$t){
        foreach($centroid as $namaCluster => $arrayTerm){
                    foreach($arrayTerm as $keyTerm=>$val){
                        $a=0;
                        $arrayNim=$kelGrup[$namaCluster];
                        foreach($arrayNim as $nimGrup=>$val2){
                        //  $temp = $temp+$t[$][$];
                            $a = $a+$t[$nimGrup][$keyTerm];
                        }
                        if(count($kelGrup[$namaCluster])==0){ //grup g ada anggota
                            $centroidBaru[$namaCluster][$keyTerm] = $centroid[$namaCluster][$keyTerm];
                            }else{
                            $centroidBaru[$namaCluster][$keyTerm] = $a/count($kelGrup[$namaCluster]);
                        }
                    }
                }
        return $centroidBaru;
    }
//
    function array_equality_compare($array1,$array2){
        if (count($array1) < count($array2)) {
            return -1; // $array1 < $array2
        } elseif (count($array1) > count($array2)) {
            return 1; // $array1 > $array2
        }
        $c=0;
        $d=0;
        foreach ($array1 as $arr1){
            if($arr1 == $array2[$c]){

                //$r[]= "$c sama";
                $c++;
                //$msg = "sama";
                }else{
                    //$r[] ="$c ga";
                    return false;
                    break;
                    //$c++;
                    }
        }

        return true;
    }
    function array_associative_compare($array1, $array2){

        if (count($array1) < count($array2)) {
            return -1; // $array1 < $array2
        } elseif (count($array1) > count($array2)) {
            return 1; // $array1 > $array2
        }
        foreach ($array1 as $key => $val) {
            if (!array_key_exists($key, $array2)) {
                return null; // uncomparable
            } elseif ($val < $array2[$key]) {
                return -1;
            } elseif ($val > $array2[$key]) {
                return 1;
            }
        }
        return 0; // $array1 == $array2
    }
//
    function lihat_array_1_dimensi($array=array()){
        echo "<table>";
            echo "<tr>";
                echo"<td>Key</td>";
                echo"<td>Val</td>";
            echo "</tr>";

        foreach($array as $key=>$val){
            echo "<tr>";
                echo "<td>".$key." : </td><td>".$val."<br/></td>";
            echo "</tr>";

            }
        echo "</table>";
    }
    function lihat_array_1_dim_biasa($array=array()){
        foreach($array as $key){
                echo $key."<br/>";
            }
    }
    function lihat_array_2_dimensi($array=array()){
        echo "<table>";
                foreach($array as $key => $val){
                echo "<tr>";
                    echo "<td>";
                    echo $key." : <br>";
                    echo "</td>";
                    foreach ($val as $key2 => $val2){
                        echo "<td>";
                        echo $key2." = ".$val2." | "; // $jumlah = $nimDterm[$nim][$term]

                        echo "</td>";
                    }
                   // echo "<br/>";
                echo "</tr>";

                }
        echo "</table>";
        }

    function get_judul_tugas(){
                $this->load->database();
		$this->db->select('nama_tgs'); //select * from
                $this->db->from('tugas');
		$nm_tugas = $this->db->get();

        return $nm_tugas->result();
    }

    function exportDataNimXML($array=array(), $mode="manual"){

        if($mode=="manual"){
        $doc = new DOMDocument('1.0');
            if(empty($namaTugas)){
                $namaTugas = '_';
            }

            // we want a nice output
            $doc->formatOutput = true;
            $centroid = $doc->createElement('centroid');
            $centroid = $doc->appendChild($centroid);

            foreach ($array as $nim1){
                //$nim1  =$nim2;

           
                $nim = $doc->createElement('doc');
                $nim = $centroid->appendChild($nim);
                $nt = $doc->createTextNode($nim1);
                $nt = $nim->appendChild($nt);
            }



                    $doc->save("xml/centroid_1man.xml"); //ganti nama sesuai percobaan
                    //echo 'Wrote: ' . $doc->save("xml/parsing_".$namaTugas.".xml") . ' bytes'; // Wrote: 72 bytes
                   // $pathParsingXML = "xml/parsing_".$namaTugas.".xml";
                   // return $pathParsingXML;
    }else if($mode=="auto"){
        $doc = new DOMDocument('1.0');

            if(empty($namaTugas)){
                $namaTugas = '_';
            }

            // we want a nice output
            $doc->formatOutput = true;
            $centroid = $doc->createElement('centroid');
            $centroid = $doc->appendChild($centroid);

            foreach ($array as $key => $nim1){
                //$nim1  =$nim2;


                $nim = $doc->createElement('doc');
                $nim = $centroid->appendChild($nim);
                $nt = $doc->createTextNode($nim1);
                $nt = $nim->appendChild($nt);
            }



                    //$doc->save("xml/centroid_1auto.xml"); //ganti nama sesuai percobaan
                    //echo 'Wrote: ' . $doc->save("xml/parsing_".$namaTugas.".xml") . ' bytes'; // Wrote: 72 bytes
                   // $pathParsingXML = "xml/parsing_".$namaTugas.".xml";
                   // return $pathParsingXML;

    }
    }




}
?>
