<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Singlelinkagglo extends CI_Model {

    public $left, $right, $distance;

//    public function __construct($distance) {
//        $this->distance = $distance;
//        parent::__construct();
//        
//    }
    public function __construct() {
        //$this->distance = $distance;
        parent::__construct();
    }

    public function pop(&$a, $i) {
        $foo = $a[$i];
        array_splice($a, $i, 1);
        return $foo;
    }

    public function __toString() {
        return sprintf("(%s, %s)", $this->left, $this->right);
    }

    public function add($clusters, $grid, $lefti, $righti) {
        $this->left = $clusters[$lefti];
        $this->right = $this->pop($clusters, $righti);
# merge columns grid[row][righti] and row grid[righti] into corresponding lefti
        for ($i = 0; $i < count($grid); $i++) {
            for ($j = 0; $j < count($grid); $j++) {
                $grid[$i][$lefti] = min($grid[$i][$lefti], $grid[$i][$righti]);
            }
            $this->pop($grid[$i], $righti);
        }
        $r = $this->pop($grid, $righti);
        for ($i = 0; $i < count($grid); $i++) {
            $grid[$lefti][$i] = min($grid[$lefti][$i], $r[$i]);
        }
        return array($clusters, $grid);
    }

# list all members of this cluster

    public function members() {
        $m = array();
        foreach (array($this->left, $this->right) as $x) {
            if (method_exists($x, 'members'))
                $m = array_merge($m, $x->members());
            else
                $m[] = $x;
        }
        return $m;
    }

# split a cluster into n sub-clusters based on the order they were built (and thus distance)

    public function comp($a, $b) {
        if (!property_exists($a, 'distance'))
            return 1;
        if (!property_exists($b, 'distance'))
            return -1;
        return $a->distance - $b->distance;
    }

    public function splitInto($n) {
        $clusters = array($this);
        while (count($clusters) < $n) {
# find the cluster with the highest nth
            //usort($clusters, $this->comp($a, $b));
            usort($clusters, function($a, $b){ 
            if (!property_exists($a, 'distance')) return 1; 
            if (!property_exists($b, 'distance')) return -1;
            return $a->distance - $b->distance; });
            if (!property_exists($clusters[0], 'left'))
                break;# none left to split, bail out
# highest nth is at [0], split it into left and right
# note: it's always guarenteed to be splittable since
# we check n/nth at the top
            $c = array_shift($clusters);
            $clusters[] = $c->left;
            $clusters[] = $c->right;
        }
        return $clusters;
		
    }

    private function sortByDistance($clusters) {
# find the cluster with the highest nth
        usort($clusters, comp2($a, $b));
        return $clusters;
    }

# split a cluster into n sub-clusters based on the distance

    public function splitBy($distance) {
        $clusters = array($this);
        while (true) {
            if (!property_exists($clusters[0], 'distance') || $clusters[0]->distance < $distance)
                break;
# highest nth is at [0], split it into left and right
# note: it's always guarenteed to be splittable since
# we check n/nth at the top
            $c = array_shift($clusters);
            $clusters[] = $c->left;
            $clusters[] = $c->right;
        }
        return $clusters;
    }

}
?>

