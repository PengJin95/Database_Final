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
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600%7CRaleway:300,400,500,600,700%7CLato:300,400,400italic,600,700"
              rel="stylesheet" type="text/css" />

        <!-- CORE CSS -->
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

        <!-- THEME CSS -->
        <link href="assets/css/essentials.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/layout.css" rel="stylesheet" type="text/css" />

        <!-- PAGE LEVEL SCRIPTS -->
        <link href="assets/css/header-6.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/layout-shop.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/color_scheme/green.css" rel="stylesheet" type="text/css" id="color_scheme" />
        <link href="assets/css/custom-forms-v2.css" rel="stylesheet" type="text/css" />
    </head>

    <!--
                    AVAILABLE BODY CLASSES:
                    
                    smoothscroll 			= create a browser smooth scroll
                    enable-animation		= enable WOW animations
    
                    bg-grey					= grey background
                    grain-grey				= grey grain background
                    grain-blue				= blue grain background
                    grain-green				= green grain background
                    grain-blue				= blue grain background
                    grain-orange			= orange grain background
                    grain-yellow			= yellow grain background
                    
                    boxed 					= boxed layout
                    pattern1 ... patern11	= pattern background
                    menu-vertical-hide		= hidden, open on click
                    
                    BACKGROUND IMAGE [together with .boxed class]
                    data-background="assets/images/_smarty/boxed_background/1.jpg"
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


        <!-- wrapper -->
        <div id="wrapper" class="mt-60">




            <!-- 
                            PAGE HEADER 
                            
                            CLASSES:
                                    .page-header-xs	= 20px margins
                                    .page-header-md	= 50px margins
                                    .page-header-lg	= 80px margins
                                    .page-header-xlg= 130px margins
                                    .dark			= dark page header

                                    .shadow-before-1 	= shadow 1 header top
                                    .shadow-after-1 	= shadow 1 header bottom
                                    .shadow-before-2 	= shadow 2 header top
                                    .shadow-after-2 	= shadow 2 header bottom
                                    .shadow-before-3 	= shadow 3 header top
                                    .shadow-after-3 	= shadow 3 header bottom
            -->
            <section class="page-header page-header-xs">
                <div class="container">

                    <h1 id="book-title"></h1>
                    <span id="author-list"></span>
                    <!-- breadcrumbs -->
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li>
                            <a href="#">Shop</a>
                        </li>
                    </ol>
                    <!-- /breadcrumbs -->

                </div>
            </section>
            <!-- /PAGE HEADER -->




            <!-- -->
            <section>
                <div class="container">

                    <div class="row">

                        <!-- RIGHT -->
                        <div class="col-lg-9 col-md-9 col-sm-9">

                            <div class="row">

                                <!-- IMAGE -->
                                <div class="col-lg-6 col-sm-6">

                                    <div class="thumbnail relative mb-3">

                                        <!-- 
                                                        IMAGE ZOOM 
                                                        
                                                        data-mode="mouseover|grab|click|toggle"
                                        -->
                                        <figure id="zoom-primary" class="zoom" data-mode="mouseover">
                                            <!-- 
                                                            zoom buttton
                                                            
                                                            positions available:
                                                                    .bottom-right
                                                                    .bottom-left
                                                                    .top-right
                                                                    .top-left
                                            -->


                                            <!-- 
                                                            image 
                                                            
                                                            Extra: add .image-bw class to force black and white!
                                            -->
                                            <img class="img-fluid" style="width: 1200px !important" height="1500" alt="This is the product title" />
                                        </figure>

                                    </div>


                                </div>
                                <!-- /IMAGE -->

                                <!-- ITEM DESC -->
                                <div class="col-lg-6 col-sm-6">

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        
                                    </div>
                                    <!-- /price -->

                                    <hr />

                                    <div class="clearfix mb-30">
                                        <span class="float-right text-success">
                                            <i class="fa fa-check"></i> In Stock
                                        </span>

                                        <span class="float-right text-default">
                                            <i class="fa fa-close"></i> Out of Stock
                                        </span>

                                        <!--
                                                <span class="float-right text-danger"><i class="fa fa-remove"></i> Out of Stock</span>
                                        -->
                                        <strong>ISBN:</strong>
                                        <span id="ISBN"></span>
                                    </div>


                                    <!-- short description -->
                                    <table class="table table-hover">
                                        <tbody>
                                            <tr>
                                                <td>Format</td>
                                                <td id="format"></td>
                                            </tr>
                                            <tr>
                                                <td>Language</td>
                                                <td id="language"></td>
                                            </tr>
                                            <tr>
                                                <td>Publisher</td>
                                                <td id="publisher"></td>
                                            </tr>
                                            <tr>
                                                <td>Release Date</td>
                                                <td id="release_date"></td>
                                            </tr>
                                            <tr>
                                                <td>Version</td>
                                                <td id="version"></td>
                                            </tr>
                                            <tr>
                                                <td>Category</td>
                                                <td id="book_category"></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <!-- /short description -->





                                    <hr />

                                    <!-- FORM -->
                                    <form class="clearfix form-inline m-0">
                                        <input type="hidden" name="product_id" value="1" /> Qty:
                                        <input type="number" id="quantity" name="quantity" class="form-control mb-0 ml-15 mr-15" min="1" value="1">
                                        <input type="text" style="display:none">
                                        <button  type="button" class="btn btn-primary float-left product-add-cart " <%=session.getAttribute("cid")==null?"disabled":""%>><%=session.getAttribute("cid")==null?"Please login":"Add to cart"%></button>
                                       

                                    </form>
                                    <!-- /FORM -->

                                </div>
                                <!-- /ITEM DESC -->

                            </div>



                            <ul id="myTab" class="nav nav-tabs nav-top-border mt-80" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#description" data-toggle="tab">Overview</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#reviews" data-toggle="tab">Send us a message</a>
                                </li>
                            </ul>


                            <div class="tab-content pt-20">
                                <!-- DESCRIPTION -->
                                <div role="tabpanel" class="tab-pane active" id="description">
                                    <p>Welcome to Scientific Python and its community. If you’re a scientist who programs with Python, this practical guide
                                        not only teaches you the fundamental parts of SciPy and libraries related to it, but also gives you a taste for
                                        beautiful, easy-to-read code that you can use in practice. You’ll learn how to write elegant code that’s clear,
                                        concise, and efficient at executing the task at hand.</p>
                                    <p>Throughout the book, you’ll work with examples from the wider scientific Python ecosystem, using code that illustrates
                                        principles outlined in the book. Using actual scientific data, you’ll work on real-world problems with SciPy, NumPy,
                                        Pandas, scikit-image, and other Python libraries.</p>
                                    <ul>
                                        <li>Explore the NumPy array, the data structure that underlies numerical scientific computation</li>
                                        <li>Use quantile normalization to ensure that measurements fit a specific distribution</li>
                                        <li>Represent separate regions in an image with a Region Adjacency Graph</li>
                                        <li>Convert temporal or spatial data into frequency domain data with the Fast Fourier Transform</li>
                                        <li>Solve sparse matrix problems, including image segmentations, with SciPy’s sparse module</li>
                                        <li>Perform linear algebra by using SciPy packages</li>
                                        <li>Explore image alignment (registration) with SciPy’s optimize module</li>
                                        <li>Process large datasets with Python data streaming primitives and the Toolz library</li>
                                    </ul>
                                </div>

                                <!-- REVIEWS -->
                                <div role="tabpanel" class="tab-pane fade" id="reviews">

                                    <!-- REVIEW FORM -->
                                    <form method="post" action="#" id="form">

                                        <!-- Comment -->
                                        <div class="mb-30">
                                            <textarea name="content" id="text" class="form-control" rows="6" placeholder="Content" maxlength="1000"></textarea>
                                        </div>

                                        <input type="text" style="display:none">
                                        <span id="text-encode" style="display:none"></span>
                                        <!-- Send Button -->
                                        <button type="button" class="btn btn-primary" id="message-btn" <%=session.getAttribute("cid")==null?"disabled":""%>>
                                            <%=session.getAttribute("cid")==null?"Please login":"Send the message"%></button>


                                    </form>
                                    <!-- /REVIEW FORM -->

                                </div>
                            </div>


                            <hr class="mt-80 mb-80" />


                        </div>


                        <!-- LEFT -->
                        <div class="col-lg-3 col-md-3 col-sm-3">

                            <!-- CATEGORIES -->
                            <div class="side-nav mb-60">

                                <div class="side-nav-head">
                                    <button class="fa fa-bars"></button>
                                    <h4>Store Information</h4>
                                </div>

                                <p>Store Name:
                                    <br/><span id="store_name">Pitt Store</span></p>
                                <p>Address:
                                    <br/><span id="store_address">4629 Bayard Street, Pittsburgh, PA.</span></p>
                                <p>Region:
                                    <br/><span id="store_region">North Oakland, Pittsburgh</span></p>

                            </div>
                            <!-- /CATEGORIES -->

                            <!-- CATEGORIES -->
                            <div class="side-nav mb-60">

                                <div class="side-nav-head">
                                    <button class="fa fa-bars"></button>
                                    <h4>Other Sellers</h4>
                                </div>

                                <ul class="list-group list-group-bordered list-group-noicon uppercase">


                                </ul>

                            </div>
                            <!-- /CATEGORIES -->


                            <!-- BANNER ROTATOR -->
                            <div class="owl-carousel buttons-autohide controlls-over mb-60 text-center" data-plugin-options='{"singleItem": true, "autoPlay": 4000, "navigation": true, "pagination": false, "transitionStyle":"fadeUp"}'>
                                <a href="#">
                                    <img class="img-fluid" src="demo_files/images/shop/banners/off_1.png" width="270" height="350" alt="">
                                </a>
                                <a href="#">
                                    <img class="img-fluid" src="demo_files/images/shop/banners/off_2.png" width="270" height="350" alt="">
                                </a>
                            </div>
                            <!-- /BANNER ROTATOR -->


                            <!-- FEATURED -->
                            <div class="mb-60">

                                <h2 class="owl-featured">FEATURED</h2>
                                <div class="owl-carousel featured" data-plugin-options='{"singleItem": true, "stopOnHover":false, "autoPlay":false, "autoHeight": false, "navigation": true, "pagination": false}'>

                                    <div>
                                        <!-- SLIDE 1 -->
                                        <ul class="list-unstyled m-0 p-0 text-left">

                                            <li class="clearfix">
                                                <!-- item -->
                                                <div class="thumbnail featured clearfix float-left">
                                                    <a href="#">
                                                        <img src="demo_files/pj/0.jpg" width="80" alt="featured item">
                                                    </a>
                                                </div>

                                                <a class="block fs-12" href="#">Harry Potter
                                                    <br>and the Sorcerer's Stone</a>
                                                <div class="fs-18 text-left">$78.00</div>
                                            </li>
                                            <!-- /item -->

                                            <li class="clearfix">
                                                <!-- item -->
                                                <div class="thumbnail featured clearfix float-left">
                                                    <a href="#">
                                                        <img src="demo_files/pj/0.jpg" width="80" alt="featured item">
                                                    </a>
                                                </div>

                                                <a class="block fs-12" href="#">Harry Potter and the Sorcerer's Stone</a>
                                                <div class="fs-18 text-left">$78.00</div>
                                            </li>
                                            <!-- /item -->

                                            <li class="clearfix">
                                                <!-- item -->
                                                <div class="thumbnail featured clearfix float-left">
                                                    <a href="#">
                                                        <img src="demo_files/pj/1.jpg" width="80" alt="featured item">
                                                    </a>
                                                </div>

                                                <a class="block fs-12" href="#">Harry Potter
                                                    <br>and the Sorcerer's Stone</a>
                                                <div class="fs-18 text-left">$78.00</div>
                                            </li>
                                            <!-- /item -->

                                        </ul>
                                    </div>
                                    <!-- /SLIDE 1 -->

                                    <div>
                                        <!-- SLIDE 2 -->
                                        <ul class="list-unstyled m-0 p-0 text-left">

                                            <li class="clearfix">
                                                <!-- item -->
                                                <div class="thumbnail featured clearfix float-left">
                                                    <a href="#">
                                                        <img src="demo_files/pj/2.jpg" width="80" alt="featured item">
                                                    </a>
                                                </div>

                                                <a class="block fs-12" href="#">Harry Potter
                                                    <br>and the Sorcerer's Stone</a>
                                                <div class="fs-18 text-left">$78.00</div>
                                            </li>
                                            <!-- /item -->

                                        </ul>
                                    </div>
                                    <!-- /SLIDE 2 -->

                                </div>

                            </div>
                            <!-- /FEATURED -->

                        </div>

                    </div>

                </div>
            </section>
            <!-- / -->



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
        </div>
        <!-- /wrapper -->


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
        <script type="text/javascript">var plugin_path = 'assets/plugins/';</script>
        <script type="text/javascript" src="assets/plugins/jquery/jquery-3.2.1.min.js"></script>

        <script type="text/javascript" src="assets/js/scripts.js"></script>

        <!-- PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="assets/js/view/demo.shop.js"></script>
        <script type="text/javascript" src="assets/js/product.js"></script>
        <script type="text/javascript" src="assets/js/search_setting.js"></script>
    </body>

</html>