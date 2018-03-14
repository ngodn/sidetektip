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
                case '\n';
                    break;
                

                case '+':
                    $arrayMap[]='AA';
                    break;
                case '-':
                    $arrayMap[]='AB';
                    break;
                case '*':
                    $arrayMap[]='AC';
                    break;
                case '/':
                    $arrayMap[]='AD';
                    break;
                case '%':
                    $arrayMap[]='AE';
                    break;
                case '&':
                    $arrayMap[]='AF';
                    break;
                case '|':
                    $arrayMap[]='AG';
                    break;
                case '(':
                    $arrayMap[]='AH';
                    break;
                case ')':
                    $arrayMap[]='AI';
                    break;
                case ',':
                    $arrayMap[]='AJ';
                    break;
                case '{':
                    $arrayMap[]='AK';
                    break;
                case '}':
                    $arrayMap[]='AL';
                    break;
                case '[':
                    $arrayMap[]='AM';
                    break;
                case ']':
                    $arrayMap[]='AN';
                    break;
                case '<':
                    $arrayMap[]='AO';
                    break;
                case '>':
                    $arrayMap[]='AP';
                    break;
                case '=':
                    $arrayMap[]='AQ';
                    break;
                case '.':
                    $arrayMap[]='AR';
                    break;
                case '!':
                    $arrayMap[]='BA';
                    break;
                case ':':
                    $arrayMap[]='BB';
                    break;
                case '^':
                    $arrayMap[]='BC';
                    break;
                case '~':
                    $arrayMap[]='BD';
                    break;
                case 'in':
                    $arrayMap[]='BE';
                    break;
                case 'is':
                    $arrayMap[]='BF';
                    break;
                case 'not':
                    $arrayMap[]='BG';
                    break;
                case 'or':
                    $arrayMap[]='BH';
                    break;
                case 'and':
                    $arrayMap[]='BI';
                    break;
                case 'while':
                    $arrayMap[]='BJ';
                    break;
                case 'if':
                    $arrayMap[]='BK';
                    break;
                case 'else':
                    $arrayMap[]='BL';
                    break;
                case 'for':
                    $arrayMap[]='BM';
                    break;
                case 'break':
                    $arrayMap[]='BN';
                    break;
                case 'continue':
                    $arrayMap[]='BO';
                    break;
                case 'pass':
                    $arrayMap[]='BP';
                    break;

                
                case 'int':
                    $arrayMap[]='aa';
                    break;
                case 'long':
                    $arrayMap[]='ab';
                    break;
                case 'float':
                    $arrayMap[]='ac';
                    break;
                case 'complex':
                    $arrayMap[]='ad';
                    break;
                case 'str':
                    $arrayMap[]='ae';
                    break;
                case 'repr':
                    $arrayMap[]='af';
                    break;
                case 'eval':
                    $arrayMap[]='ag';
                    break;
                case 'tuple':
                    $arrayMap[]='ah';
                    break;
                case 'list':
                    $arrayMap[]='ai';
                    break;
                case 'set':
                    $arrayMap[]='aj';
                    break;
                case 'dict':
                    $arrayMap[]='ak';
                    break;
                case 'frozenset':
                    $arrayMap[]='al';
                    break;
                case 'chr':
                    $arrayMap[]='am';
                    break;
                case 'unichr':
                    $arrayMap[]='an';
                    break;
                case 'ord':
                    $arrayMap[]='ao';
                    break;
                case 'hex':
                    $arrayMap[]='ap';
                    break;
                case 'oct':
                    $arrayMap[]='aq';
                    break;
                case 'abs':
                    $arrayMap[]='ar';
                    break;
                case '.ceil':
                    $arrayMap[]='as';
                    break;
                case 'cmp':
                    $arrayMap[]='at';
                    break;
                case '.exp':
                    $arrayMap[]='au';
                    break;
                case '.fabs':
                    $arrayMap[]='av';
                    break;
                case '.floor':
                    $arrayMap[]='aw';
                    break;
                case '.log':
                    $arrayMap[]='ax';
                    break;
                case '.log10':
                    $arrayMap[]='ay';
                    break;
                case 'max':
                    $arrayMap[]='az';
                    break;

                case 'min':
                    $arrayMap[]='ba';
                    break;
                case '.modf':
                    $arrayMap[]='bb';
                    break;
                case 'pow':
                    $arrayMap[]='bc';
                    break;
                case 'round':
                    $arrayMap[]='bd';
                    break;
                case '.sqrt':
                    $arrayMap[]='be';
                    break;
                case 'choice':
                    $arrayMap[]='bf';
                    break;
                case 'randrange':
                    $arrayMap[]='bg';
                    break;
                case 'random':
                    $arrayMap[]='bh';
                    break;
                case 'seed':
                    $arrayMap[]='bi';
                    break;
                case '.shuffle':
                    $arrayMap[]='bj';
                    break;
                case 'uniform':
                    $arrayMap[]='bk';
                    break;
                case '.acos':
                    $arrayMap[]='bl';
                    break;
                case '.asin':
                    $arrayMap[]='bm';
                    break;
                case '.atan':
                    $arrayMap[]='bn';
                    break;
                case '.atan2':
                    $arrayMap[]='bo';
                    break;
                case '.cos':
                    $arrayMap[]='bp';
                    break;
                case '.hypot':
                    $arrayMap[]='bq';
                    break;
                case '.sin':
                    $arrayMap[]='br';
                    break;
                case '.tan':
                    $arrayMap[]='bs';
                    break;
                case '.degrees':
                    $arrayMap[]='bt';
                    break;
                case '.radians':
                    $arrayMap[]='bu';
                    break;
                case 'pi':
                    $arrayMap[]='bv';
                    break;
                case 'e':
                    $arrayMap[]='bw';
                    break;
                case '.capitalize':
                    $arrayMap[]='bx';
                    break;
                case '.center':
                    $arrayMap[]='by';
                    break;
                case '.count':
                    $arrayMap[]='bz';
                    break;

                
                case '.decode':
                    $arrayMap[]='ca';
                    break;
                case '.encode':
                    $arrayMap[]='cb';
                    break;
                case '.endswith':
                    $arrayMap[]='cc';
                    break;
                case '.expandtabs':
                    $arrayMap[]='cd';
                    break;
                case '.find':
                    $arrayMap[]='ce';
                    break;
                case '.index':
                    $arrayMap[]='cf';
                    break;
                case '.isalnum':
                    $arrayMap[]='cg';
                    break;
                case '.isalpha':
                    $arrayMap[]='ch';
                    break;
                case '.isdigit':
                    $arrayMap[]='ci';
                    break;
                case '.islower':
                    $arrayMap[]='cj';
                    break;
                case '.isnumeric':
                    $arrayMap[]='ck';
                    break;
                case '.isspace':
                    $arrayMap[]='cl';
                    break;
                case '.istitle':
                    $arrayMap[]='cm';
                    break;
                case '.isupper':
                    $arrayMap[]='cn';
                    break;
                case '.join':
                    $arrayMap[]='co';
                    break;
                case '.len':
                    $arrayMap[]='cp';
                    break;
                case '.ljust':
                    $arrayMap[]='cq';
                    break;
                case '.lower':
                    $arrayMap[]='cr';
                    break;
                case '.lstrip':
                    $arrayMap[]='cs';
                    break;
                case '.maketrans':
                    $arrayMap[]='ct';
                    break;
                case '.max':
                    $arrayMap[]='cu';
                    break;
                case '.min':
                    $arrayMap[]='cv';
                    break;
                case '.replace':
                    $arrayMap[]='cw';
                    break;
                case '.rfind':
                    $arrayMap[]='cx';
                    break;
                case '.rindex':
                    $arrayMap[]='cy';
                    break;
                case '.rjust':
                    $arrayMap[]='cz';
                    break;


                case '.rstrip':
                    $arrayMap[]='da';
                    break;
                case '.split':
                    $arrayMap[]='db';
                    break;
                case '.splitlines':
                    $arrayMap[]='dc';
                    break;
                case '.startswith':
                    $arrayMap[]='dd';
                    break;
                case '.strip':
                    $arrayMap[]='de';
                    break;
                case '.swapcase':
                    $arrayMap[]='df';
                    break;
                case '.title':
                    $arrayMap[]='dg';
                    break;
                case '.translate':
                    $arrayMap[]='dh';
                    break;
                case '.upper':
                    $arrayMap[]='di';
                    break;
                case '.zfill':
                    $arrayMap[]='dj';
                    break;
                case '.isdecimal':
                    $arrayMap[]='dk';
                    break;
                case 'type':
                    $arrayMap[]='dl';
                    break;
                case '.append':
                    $arrayMap[]='dm';
                    break;
                case '.count':
                    $arrayMap[]='dn';
                    break;
                case '.extend':
                    $arrayMap[]='do';
                    break;
                case '.index':
                    $arrayMap[]='dp';
                    break;
                case '.insert':
                    $arrayMap[]='dq';
                    break;
                case '.pop':
                    $arrayMap[]='dr';
                    break;
                case '.remove':
                    $arrayMap[]='ds';
                    break;
                case '.reverse':
                    $arrayMap[]='dt';
                    break;
                case '.sort':
                    $arrayMap[]='du';
                    break;
                case '.clear':
                    $arrayMap[]='dv';
                    break;
                case '.copy':
                    $arrayMap[]='dw';
                    break;
                case '.fromkeys':
                    $arrayMap[]='dx';
                    break;
                case '.get':
                    $arrayMap[]='dy';
                    break;
                case '.has_key':
                    $arrayMap[]='dz';
                    break;

                case '.items':
                    $arrayMap[]='ea';
                    break;
                case '.keys':
                    $arrayMap[]='eb';
                    break;
                case '.setdefault':
                    $arrayMap[]='ec';
                    break;
                case '.update':
                    $arrayMap[]='ed';
                    break;
                case '.values':
                    $arrayMap[]='ee';
                    break;
                case '@': //string
                    $arrayMap[]='SS';
                    break;
                
                //region 11
                default: //angka, nama variabel, nama fungsi
                    if(preg_match('/[^0-9]+|[^a-z]+/i', $term)) {
                        $arrayMap[]='NN';
                    }
            }
        }
        return $arrayMap;
    }
}

?>