<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SCTP</title>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>kit/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>kit/css/material.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>kit/css/demo.css" />

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
    />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons"
    />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons" />


</head>

<body onLoad="proses_baru()">
    <div class="wrapper">
        <div class="sidebar" data-active-color="blue" data-background-color="black" data-image="<?php echo base_url();?>kit/img/sidebar-1.jpg">
            <div class="logo">
                <a href="" class="simple-text logo-mini">

                </a>
                <a href="" class="simple-text logo-normal">
                    SCTP
                </a>
            </div>
            <div class="sidebar-wrapper">
                <?php $this->load->view("vHead") ?>

                <ul class="nav">
                    <li class="active">
                        <?php echo  anchor('/cmain/','<i class="material-icons">dashboard</i><p>Klasterisasi</p>','id="current"');?>
                    </li>
                    <li class="">
                        <?php echo  anchor('/cmain/result_page','<i class="material-icons">assessment</i><p>Laporan Kontes</p>');?>
                    </li>
                    <li class="">

                        <?php echo  anchor('/cmain/admin_page','<i class="material-icons">settings</i><p>Admin</p>');?>

                    </li>

            </div>
        </div>
        <div class="main-panel">

            <div class="content">
                <div class="container-fluid">

                    <?php $this->load->view("vMenuCluster")?>

                </div>
            </div>

        </div>

    </div>





</body>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/material.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/perfect-scrollbar.jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/arrive.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/moment.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/chartist.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/jquery.bootstrap-wizard.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/bootstrap-notify.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/jquery.sharrre.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/jquery-jvectormap.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/nouislider.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/jquery.select-bootstrap.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/jquery.datatables.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/sweetalert2.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/jasny-bootstrap.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/fullcalendar.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/jquery.tagsinput.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/material.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>kit/js/demo.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        demo.initMaterialWizard();
        setTimeout(function () {
            $('.card.wizard-card').addClass('active');
        }, 600);
    });
</script>

</html>

<script type="text/javascript">
    pilih = new Array();
    pilih['bisecting_kmeans'] = 'i';
    pilih['kmeans'] = 'k';
    pilih['single_linkage'] = 'i';
    pilih['average_linkage'] = 'i';
    pilih['complete_linkage'] = 'i';
    //add new method here

    $(document).ready(function () {
        $("#method").change(function () {
            var method = $("#method").val();
            var a = document.getElementById('font_i');
            var b = document.getElementById('i');
            var c = document.getElementById('font_k');
            var d = document.getElementById('k');
            var e = document.getElementById('test_case');
            var f = document.getElementById('tc');
            if (pilih[method] == 'i') {
                a.style.visibility = 'visible';
                b.style.visibility = 'visible';
                b.value = '0.95';
                c.style.visibility = 'hidden';
                d.style.visibility = 'hidden';
                e.style.visibility = 'visible';
                f.style.visibility = 'visible'
            } else if (pilih[method] == 'k') {
                a.style.visibility = 'hidden';
                b.style.visibility = 'hidden';
                c.style.visibility = 'visible';
                d.style.visibility = 'visible';
                e.style.visibility = 'hidden';
                f.style.visibility = 'hidden'
            } else {
                a.style.visibility = 'hidden';
                b.style.visibility = 'hidden';
                c.style.visibility = 'hidden';
                d.style.visibility = 'hidden';
            }
        });
    });

    function checkbox() {
        var a = document.getElementById('font_i');
        var b = document.getElementById('i');
        var c = document.getElementById('font_k');
        var d = document.getElementById('k');
        if (document.getElementById('metode_clustering').checked) {
            document.getElementById('mclustering').style.visibility = 'visible';
            var method = $("#method").val();
            if (pilih[method] == 'i') {
                a.style.visibility = 'visible';
                b.style.visibility = 'visible';
                c.style.visibility = 'hidden';
                d.style.visibility = 'hidden';
            } else if (pilih[method] == 'k') {
                a.style.visibility = 'hidden';
                b.style.visibility = 'hidden';
                c.style.visibility = 'visible';
                d.style.visibility = 'visible';
            } else {
                a.style.visibility = 'hidden';
                b.style.visibility = 'hidden';
                c.style.visibility = 'hidden';
                d.style.visibility = 'hidden';
            }

        } else {
            document.getElementById('mclustering').style.visibility = 'hidden';
            a.style.visibility = 'hidden';
            b.style.visibility = 'hidden';
            c.style.visibility = 'hidden';
            d.style.visibility = 'hidden';
        }
        if (!(document.getElementById('metode_clustering').checked) && !(document.getElementById('test_case').checked) &&
            !(document.getElementById('hapus_include').checked)) {
            document.getElementById('submit').style.visibility = 'hidden';
        } else {
            document.getElementById('submit').style.visibility = 'visible';
        }
    }

    function proses_baru() { //fungsi menyimpan pembaharuan plagiat
        clusters = <?php echo json_encode($clusters) ?>;
        if (clusters) {
            iosOverlay({
                text: "Proses Selesai",
                duration: 819,
                icon: "<?php echo base_url();?>css/overlay/img/check.png"
            });
        }
    }
</script>