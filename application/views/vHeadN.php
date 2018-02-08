<div class="user">
    <div class="photo">
        <img src="../kit/img/faces/avatar.jpg" />
    </div>
    <div class="info">
        <a data-toggle="collapse" href="#userMenu" class="collapsed">
            <span>
                <?php echo $user_system ?>
                <b class="caret"></b>
            </span>
        </a>
        <div class="clearfix"></div>
        <div class="collapse" id="userMenu">
            <ul class="nav">
                <li>
                <?php echo  anchor('/clogin/logout','<i class="material-icons">power_settings_new</i><p>Logout</p>');?>
                </li>
            </ul>
        </div>
    </div>
</div>