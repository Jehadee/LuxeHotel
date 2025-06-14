<section style="background-image: url(<?= base_url() ?>assets/img/hero/hero-3.jpg);">
    <div class="container">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col col-xl-6 mt-5 mb-5">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-12 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">
                                <?php echo $this->session->flashdata('message'); ?>
                                
                                <?php echo form_open('auth'); ?>
                                    <?php echo form_hidden($this->security->get_csrf_token_name(), $this->security->get_csrf_hash()); ?>
                                    <div class="d-flex align-items-center mb-3 pb-1">
                                        <div class="logo">
                                            <a href="<?= base_url() ?>home">
                                                <img src="<?= base_url() ?>assets/img/logo.png" width="60px" alt="">
                                            </a>
                                        </div>
                                    </div>

                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" value="<?php echo set_value('email'); ?>">
                                        <?php echo form_error('email', '<small class="text-danger">', '</small>'); ?>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password">
                                        <?php echo form_error('password', '<small class="text-danger">', '</small>'); ?>
                                    </div>

                                    <div class="pt-1 mb-4">
                                        <button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
                                    </div>

                                    <!-- <a class="small text-muted" href="#!">Forgot password?</a> -->
                                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="<?= base_url() ?>auth/registration" style="color: #1818fe;">Register here</a></p>
                                <?php echo form_close(); ?>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>