<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mmapping extends CI_Model {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function mapping($arrayTerm=array()) {
        $arrayMap=array();
        foreach($arrayTerm as $term) {
            switch($term) {
                
                //term yg diabaikan
                case '':
                    break;
                case ';':
                    break;
                case 'void':
                    break;
                
                //region 1
                case '+':
                    $arrayMap[]='a';
                    break;
                case '-':
                    $arrayMap[]='b';
                    break;
                case '*':
                    $arrayMap[]='c';
                    break;
                case '/':
                    $arrayMap[]='d';
                    break;
                case '%':
                    $arrayMap[]='e';
                    break;
                
                //region 2
                case '&':
                    $arrayMap[]='f';
                    break;
                case '|':
                    $arrayMap[]='g';
                    break;
                
                //region 3
                case '(':
                    $arrayMap[]='h';
                    break;
                case ')':
                    $arrayMap[]='i';
                    break;
                case '{':
                    $arrayMap[]='k';
                    break;
                case '}':
                    $arrayMap[]='l';
                    break;
                case '<':
                    $arrayMap[]='m';
                    break;
                case '>':
                    $arrayMap[]='n';
                    break;
                
                //region 4
                case ',':
                    $arrayMap[]='j';
                    break;
                case '=':
                    $arrayMap[]='o';
                    break;
                case '.':
                    $arrayMap[]='p';
                    break;
                case '!':
                    $arrayMap[]='q';
                    break;
                case ':':
                    $arrayMap[]='r';
                    break;
                
                //region 5
                case 'int':
                    $arrayMap[]='A';
                    break;
                case 'float':
                    $arrayMap[]='B';
                    break;
                case 'char':
                    $arrayMap[]='C';
                    break;
                case 'double':
                    $arrayMap[]='D';
                    break;
                case 'short':
                    $arrayMap[]='E';
                    break;
                case 'long':
                    $arrayMap[]='F';
                    break;
                case 'signed':
                    $arrayMap[]='G';
                    break;
                case 'unsigned':
                    $arrayMap[]='H';
                    break;
                case 'const':
                    $arrayMap[]='T';
                    break;
                case 'sizeof':
                    $arrayMap[]='W';
                    break;
                case 'struct':
                    $arrayMap[]='X';
                    break;
                case 'enum':
                    $arrayMap[]='Y';
                    break;
                case 'typedef':
                    $arrayMap[]='Z';
                    break;
                case '@': //string
                    $arrayMap[]='5';
                    break;
                
                //region 6
                case 'if':
                    $arrayMap[]='I';
                    break;
                case 'else':
                    $arrayMap[]='J';
                    break;
                
                //region 7
                case 'while':
                    $arrayMap[]='K';
                    break;
                case 'do':
                    $arrayMap[]='L';
                    break;
                case 'for':
                    $arrayMap[]='M';
                    break;
                
                //region 8
                case 'goto':
                    $arrayMap[]='O';
                    break;
                case 'continue':
                    $arrayMap[]='U';
                    break;
                
                //region 9
                case 'case':
                    $arrayMap[]='P';
                    break;
                case 'break':
                    $arrayMap[]='Q';
                    break;
                case 'switch':
                    $arrayMap[]='S';
                    break;
                
                //region 10
                case 'return':
                    $arrayMap[]='R';
                    break;
                
                //region 11
                default: //angka, nama variabel, nama fungsi
                    if(preg_match('/[^0-9]+|[^a-z]+/i', $term)) {
                        $arrayMap[]='N';
                    }
            }
        }
        return $arrayMap;
    }
}

?>