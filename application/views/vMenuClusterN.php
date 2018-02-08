<?php echo form_open('cmain/cluster');?>
<?php
	$select['bisecting_kmeans'] = 'i';
	$select['kmeans'] = 'k';
	$select['single_linkage'] = 'i';
	$select['average_linkage'] = 'i';
	$select['complete_linkage'] = 'i';
	//tambah metode baru disini
	
	$options=array( 
		//tambah nama metode baru disini
		'average_linkage' => 'Average Linkage',
		'bisecting_kmeans' => 'Bisecting K-means',
		'complete_linkage' => 'Complete Linkage',
		'kmeans' => 'K-Means',
		'single_linkage' => 'Single Linkage',
	);
?>
    <div class="col-sm-8 col-sm-offset-2">
        <!--      Cluster Wizard        -->
        <div class="wizard-container">
            <div class="card wizard-card" data-color="blue" id="wizardProfile">
                <form action="#" method="">
                    <!--        You can switch " data-color="purple" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->
                    <div class="wizard-header">
                        <h3 class="wizard-title">
                            Clustering
                        </h3>
                        <!-- <h5></h5> -->
                    </div>
                    <div class="wizard-navigation">
                        <ul>
                            <li>
                                <a href="#kontes" data-toggle="tab">Kontes</a>
                            </li>
                            <li>
                                <a href="#prosescluster" data-toggle="tab">Proses Clustering</a>
                            </li>
                            <li>
                                <a href="#metode" data-toggle="tab">Metode</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane" id="prosescluster">
                            <div class="row">
                                <h4 class="info-text"> Pilih Kontes dan Jenis Soal</h4>
                                <div class="col-sm-4 col-sm-offset-1">
                                    <div class="picture-container">
                                        <div class="picture">
                                            <img src="../kit/img/default-avatar.png" class="picture-src" id="wizardPicturePreview" title="" />
                                            <input type="file" id="wizard-picture">
                                        </div>
                                        <h6>Choose Picture</h6>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">face</i>
                                        </span>
                                        <div class="form-group label-floating">
                                            <label class="control-label">First Name
                                                <small>(required)</small>
                                            </label>
                                            <input name="firstname" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">record_voice_over</i>
                                        </span>
                                        <div class="form-group label-floating">
                                            <label class="control-label">Last Name
                                                <small>(required)</small>
                                            </label>
                                            <input name="lastname" type="text" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-10 col-lg-offset-1">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">email</i>
                                        </span>
                                        <div class="form-group label-floating">
                                            <label class="control-label">Email
                                                <small>(required)</small>
                                            </label>
                                            <input name="email" type="email" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="kontes">
                            <?php $data = array(); form_fieldset('',$data); ?>
                            <h4 class="info-text"> Pilih Kontes dan Jenis Soal </h4>
                            <div class="row">
                                <div class="col-lg-10 col-lg-offset-1">
                                    <div class="col-sm-4">
                                        <div class="choice" data-toggle="wizard-radio">
                                            <input type="radio" name="jobb" value="Design">
                                            <div class="icon">
                                                <i class="sidebar-mini">C</i>
                                            </div>
                                            <h6>Kode Program C</h6>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="choice" data-toggle="wizard-radio">
                                            <input type="radio" name="jobb" value="Code">
                                            <div class="icon">
                                                <i class="sidebar-mini">Py</i>
                                            </div>
                                            <h6>Kode Program Python</h6>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="choice" data-toggle="wizard-radio">
                                            <input type="radio" name="jobb" value="Develop">
                                            <div class="icon">
                                                <i class="fa fa-braille"></i>
                                            </div>
                                            <h6>...</h6>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <select class="selectpicker" data-style="btn btn-primary btn-round" title="Single Select" data-size="7">
                                                <option disabled selected>Jenis Soal</option>
                                                <option>
                                                    <?php $tugas = 'id="tugas" name="tugas"'; ?>
                                                    <?php echo form_dropdown('jenso', $options_problem, $problem, $tugas)?>
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="address">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h4 class="info-text"> Are you living in a nice area? </h4>
                                </div>
                                <div class="col-sm-7 col-sm-offset-1">
                                    <div class="form-group label-floating">
                                        <label class="control-label">Street Name</label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group label-floating">
                                        <label class="control-label">Street No.</label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-sm-5 col-sm-offset-1">
                                    <div class="form-group label-floating">
                                        <label class="control-label">City</label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="form-group label-floating">
                                        <label class="control-label">Country</label>
                                        <select name="country" class="form-control">
                                            <option disabled="" selected=""></option>
                                            <option value="Afghanistan"> Afghanistan </option>
                                            <option value="Albania"> Albania </option>
                                            <option value="Algeria"> Algeria </option>
                                            <option value="American Samoa"> American Samoa </option>
                                            <option value="Andorra"> Andorra </option>
                                            <option value="Angola"> Angola </option>
                                            <option value="Anguilla"> Anguilla </option>
                                            <option value="Antarctica"> Antarctica </option>
                                            <option value="...">...</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="wizard-footer">
                        <div class="pull-right">
                            <input type='button' class='btn btn-next btn-fill btn-rose btn-wd' name='next' value='Next' />
                            <input type='button' class='btn btn-finish btn-fill btn-rose btn-wd' name='finish' value='Finish' />
                        </div>
                        <div class="pull-left">
                            <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </form>
            </div>
        </div>
        <!-- wizard container -->
    </div>