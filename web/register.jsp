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
        <link href="https://fonts.googleapis.com/css?family=Cairo:300,400,600%7CRaleway:300,400,500,600,700%7CLato:300,400,400italic,600,700"
              rel="stylesheet" type="text/css" />

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
                <a class="header-logo" href="pack-megashop-home-1.html">
                    <img src="demo_files/pj/logo.png" height="30" alt="">
                </a>


                <!--
                                                    + LAYOUT
                                                            .header-buttons-bordered
                -->
                <ul class="list-inline header-buttons">
                    <li class="list-inline-item">
                        <a href="pack-megashop-cart.html">
                            <i class="fa fa-opencart"></i>
                            my cart
                        </a>
                    </li>
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
                            <a class="dropdown-item" href="pack-megashop-account-orders.html">My Orders</a>
                            <a class="dropdown-item" href="pack-megashop-account-settings.html">Account Settings</a>
                            <a class="dropdown-item dropdown-custom-icon dropdown-myaccount-logout" href="Authentication?logout=true">
                                <i class="fa fa-power-off"></i>
                                <b>Log Out</b>
                            </a>
                            <%}%>
                        </div>
                    </li>
                </ul>

                <form action="#" method="get" class="search-global hidden-sm-down">
                    <select class="custom-select" name="scope" id="search-scope">
                        <option selected value="0">All Categories</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                    <input type="text" name="s" class="form-control" placeholder="I want to find the book of this title...">
                    <button class="btn btn-default" type="submit">
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
                                <form action="#" method="get" class="search-global input-group mb-0">
                                    <input type="text" name="s" class="form-control" placeholder="Book title...">
                                    <button class="btn btn-default" type="submit">
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

                            <li class="main-nav-item">
                                <a href="#" class="text-danger">
                                    <i class="fa fa-circle-o-notch text-danger"></i> MEGASHOP PAGES
                                </a>
                            </li>

                            <li class="main-nav-item main-nav-expanded">
                                <a href="#">
                                    <i class="fa fa-circle-o-notch"></i> Men's Clothing
                                </a>
                            </li>

                            <li class="main-nav-item main-nav-expanded">
                                <a href="#">
                                    <i class="fa fa-circle-o-notch text-warning"></i> Sports &amp; Outdoor
                                </a>
                            </li>

                            <li class="main-nav-item main-nav-expanded">
                                <a href="#">
                                    <i class="fa fa-circle-o-notch text-info"></i> Baby Toys
                                </a>
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

                <h1>Sign Up</h1>

                <!-- breadcrumbs -->
                <ol class="breadcrumb">
                    <li>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Contact Us</li>
                </ol>
                <!-- /breadcrumbs -->

            </div>
        </section>
        <!-- /PAGE HEADER -->








        <!-- wrapper -->
        <div id="wrapper">


            <!-- CONTENT -->
            <section>
                <div class="container">

                    <div class="row">


                        <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">

                            <!--
                                                            <div class="alert alert-danger shadow-1">
                                                                    Email and/or password incorrect!
                                                            </div>
                            -->

                            <form id="register-form" class="box-border-shadow p-20" method="post" action="#">

                                <h2 class="fs-13 fw-600 mb-15">PLEASE FILL IN THE FORM:</h2>

                                <hr>

                                <label class="fs-12 fw-600">USERNAME</label>
                                <input required type="text" class="form-control" name="username" id="username" tabindex="1">
                                <div style="display:none" class="alert alert-primary" id="username-invalid" role="alert">
                                    Invalid username.
                                    <br/> Username should only contain letters and numbers.
                                </div>

                                <label class="fs-12 fw-600">EMAIL</label>
                                <input required type="email" class="form-control" name="user_email" id="email" tabindex="2">
                                <div style="display:none" class="alert alert-primary" id="email-invalid" role="alert">
                                    Invalid Email address.
                                    <br/>
                                </div>


                                <label class="fs-12 fw-600">PASSWORD</label>
                                <input required type="password" class="form-control" name="user_password1" id="pwd" tabindex="3">

                                <label class="fs-12 fw-600">PASSWORD AGAIN</label>
                                <input required type="password" class="form-control" name="user_password2" id="pwdr" tabindex="4">

                                <div style="display:none" class="alert alert-primary" id="pwd-mat" role="alert">
                                    Password does not match
                                </div>

                                <label class="fs-12 fw-600">STREET ADDRESS</label>
                                <input required type="text" class="form-control" name="street_address" id="stadd" tabindex="5">

                                <div class="row">

                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label class="fs-12 fw-600">CITY</label>
                                        <input required type="text" class="form-control" name="city" id="city" tabindex="6">
                                    </div>

                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label class="fs-12 fw-600">ZIPCODE</label>
                                        <input required type="text" class="form-control" name="zip" id="zip" tabindex="7">
                                    </div>

                                </div>

                                <div style="display:none" class="alert alert-primary" id="zip-invalid" role="alert">
                                    Invalid zipcode.
                                    <br/>
                                </div>

                                <label class="fs-12 fw-600">STATE</label>
                                <select required class="custom-select form-control" name="state" id="state" tabindex="8">
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

                                <label class="fs-12 fw-600">ACCOUNT TYPE</label>
                                <select required class="custom-select form-control" name="account_type" id="account_type" tabindex="9">
                                    <option selected value="">Type</option>
                                    <option value="Home">Home</option>
                                    <option value="Business">Business</option>
                                </select>

                                <button type="button" class="btn btn-primary btn-v1 mt-8 inline-block" tabindex="4" id="submit-btn" disabled="true">SIGN ME UP</button>

                                <br />
                                <br />

                                <div style="display:none" class="alert alert-primary" id="username-exists" role="alert">
                                    Username already exists.
                                </div>
                            </form>

                            <div id="form-hidden-part">

                                <div class="type-home" style="display:none">

                                    <div class="row">

                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                            <label class="fs-12 fw-600">FIRST NAME</label>
                                            <input required type="text" class="form-control" name="user_fname" id="fname" tabindex="10">
                                        </div>


                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                            <label class="fs-12 fw-600">LAST NAME</label>
                                            <input required type="text" class="form-control" name="user_lname" id="lname" tabindex="11">
                                        </div>

                                    </div>

                                    <label class="fs-12 fw-600">GENDER</label>
                                    <select class="custom-select form-control" name="gender" id="gender" tabindex="12">
                                        <option selected value="M">Male</option>
                                        <option value="F">Female</option>
                                        <option value="O">Other</option>
                                    </select>

                                    <label class="fs-12 fw-600">MARRIAGE</label>
                                    <select class="custom-select form-control" name="marriage" id="marriage" tabindex="13">
                                        <option selected value="M">Married</option>
                                        <option value="S">Single</option>
                                        <option value="O">Other</option>
                                    </select>

                                    <label class="fs-12 fw-600">AGE</label>
                                    <input required type="number" class="form-control" name="age" min="1" id="age" tabindex="14">


                                    <label class="fs-12 fw-600">MONTHLY INCOME</label>
                                    <input required type="number" class="form-control" name="income" min="0" id="mincome" tabindex="15">

                                </div>

                                <div class="type-business" style="display:none">

                                    <label class="fs-12 fw-600">COMPANY NAME</label>
                                    <input required type="text" class="form-control" name="company_name" id="cname" tabindex="10">

                                    <label class="fs-12 fw-600">ANNUAL INCOME</label>
                                    <input required type="number" class="form-control" name="income" min="0" id="aincome" tabindex="11">

                                    <label class="fs-12 fw-600">INDUSTRY</label>
                                    <input required type="text" class="form-control" name="industry" id="industry" tabindex="12">

                                </div>

                            </div>

                        </div>



                    </div>


                </div>
            </section>
            <!-- /CONTENT -->


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
        </div>
        <!-- /PRELOADER -->


        <!-- JAVASCRIPT FILES -->
        <script type="text/javascript">
            var plugin_path = 'assets/plugins/';
        </script>
        <script type="text/javascript" src="assets/plugins/jquery/jquery-3.2.1.min.js"></script>

        <script type="text/javascript" src="assets/js/scripts.js"></script>

        <!-- PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="assets/js/view/demo.shop.js"></script>
        <script type="text/javascript" src="assets/js/register.js"></script>
    </body>

</html>