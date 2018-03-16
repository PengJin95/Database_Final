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

        <!-- REVOLUTION SLIDER -->
        <link href="assets/plugins/slider.revolution/css/extralayers.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/slider.revolution/css/settings.css" rel="stylesheet" type="text/css" />

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
                                <h4 class="fs-13 fw-400 mb-10">Welcome to Cabinet Bookshop!</h4>
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


            <!-- REVOLUTION SLIDER -->
            <section id="slider" class="slider fullwidthbanner-container roundedcorners">
                <!--
                                            Navigation Styles:
                                            
                                                    data-navigationStyle="" theme default navigation
                                                    
                                                    data-navigationStyle="preview1"
                                                    data-navigationStyle="preview2"
                                                    data-navigationStyle="preview3"
                                                    data-navigationStyle="preview4"
                                                    
                                            Bottom Shadows
                                                    data-shadow="1"
                                                    data-shadow="2"
                                                    data-shadow="3"
                                                    
                                            Slider Height (do not use on fullscreen mode)
                                                    data-height="300"
                                                    data-height="350"
                                                    data-height="400"
                                                    data-height="450"
                                                    data-height="500"
                                                    data-height="550"
                                                    data-height="600"
                                                    data-height="650"
                                                    data-height="700"
                                                    data-height="750"
                                                    data-height="800"
                -->
                <div class="fullwidthbanner" data-height="550" data-navigationStyle="">
                    <ul class="hide">

                        <!-- SLIDE  -->
                        <li data-transition="fade" data-slotamount="1" data-masterspeed="1500" data-delay="10000" data-saveperformance="off" data-title="Slide"
                            style="background-color: #F6F6F6;">

                            <img src="demo_files/pj/christmas-md.jpg" alt="video" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat">

                            <div class="tp-caption customin ltl tp-resizeme revo-slider-caps-text uppercase" data-x="left" data-y="50" data-customin="x:-200;y:0;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="400" data-start="1000" data-easing="easeOutQuad" data-splitin="none" data-splitout="none"
                                 data-elementdelay="0.01" data-endelementdelay="0.1" data-endspeed="1000" data-endeasing="Power4.easeIn">
                                <img src="demo_files/pj/harry-potter-books.png" alt="Sale">
                            </div>

                            <div class="tp-caption customin ltl tp-resizeme text_white fw-400" data-x="643" data-y="75" data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1.3;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="700" data-start="1000" data-easing="easeOutQuad" data-splitin="none" data-splitout="none"
                                 data-elementdelay="0.01" data-endelementdelay="0.1" data-endspeed="1000" data-endeasing="Power4.easeIn"
                                 style=" color: #777;">
                                PREPARE FOR CHRISTMAS SALE
                            </div>

                            <div class="tp-caption customin ltl tp-resizeme large_bold_white" data-x="650" data-y="105" data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1.3;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="700" data-start="1200" data-easing="easeOutQuad" data-splitin="none" data-splitout="none"
                                 data-elementdelay="0.01" data-endelementdelay="0.1" data-endspeed="1000" data-endeasing="Power4.easeIn"
                                 style=" color: #333; max-width: 430px; white-space: normal; line-height: 1.15;">
                                30% Off all Harry Potter
                            </div>

                            <div class="tp-caption customin ltl tp-resizeme small_light_white font-lato fs-20" data-x="650" data-y="275" data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1.3;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="700" data-start="1400" data-easing="easeOutQuad" data-splitin="none" data-splitout="none"
                                 data-elementdelay="0.01" data-endelementdelay="0.1" data-endspeed="1000" data-endeasing="Power4.easeIn"
                                 style=" color: #333; max-width: 550px; white-space: normal; text-shadow:none;">
                                Fabulas definitiones ei pri per recteque hendrerit scriptorem in errem scribentur mel fastidii propriae philosophia cu mea.
                            </div>

                            <div class="tp-caption customin ltl tp-resizeme" data-x="650" data-y="375" data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1.3;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="700" data-start="1550" data-easing="easeOutQuad" data-splitin="none" data-splitout="none"
                                 data-elementdelay="0.01" data-endelementdelay="0.1" data-endspeed="1000" data-endeasing="Power4.easeIn">
                                <a href="search.jsp?name=Harry%20Potter" class="btn btn-primary btn-lg">
                                    <span>start shopping</span>
                                </a>
                            </div>
                        </li>

                        <!-- SLIDE  -->
                        <li data-transition="fade" data-slotamount="1" data-masterspeed="1000" data-saveperformance="off" data-title="Slide">

                            <img src="assets/images/_smarty/1x1.png" data-lazyload="demo_files/pj/41.jpg" alt="" data-bgfit="cover" data-bgposition="center top"
                                 data-bgrepeat="no-repeat" />

                            <div class="tp-dottedoverlay twoxtwo">
                                <!-- dotted overlay -->
                            </div>
                            <div class="overlay dark-3">
                                <!-- dark overlay [1 to 9 opacity] -->
                            </div>

                            <div class="tp-caption customin ltl tp-resizeme text_white" data-x="center" data-y="105" data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="800" data-start="1000" data-easing="easeOutQuad" data-splitin="none" data-splitout="none"
                                 data-elementdelay="0.01" data-endelementdelay="0.1" data-endspeed="1000" data-endeasing="Power4.easeIn"
                                 style="z-index: 10;">
                                <span class="fw-300">Book / Friends / Life</span>
                            </div>

                            <div class="tp-caption customin ltl tp-resizeme large_bold_white" data-x="center" data-y="155" data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="800" data-start="1200" data-easing="easeOutQuad" data-splitin="none" data-splitout="none"
                                 data-elementdelay="0.01" data-endelementdelay="0.1" data-endspeed="1000" data-endeasing="Power4.easeIn"
                                 style="z-index: 10;">
                                WELCOME TO Cabinet Bookshop
                            </div>

                            <div class="tp-caption customin ltl tp-resizeme small_light_white font-lato fs-20" data-x="center" data-y="245" data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="800" data-start="1400" data-easing="easeOutQuad" data-splitin="none" data-splitout="none"
                                 data-elementdelay="0.01" data-endelementdelay="0.1" data-endspeed="1000" data-endeasing="Power4.easeIn"
                                 style="z-index: 10; width: 100%; max-width: 750px; white-space: normal; text-align:center;">
                                Fabulas definitiones ei pri per recteque hendrerit scriptorem in errem scribentur mel fastidii propriae philosophia cu mea.
                            </div>

                            <div class="tp-caption customin ltl tp-resizeme" data-x="center" data-y="313" data-customin="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="800" data-start="1550" data-easing="easeOutQuad" data-splitin="none" data-splitout="none"
                                 data-elementdelay="0.01" data-endelementdelay="0.1" data-endspeed="1000" data-endeasing="Power4.easeIn"
                                 style="z-index: 10;">
                                <a href="search.jsp?name=Harry%20Potter" class="btn btn-default btn-lg">
                                    <span>start shopping &raquo;</span>
                                </a>
                            </div>
                        </li>

                        <!-- SLIDE  -->
                        <li data-transition="fade" data-slotamount="1" data-masterspeed="1000" data-saveperformance="off" data-title="Slide">
                            <img src="assets/images/_smarty/1x1.png" data-lazyload="demo_files/pj/44.jpg" alt="" data-bgposition="center center" data-kenburns="on"
                                 data-duration="10000" data-ease="Linear.easeNone" data-bgfit="100" data-bgfitend="110" />
                            <div class="tp-caption very_large_text ltl tp-resizeme customin" data-x="615" data-y="150" data-customin="x:50;y:0;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="800" data-start="1000" data-easing="easeOutQuad" data-splitin="none" data-splitout="none"
                                 data-elementdelay="0.01" data-endelementdelay="0.1" data-endspeed="1000" data-endeasing="Power4.easeIn">
                                FIND A BOOK
                            </div>

                            <div class="tp-caption medium_light_white ltl tp-resizeme customin" data-x="615" data-y="225" data-customin="x:50;y:0;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="800" data-start="1100" data-easing="easeOutQuad" data-splitin="none" data-splitout="none"
                                 data-elementdelay="0.01" data-endelementdelay="0.1" data-endspeed="1000" data-endeasing="Power4.easeIn">
                                Good friends, good books and
                                <br/>a sleepy conscience: this is the ideal life.
                                <br/>
                                <span style="font-size:24px;font-weight:400;">&ndash; Mark Twain</span>
                            </div>

                        </li>

                    </ul>
                    <div class="tp-bannertimer"></div>
                </div>
            </section>
            <!-- /REVOLUTION SLIDER -->






            <!-- INFO BAR -->
            <section class="info-bar info-bar-dark">
                <div class="container">

                    <div class="row">

                        <div class="col-sm-4">
                            <i class="glyphicon glyphicon-globe"></i>
                            <h3>FREE SHIPPING</h3>
                            <p>Free shipping on all orders.</p>
                        </div>

                        <div class="col-sm-4">
                            <i class="glyphicon glyphicon-usd"></i>
                            <h3>MONEY BACK GUARANTEE</h3>
                            <p>100% money back guarantee.</p>
                        </div>

                        <div class="col-sm-4">
                            <i class="glyphicon glyphicon-flag"></i>
                            <h3>CUSTOMER SUPPORT 24/7</h3>
                            <p>Contact us at any time.</p>
                        </div>

                    </div>

                </div>
            </section>
            <!-- /INFO BAR -->



            <!-- FEATURED -->
            <section>
                <div class="container">

                    <h2 class="owl-featured b-0">
                        <strong>FEATURED</strong> BOOKS</h2>
                    <div class="owl-carousel featured m-0 owl-padding-10" data-plugin-options='{"loop":true,"singleItem": false, "items": "4", "stopOnHover":false, "autoPlay":4000, "autoHeight": false, "navigation": true, "pagination": false}'>

                        <!-- item -->
                        <div class="shop-item m-0">
                            <div class="thumbnail">
                                <!-- product image(s) -->
                                <a class="shop-item-image" href="product.jsp?ISBN=439708184&sid=1">
                                    <img class="img-fluid" src="demo_files/pj/0.jpg" alt="shop first image" />
                                </a>
                                <!-- /product image(s) -->
                            </div>

                            <div class="shop-item-summary text-center">
                                <h2>Harry Potter
                                    <br>and the Sorcerer's Stone</h2>

                                <!-- price -->
                                <div class="shop-item-price">
                                    <span class="line-through">$10.00</span> $7.00
                                </div>
                                <!-- /price -->
                            </div>

                            <!-- buttons -->
                            <div class="shop-item-buttons text-center">
                                <a class="btn btn-default" href="product.jsp?ISBN=439708184&sid=1">
                                    <i class="fa fa-book"></i>More Details</a>
                            </div>
                            <!-- /buttons -->
                        </div>
                        <!-- /item -->

                        <!-- item -->
                        <div class="shop-item m-0">

                            <div class="thumbnail">
                                <!-- product image(s) -->
                                <a class="shop-item-image" href="product.jsp?ISBN=0439064872&sid=1">
                                    <img class="img-fluid" src="demo_files/pj/1.jpg" alt="shop first image" />
                                </a>
                                <!-- /product image(s) -->
                            </div>

                            <div class="shop-item-summary text-center">
                                <h2>Harry Potter
                                    <br>and the Chamber of Secrets</h2>

                                <!-- price -->
                                <div class="shop-item-price">
                                    <span class="line-through">$16.00</span> $11.20
                                </div>
                                <!-- /price -->
                            </div>

                            <!-- buttons -->
                            <div class="shop-item-buttons text-center">
                                <a class="btn btn-default" href="product.jsp?ISBN=0439064872&sid=1">
                                    <i class="fa fa-book"></i>More Details</a>
                            </div>
                            <!-- /buttons -->
                        </div>
                        <!-- /item -->

                        <!-- item -->
                        <div class="shop-item m-0">

                            <div class="thumbnail">
                                <!-- product image(s) -->
                                <a class="shop-item-image" href="product.jsp?ISBN=1408855917&sid=1">
                                    <img class="img-fluid" src="demo_files/pj/2.jpg" alt="shop first image" />
                                </a>
                                <!-- /product image(s) -->
                            </div>

                            <div class="shop-item-summary text-center">
                                <h2>Harry Potter
                                    <br>and the Prisoner of Azkaban</h2>

                                <!-- price -->
                                <div class="shop-item-price">
                                    <span class="line-through">$10.00</span> $7.00
                                </div>
                                <!-- /price -->
                            </div>

                            <!-- buttons -->
                            <div class="shop-item-buttons text-center">
                                <a class="btn btn-default" href="product.jsp?ISBN=1408855917&sid=1">
                                    <i class="fa fa-book"></i>More Details</a>
                            </div>
                            <!-- /buttons -->
                        </div>
                        <!-- /item -->

                        <!-- item -->
                        <div class="shop-item m-0">

                            <div class="thumbnail">
                                <!-- product image(s) -->
                                <a class="shop-item-image" href="product.jsp?ISBN=1523481498&sid=1">
                                    <img class="img-fluid" src="demo_files/pj/3.jpg" alt="shop first image" />
                                </a>
                                <!-- /product image(s) -->
                            </div>

                            <div class="shop-item-summary text-center">
                                <h2>Harry Potter
                                    <br> and the Goblet of Fire</h2>

                                <!-- price -->
                                <div class="shop-item-price">
                                    <span class="line-through">$10.00</span> $7.00
                                </div>
                                <!-- /price -->
                            </div>

                            <!-- buttons -->
                            <div class="shop-item-buttons text-center">
                                <a class="btn btn-default" href="product.jsp?ISBN=1523481498&sid=1">
                                    <i class="fa fa-book"></i>More Details</a>
                            </div>
                            <!-- /buttons -->
                        </div>
                        <!-- /item -->

                        <!-- item -->
                        <div class="shop-item m-0">

                            <div class="thumbnail">
                                <!-- product image(s) -->
                                <a class="shop-item-image" href="product.jsp?ISBN=0439358078&sid=1">
                                    <img class="img-fluid" src="demo_files/pj/4.jpg" alt="shop first image" />
                                </a>
                                <!-- /product image(s) -->
                            </div>

                            <div class="shop-item-summary text-center">
                                <h2>Harry Potter
                                    <br>and the Order of the Phoenix</h2>

                                <!-- price -->
                                <div class="shop-item-price">
                                    <span class="line-through">$10.00</span> $7.00
                                </div>
                                <!-- /price -->
                            </div>

                            <!-- buttons -->
                            <div class="shop-item-buttons text-center">
                                <a class="btn btn-default" href="product.jsp?ISBN=0439358078&sid=1">
                                    <i class="fa fa-book"></i>More Details</a>
                            </div>
                            <!-- /buttons -->
                        </div>
                        <!-- /item -->


                        <!-- item -->
                        <div class="shop-item m-0">

                            <div class="thumbnail">
                                <!-- product image(s) -->
                                <a class="shop-item-image" href="product.jsp?ISBN=0439784549&sid=1">
                                    <img class="img-fluid" src="demo_files/pj/5.jpg" alt="shop first image" />
                                </a>
                                <!-- /product image(s) -->
                            </div>

                            <div class="shop-item-summary text-center">
                                <h2>Harry Potter
                                    <br>and the Half-Blood Prince</h2>

                                <!-- price -->
                                <div class="shop-item-price">
                                    <span class="line-through">$12.00</span> $8.40
                                </div>
                                <!-- /price -->
                            </div>

                            <!-- buttons -->
                            <div class="shop-item-buttons text-center">
                                <a class="btn btn-default" href="product.jsp?ISBN=0439784549&sid=1">
                                    <i class="fa fa-book"></i>More Details</a>
                            </div>
                            <!-- /buttons -->
                        </div>
                        <!-- /item -->

                    </div>

                </div>
            </section>
            <!-- /FEATURED -->




            <!-- PARALLAX -->
            <section class="parallax parallax-2 parallax-not-apply" style="background-image: url('demo_files/images/particles_bg.jpg');">
                <div class="overlay dark-1">
                    <!-- dark overlay [0 to 9 opacity] -->
                </div>

                <div class="container">



                    <div class="owl-carousel text-center owl-testimonial m-0" data-plugin-options='{"singleItem": true, "autoPlay": 3000, "navigation": false, "pagination": true}'>

                        <!--
                        <div class="text-center">
                            <h3 class="m-0">Popular Products</h3>
                            <p class="font-lato fw-300 lead mt-0">Incidunt deleniti blanditiis quas aperiam recusandae consequatur ullam.</p>
                        </div>
                        !-->
                        <div class="text-center">
                            <h3 class="m-0">New Products</h3>
                            <p class="font-lato fw-300 lead mt-0">Incidunt deleniti blanditiis quas aperiam recusandae consequatur ullam.</p>
                        </div>

                    </div>


                </div>

            </section>
            <!-- /PARALLAX -->





            <!-- NEW PRODUCTS -->
            <section>
                <div class="container">

                    <div class="heading-title heading-dotted">
                        <h2 class="fs-20">POPULAR BOOKS</h2>
                    </div>

                    <ul class="shop-item-list row list-inline m-0">

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="this is a test">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="#">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="#">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="#">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="#">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="#">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="#">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="#">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="#">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="#">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="#">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->

                        <!-- ITEM -->
                        <li class="col-lg-2 col-sm-4">

                            <div class="shop-item">

                                <div class="thumbnail b-0 p-0">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image" href="#">
                                        <img class="img-fluid" src="demo_files/pj/7.jpg" alt="" />
                                    </a>
                                    <!-- /product image(s) -->
                                </div>

                                <div class="shop-item-summary text-center">
                                    <h2 class="fs-14">Book Title</h2>

                                    <!-- price -->
                                    <div class="shop-item-price">
                                        $23.00
                                        <!--sale
                                            <span class="line-through">$98.00</span> $78.00
                                        !-->
                                    </div>
                                    <!-- /price -->
                                </div>

                            </div>

                        </li>
                        <!-- /ITEM -->


                    </ul>

                </div>
            </section>
            <!-- NEW PRODUCTS -->



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
        <script type="text/javascript">
            var plugin_path = 'assets/plugins/';
        </script>
        <script type="text/javascript" src="assets/plugins/jquery/jquery-3.2.1.min.js"></script>

        <script type="text/javascript" src="assets/js/scripts.js"></script>

        <!-- REVOLUTION SLIDER -->
        <script type="text/javascript" src="assets/plugins/slider.revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="assets/plugins/slider.revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="assets/js/view/demo.revolution_slider.js"></script>

        <!-- PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="assets/js/view/demo.shop.js"></script>
        <script type="text/javascript" src="assets/js/home.js"></script>
        <script type="text/javascript" src="assets/js/search_setting.js"></script>


    </body>

</html>