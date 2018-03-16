<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Cabinet Bookshop</title>
        <meta name="description" content="" />
        <meta name="Template_Author" content="Dorin Grigoras [www.stepofweb.com]" />
        <meta name="Author" content="Peng Jin" />

        <!-- mobile settings -->
        <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

        <!-- WEB FONTS : use %7C instead of | (pipe) -->
        <link href="https://fonts.googleapis.com/css?family=Cairo:300,400,600%7CRaleway:300,400,500,600,700%7CLato:300,400,400italic,600,700" rel="stylesheet" type="text/css" />

        <!-- CORE CSS -->
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

        <!-- THEME CSS -->
        <link href="assets/css/essentials.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/layout.css" rel="stylesheet" type="text/css" />


        <!-- PAGE LEVEL SCRIPTS -->
        <link href="assets/css/color_scheme/green.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/header-6.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/pack-megashop.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/custom-forms-v2.css" rel="stylesheet" type="text/css" />
    </head>

    <!--
            AVAILABLE BODY CLASSES:
            
            .smoothscroll 			= create a browser smooth scroll
            .enable-animation		= enable WOW animations
            .boxed layout-dark		= black friday dark layout (used with #header.header-dark)
            .boxed					= boxed layout
    -->
    <body class="smoothscroll enable-animation">




        <!-- 
                            # HEADER V2 # 
                            - very differnt from other headers -
    
    
                            + HEADER STYLE
                                    .header-light
                                    .header-dark
    
    
                            + HEADER SHADOWS
                                    .header-shadow-1
    
    
                            + MISC
                                    .header-fixed				= enable sticky header
    
        -->
        <nav id="header" class="header-light header-fixed header-shadow-1">
            <div class="container">

                <!-- 
                                    MOBILE : NAVIGATION TOGGLE 
                                    * always before .header-logo
                                     data-text="MENIU"
                -->
                <button class="nav-toggle"></button>



                <!-- 
                                    LOGO 
                -->
                <a class="header-logo" href="index.jsp">
                    <img src="demo_files/pj/logo.png" height="30" alt="">
                </a>


                <!--
                                    + LAYOUT
                                        .header-buttons-bordered
                -->
                <ul class="list-inline header-buttons">
                    <% if (session.getAttribute("cname") != null) { %>
                    <li class="list-inline-item">
                        <a href="cart.jsp">
                            <i class="fa fa-opencart"></i>
                            my cart
                        </a>
                    </li>
                    <%}%>
                    <li class="list-inline-item header-button-arrow">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                            <i class="fa fa-user-o"></i> my account
                        </a>

                        <div class="dropdown-menu dropdown-menu-right">
                            <span>
                                <i class="fa fa-user"></i> <%=session.getAttribute("cname") == null ? "Please login" : session.getAttribute("cname")%></span>
                                <% if (session.getAttribute("cname") == null) { %>
                            <div class="pl-15 pr-15 pt-15 pb-15">
                                <h4 class="fs-13 fw-400 mb-10">Welcome to Cabinet!</h4>
                                <a href="login.jsp" class="btn btn-primary btn-sm btn-block fw-300">SIGN IN</a>
                                <div class="clearfix mt-8"></div>
                                <a href="register.jsp" class="btn btn-danger btn-sm btn-block fw-300">SIGN UP</a>
                            </div>
                            <%} else {%>
                            <a class="dropdown-item" href="orders.jsp">My Orders</a>
                            <a class="dropdown-item" href="settings.jsp">Account Settings</a>
                            <a class="dropdown-item dropdown-custom-icon dropdown-myaccount-logout" href="Authentication?logout=true">
                                <i class="fa fa-power-off"></i>
                                <b>Log Out</b>
                            </a>
                            <%}%>
                        </div>
                    </li>
                </ul>

                <form class="search-global hidden-sm-down">
                    <select class="custom-select" name="scope" id="search-scope">
                        <option selected value="0">All Categories</option>
                    </select>
                    <input type="text" style="display: none">
                    <input type="text" name="s" class="form-control" id="nav-search-bar" placeholder="Harry Potter">
                    <button class="btn btn-default" type="button" id="nav-search-btn">
                        <i class="fa fa-search"></i>
                    </button>
                </form>



                <!--
                                .main-nav-bordered
                -->
                <nav class="main-nav main-nav-toggle">

                    <div class="main-nav-mobile-header clearfix">
                        <button class="nav-toggle-close"></button>
                        <img src="demo_files/images/packs/megashop/logo_dark.png" height="60" alt="">
                    </div>

                    <div class="main-nav-mobile-scroll">
                        <ul class="list-unstyled mb-0" id="mobile-category">

                            <li class="main-nav-search hidden-md-up">
                                <form class="search-global input-group mb-0">
                                    <input type="text" style="display: none">
                                    <input type="text" class="form-control" placeholder="Book title..." id="side-search-bar">
                                    <button class="btn btn-default" type="button" id="side-search-btn">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </form>
                            </li>

                            <li>
                                <span>
                                    <a href="#">
                                        CATEGORIES
                                    </a>
                                </span>
                            </li>


                        </ul>
                    </div>

                </nav>

            </div>
        </nav>
        <!-- /HEADER -->






        <!-- 
                PAGE HEADER 
                
                CLASSES:
                        .page-header-xs	= 20px margins
                        .page-header-md	= 50px margins
                        .page-header-lg	= 80px margins
                                                .page-header-xlg= 130px margins
                        .dark		= dark page header
                        .light		= light page header
        -->
        <section class="page-header page-header-xs mt-60">
            <div class="container">

                <h1>CHECKOUT</h1>

                <!-- breadcrumbs -->
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Contact Us</li>
                </ol><!-- /breadcrumbs -->

            </div>
        </section>
        <!-- /PAGE HEADER -->








        <!-- wrapper -->
        <div id="wrapper">


            <!-- CHECKOUT -->
            <section>
                <div class="container">

                    <!-- CHECKOUT -->
                    <div class="">
                        <form class="row clearfix" id="tform">

                            <div class="col-lg-7 col-sm-7">

                                <!-- BILLING -->
                                <fieldset class="mb-0 box-border-shadow p-20">

                                    <h4>Billing &amp; Shipping</h4>

                                    <hr />

                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <label class="mt-0 fs-14 fw-400" for="billing_firstname">First Name </label>
                                            <input id="billing_firstname" name="billing_firstname" type="text" class="form-control required" />
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <label class="mt-0 fs-14 fw-400" for="billing_lastname">Last Name </label>
                                            <input id="billing_lastname" name="billing_lastname" type="text" class="form-control required" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <label class="mt-0 fs-14 fw-400" for="billing_email">Email </label>
                                            <input id="billing_email" name="billing_email" type="text" class="form-control required" />
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <label class="mt-0 fs-14 fw-400" for="billing_phone">Phone </label>
                                            <input id="billing_phone" name="billing_phone" type="text" class="form-control required" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <label class="mt-0 fs-14 fw-400" for="billing_address1">Address </label>
                                            <input id="billing_address" name="billing_address" type="text" class="form-control required" placeholder="Address " />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <label class="mt-0 fs-14 fw-400" for="billing_city">City </label>
                                            <input id="billing_city" name="billing_city" type="text" class="form-control required" />
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <label class="mt-0 fs-14 fw-400" for="billing_state">State/Province </label>
                                            <select id="billing_state" name="billing_state" class="form-control pointer required">
                                                <option value="Alabama">Alabama</option>
                                                <option value="Alaska">Alaska</option>
                                                <option value="Arizona">Arizona</option>
                                                <option value="Arkansas">Arkansas</option>
                                                <option value="California">California</option>
                                                <option value="Colorado">Colorado</option>
                                                <option value="Connecticut">Connecticut</option>
                                                <option value="Delaware">Delaware</option>
                                                <option value="Florida">Florida</option>
                                                <option value="Georgia">Georgia</option>
                                                <option value="Hawaii">Hawaii</option>
                                                <option value="Idaho">Idaho</option>
                                                <option value="Illinois">Illinois</option>
                                                <option value="Indiana">Indiana</option>
                                                <option value="Iowa">Iowa</option>
                                                <option value="Kansas">Kansas</option>
                                                <option value="Kentucky">Kentucky</option>
                                                <option value="Louisiana">Louisiana</option>
                                                <option value="Maine">Maine</option>
                                                <option value="Maryland">Maryland</option>
                                                <option value="Massachusetts">Massachusetts</option>
                                                <option value="Michigan">Michigan</option>
                                                <option value="Minnesota">Minnesota</option>
                                                <option value="Mississippi">Mississippi</option>
                                                <option value="Missouri">Missouri</option>
                                                <option value="Montana">Montana</option>
                                                <option value="Nebraska">Nebraska</option>
                                                <option value="Nevada">Nevada</option>
                                                <option value="New Hampshire">New Hampshire</option>
                                                <option value="New Jersey">New Jersey</option>
                                                <option value="New Mexico">New Mexico</option>
                                                <option value="New York">New York</option>
                                                <option value="North Carolina">North Carolina</option>
                                                <option value="North Dakota">North Dakota</option>
                                                <option value="Ohio">Ohio</option>
                                                <option value="Oklahoma">Oklahoma</option>
                                                <option value="Oregon">Oregon</option>
                                                <option value="Pennsylvania">Pennsylvania</option>
                                                <option value="Rhode Island">Rhode Island</option>
                                                <option value="South Carolina">South Carolina</option>
                                                <option value="South Dakota">South Dakota</option>
                                                <option value="Tennessee">Tennessee</option>
                                                <option value="Texas">Texas</option>
                                                <option value="Utah">Utah</option>
                                                <option value="Vermont">Vermont</option>
                                                <option value="Virginia">Virginia</option>
                                                <option value="Washington">Washington</option>
                                                <option value="West Virginia">West Virginia</option>
                                                <option value="Wisconsin">Wisconsin</option>
                                                <option value="Wyoming">Wyoming</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 col-sm-6">
                                            <label class="mt-0 fs-14 fw-400" for="billing_zipcode">Zip/Postal Code </label>
                                            <input id="billing_zipcode" name="billing_zipcode" type="text" class="form-control required" />
                                            <label id="billing_zipcode-error" class="error" for="billing_zipcode">The specified US ZIP Code is invalid</label>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-12 m-0 clearfix">
                                            <label class="mt-0 fs-14 fw-400 checkbox float-left"><!-- see assets/js/view/demo.shop.js - CHECKOUT section -->
                                                <input id="shipswitch" name="shipping_same_as_billing" type="checkbox" value="1" checked="checked" />
                                                <i></i> <span class="fw-300">Ship to the same address</span>
                                            </label>
                                        </div>

                                    </div>

                                </fieldset>
                                <!-- /BILLING -->


                                <!-- SHIPPING -->
                                <fieldset id="shipping" class="hide mt-40">
                                    <div class="box-border-shadow p-20">

                                        <h4>Shipping Address</h4>

                                        <hr />

                                        <div class="row">
                                            <div class="col-md-6 col-sm-6">
                                                <label class="mt-0 fs-14 fw-400" for="shipping:firstname">First Name </label>
                                                <input id="shipping_firstname" name="shipping_firstname" type="text" class="form-control required" />
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <label class="mt-0 fs-14 fw-400" for="shipping:lastname">Last Name </label>
                                                <input id="shipping_lastname" name="shipping_lastname" type="text" class="form-control required" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 col-sm-6">
                                                <label class="mt-0 fs-14 fw-400" for="shipping:email">Email </label>
                                                <input id="shipping_email" name="shipping_email" type="text" class="form-control required" />
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <label class="mt-0 fs-14 fw-400" for="shipping:phone">Phone </label>
                                                <input id="shipping_phone" name="shipping_phone" type="text" class="form-control required" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <label class="mt-0 fs-14 fw-400" for="shipping:address1">Address </label>
                                                <input id="shipping_address" name="shipping_address" type="text" class="form-control required" placeholder="Address" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 col-sm-6">
                                                <label class="mt-0 fs-14 fw-400" for="shipping:city">City </label>
                                                <input id="shipping_city" name="shipping_city" type="text" class="form-control required" />
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <label class="mt-0 fs-14 fw-400" for="shipping:state">State/Province </label>
                                                <select id="shipping_state" name="shipping_state" class="form-control pointer required">
                                                    <option value="Alabama">Alabama</option>
                                                    <option value="Alaska">Alaska</option>
                                                    <option value="Arizona">Arizona</option>
                                                    <option value="Arkansas">Arkansas</option>
                                                    <option value="California">California</option>
                                                    <option value="Colorado">Colorado</option>
                                                    <option value="Connecticut">Connecticut</option>
                                                    <option value="Delaware">Delaware</option>
                                                    <option value="Florida">Florida</option>
                                                    <option value="Georgia">Georgia</option>
                                                    <option value="Hawaii">Hawaii</option>
                                                    <option value="Idaho">Idaho</option>
                                                    <option value="Illinois">Illinois</option>
                                                    <option value="Indiana">Indiana</option>
                                                    <option value="Iowa">Iowa</option>
                                                    <option value="Kansas">Kansas</option>
                                                    <option value="Kentucky">Kentucky</option>
                                                    <option value="Louisiana">Louisiana</option>
                                                    <option value="Maine">Maine</option>
                                                    <option value="Maryland">Maryland</option>
                                                    <option value="Massachusetts">Massachusetts</option>
                                                    <option value="Michigan">Michigan</option>
                                                    <option value="Minnesota">Minnesota</option>
                                                    <option value="Mississippi">Mississippi</option>
                                                    <option value="Missouri">Missouri</option>
                                                    <option value="Montana">Montana</option>
                                                    <option value="Nebraska">Nebraska</option>
                                                    <option value="Nevada">Nevada</option>
                                                    <option value="New Hampshire">New Hampshire</option>
                                                    <option value="New Jersey">New Jersey</option>
                                                    <option value="New Mexico">New Mexico</option>
                                                    <option value="New York">New York</option>
                                                    <option value="North Carolina">North Carolina</option>
                                                    <option value="North Dakota">North Dakota</option>
                                                    <option value="Ohio">Ohio</option>
                                                    <option value="Oklahoma">Oklahoma</option>
                                                    <option value="Oregon">Oregon</option>
                                                    <option value="Pennsylvania">Pennsylvania</option>
                                                    <option value="Rhode Island">Rhode Island</option>
                                                    <option value="South Carolina">South Carolina</option>
                                                    <option value="South Dakota">South Dakota</option>
                                                    <option value="Tennessee">Tennessee</option>
                                                    <option value="Texas">Texas</option>
                                                    <option value="Utah">Utah</option>
                                                    <option value="Vermont">Vermont</option>
                                                    <option value="Virginia">Virginia</option>
                                                    <option value="Washington">Washington</option>
                                                    <option value="West Virginia">West Virginia</option>
                                                    <option value="Wisconsin">Wisconsin</option>
                                                    <option value="Wyoming">Wyoming</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 col-sm-6">
                                                <label class="mt-0 fs-14 fw-400" for="shipping:zipcode">Zip/Postal Code </label>
                                                <input id="shipping_zipcode" name="shipping_zipcode" type="text" class="form-control required" />
                                            </div>
                                        </div>


                                    </div>
                                </fieldset>
                                <!-- /SHIPPING -->

                            </div>



                            <div class="col-lg-5 col-sm-5">
                                <!-- CREDIT CARD PAYMENT -->
                                <fieldset class="box-border-shadow p-20">
                                    <h4>Payment Method</h4>
                                    <hr />
                                    <div class="toggle-transparent toggle-bordered-full clearfix">
                                        <div class="toggle active">
                                            <div class="toggle-content"  style="background-color: white">

                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <label class="mt-0 fs-14 fw-400" for="payment:name">Name on Card </label>
                                                        <input id="payment_name" name="payment_name" type="text" class="form-control required" autocomplete="off" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <label class="mt-0 fs-14 fw-400" for="payment:name">Credit Card Type </label>
                                                        <select id="payment_state" name="payment_state" class="form-control pointer required">
                                                            <option value="">Select...</option>
                                                            <option value="American Express">American Express</option>
                                                            <option value="Visa">Visa</option>
                                                            <option value="Mastercard">Mastercard</option>
                                                            <option value="Discover">Discover</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <label class="mt-0 fs-14 fw-400" for="payment:cc_number">Credit Card Number </label>
                                                        <input id="payment_cc_number" name="payment_cc_number" type="text" class="form-control required" autocomplete="off" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <label class="mt-0 fs-14 fw-400" for="payment:cc_exp_month">Card Expiration </label>

                                                        <div class="row m-0-bottom">
                                                            <div class="col-lg-6 col-sm-6">
                                                                <select id="payment_cc_exp_month" name="payment_cc_exp_month" class="form-control pointer required">
                                                                    <option value="">Month</option>
                                                                    <option value="01">01 - January</option>
                                                                    <option value="02">02 - February</option>
                                                                    <option value="03">03 - March</option>
                                                                    <option value="04">04 - April</option>
                                                                    <option value="05">05 - May</option>
                                                                    <option value="06">06 - June</option>
                                                                    <option value="07">07 - July</option>
                                                                    <option value="08">08 - August</option>
                                                                    <option value="09">09 - September</option>
                                                                    <option value="10">10 - October</option>
                                                                    <option value="11">11 - November</option>
                                                                    <option value="12">12 - December</option>
                                                                </select>
                                                            </div>

                                                            <div class="col-lg-6 col-sm-6">
                                                                <select id="payment_cc_exp_year" name="payment_cc_exp_year" class="form-control pointer required">
                                                                    <option value="">Year</option>
                                                                    <option value="2017">2017</option>
                                                                    <option value="2018">2018</option>
                                                                    <option value="2019">2019</option>
                                                                    <option value="2020">2020</option>
                                                                    <option value="2021">2021</option>
                                                                    <option value="2022">2022</option>
                                                                    <option value="2023">2023</option>
                                                                    <option value="2024">2024</option>
                                                                    <option value="2025">2025</option>
                                                                </select>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <label class="mt-0 fs-14 fw-400" for="payment:cc_cvv">CVV2 </label>
                                                        <input id="payment_cc_cvv" name="payment_cc_cvv" type="text" class="form-control required" autocomplete="off" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </fieldset>
                                <!-- /CREDIT CARD PAYMENT -->


                                <!-- TOTAL / PLACE ORDER -->
                                <div class="toggle-transparent toggle-bordered-full clearfix">
                                    <div class="toggle active">
                                        <div class="toggle-content">

                                            <span class="clearfix">
                                                <span class="float-right">$120.75</span>
                                                <strong class="float-left">Subtotal:</strong>
                                            </span>
                                            <span class="clearfix">
                                                <span class="float-right">$0.00</span>
                                                <span class="float-left">Discount:</span>
                                            </span>
                                            <span class="clearfix">
                                                <span class="float-right">$0.00</span>
                                                <span class="float-left">Shipping:</span>
                                            </span>

                                            <hr />

                                            <span class="clearfix">
                                                <span class="float-right fs-20">$128.75</span>
                                                <strong class="float-left">TOTAL:</strong>
                                            </span>

                                            <hr />

                                            <button type="submit" class="btn btn-primary btn-lg btn-block fs-15"><i class="fa fa-mail-forward"></i> Place Order Now</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /TOTAL / PLACE ORDER -->

                        </form>
                    </div>
                    <!-- /CHECKOUT -->

                </div>
            </section>
            <!-- /CHECKOUT -->


        </div>
        <!-- /wrapper -->









        <!-- FOOTER -->
        <footer id="footer" class="footer-light">
            <div class="container pt-0 pb-0">

                <div class="row mt-60 mb-0 fs-13">

                    <!-- col #1 -->
                    <div class="col-md-4 col-sm-4 mb-0">

                        <!-- Footer Logo -->
                        <img class="footer-logo" src="demo_files/pj/logo.png" alt="" height="60" />

                        <p>
                            We offer competitive prices on our 10 million plus product range. We ship to over 200 countries!
                        </p>


                        <!-- Newsletter Form -->
                        <h4 class="letter-spacing-1 mb-10">KEEP IN TOUCH</h4>

                        <form class="validate" action="php/newsletter.php" method="post" data-success="Subscribed! Thank you!" data-toastr-position="bottom-right">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <input type="email" id="email" name="email" class="form-control required" placeholder="Enter your Email">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="submit">Subscribe</button>
                                </span>
                            </div>
                        </form>
                        <!-- /Newsletter Form -->


                        <!-- Social Icons -->
                        <div class="clearfix">

                            <a href="#" class="social-icon social-icon-sm social-icon-border social-facebook float-left" data-toggle="tooltip" data-placement="top" title="Facebook">
                                <i class="icon-facebook"></i>
                                <i class="icon-facebook"></i>
                            </a>

                            <a href="#" class="social-icon social-icon-sm social-icon-border social-twitter float-left" data-toggle="tooltip" data-placement="top" title="Twitter">
                                <i class="icon-twitter"></i>
                                <i class="icon-twitter"></i>
                            </a>

                            <a href="#" class="social-icon social-icon-sm social-icon-border social-gplus float-left" data-toggle="tooltip" data-placement="top" title="Google plus">
                                <i class="icon-gplus"></i>
                                <i class="icon-gplus"></i>
                            </a>

                            <a href="#" class="social-icon social-icon-sm social-icon-border social-linkedin float-left" data-toggle="tooltip" data-placement="top" title="Linkedin">
                                <i class="icon-linkedin"></i>
                                <i class="icon-linkedin"></i>
                            </a>

                            <a href="#" class="social-icon social-icon-sm social-icon-border social-pinterest float-left" data-toggle="tooltip" data-placement="top" title="Rss">
                                <i class="icon-pinterest"></i>
                                <i class="icon-pinterest"></i>
                            </a>

                        </div>
                        <!-- /Social Icons -->


                    </div>
                    <!-- /col #1 -->

                    <!-- col #2 -->
                    <div class="col-md-8 col-sm-8 mb-0">

                        <div class="row">

                            <div class="col-md-5 hidden-sm hidden-xs-down">
                                <h4 class="letter-spacing-1">RECENT NEWS</h4>
                                <ul class="list-unstyled footer-list half-paddings">
                                    <li>
                                        <a class="block" href="#">New CSS3 Transitions this Year</a>
                                        <small>June 29, 2017</small>
                                    </li>
                                    <li>
                                        <a class="block" href="#">Inteligent Transitions In UX Design</a>
                                        <small>June 29, 2017</small>
                                    </li>
                                    <li>
                                        <a class="block" href="#">Lorem Ipsum Dolor</a>
                                        <small>June 29, 2017</small>
                                    </li>
                                    <li>
                                        <a class="block" href="#">New CSS3 Transitions this Year</a>
                                        <small>June 29, 2017</small>
                                    </li>
                                </ul>
                            </div>

                            <div class="col-md-3 hidden-sm hidden-xs-down">
                                <h4 class="letter-spacing-1">EXPLORE</h4>
                                <ul class="list-unstyled footer-list half-paddings b-0">
                                    <li><a class="block" href="#"><i class="fa fa-angle-right"></i> Customer Service</a></li>
                                    <li><a class="block" href="#"><i class="fa fa-angle-right"></i> Making Payments</a></li>
                                    <li><a class="block" href="#"><i class="fa fa-angle-right"></i> New User Guide</a></li>
                                    <li><a class="block" href="#"><i class="fa fa-angle-right"></i> Buyer Protection</a></li>
                                    <li><a class="block" href="#"><i class="fa fa-angle-right"></i> Delivery Options</a></li>
                                    <li><a class="block" href="#"><i class="fa fa-angle-right"></i> Partnerships</a></li>
                                    <li><a class="block" href="#"><i class="fa fa-angle-right"></i> Affiliate Program</a></li>
                                </ul>
                            </div>

                            <div class="col-md-4 mb-0">
                                <h4 class="letter-spacing-1">SECURE PAYMENTS</h4>
                                <p>Donec tellus massa, tristique sit amet condim vel, facilisis quis sapien. Praesent id enim sit amet.</p>
                                <p>	<!-- see assets/images/_smarty/cc/ for more icons -->
                                    <img src="assets/images/_smarty/cc/Visa.png" alt="" />
                                    <img src="assets/images/_smarty/cc/Mastercard.png" alt="" />
                                    <img src="assets/images/_smarty/cc/Maestro.png" alt="" />
                                    <img src="assets/images/_smarty/cc/PayPal.png" alt="" />
                                </p>
                            </div>

                        </div>

                    </div>
                    <!-- /col #2 -->

                </div>

            </div>

            <div class="copyright">
                <div class="container">
                    <ul class="float-right m-0 list-inline mobile-block">
                        <li><a href="#">Terms &amp; Conditions</a></li>
                        <li>&bull;</li>
                        <li><a href="#">Privacy</a></li>
                    </ul>
                    &copy; All Rights Reserved, Company LTD
                </div>
            </div>
        </footer>
        <!-- /FOOTER -->




        <!-- SCROLL TO TOP -->
        <a href="#" id="toTop"></a>


        <!-- PRELOADER -->
        <div id="preloader">
            <div class="inner">
                <span class="loader"></span>
            </div>
        </div><!-- /PRELOADER -->


        <!-- JAVASCRIPT FILES -->
        <script type="text/javascript">var plugin_path = 'assets/plugins/';</script>
        <script type="text/javascript" src="assets/plugins/jquery/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="assets/plugins/form.validate/jquery.validation.min.js"></script>


        <script type="text/javascript" src="assets/js/scripts.js"></script>

        <!-- PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="assets/js/view/demo.shop.js"></script>
        <script type="text/javascript" src="assets/js/checkout.js"></script>
        <script type="text/javascript" src="assets/js/search_setting.js"></script>



    </body>
</html>