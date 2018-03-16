jQuery(document).ready(function () {

    _main_ajax();

});

function _main_ajax() {
    category_ajax();
    var ISBN = getRequestParameter("ISBN");
    var name = getRequestParameter("name");
    var category = getRequestParameter("category");
    console.log(category);
    var lowprice = (getRequestParameter("lowprice") == null || getRequestParameter("lowprice") == "") ? -1 : getRequestParameter("lowprice");
    var highprice = (getRequestParameter("highprice") == null || getRequestParameter("highprice") == "") ? -1 : getRequestParameter("highprice");
    var page = getRequestParameter("page") == null ? 1 : getRequestParameter("page");
    var order = getRequestParameter("order");
    $(".rerank-order").change(function () {
        get_result_ajax(ISBN, name, category, 1, lowprice, highprice, $(this).val());
    });
    get_result_ajax(ISBN, name, category, 1, lowprice, highprice, order);
}

function category_ajax() {
    jQuery.ajax({
        type: "GET",
        url: "getCategory",
        dataType: "xml",
        success: function (xml) {
            $(xml).find('category').each(function () {
                var cate_name = $(this).text();
                var nav_cate = "<li class='main-nav-item'><a href='/search.jsp?category=" + cate_name + "'><i class='fa fa-circle-o-notch'></i>" + cate_name + "</a></li>";
                var search_cate = "<option value='" + cate_name + "'>" + cate_name + "</option>";
                $("#search-scope").append(search_cate);
                $("#mobile-category").append(nav_cate);
            })
        }
    });
}

function get_result_ajax(ISBN, name, category, page, lowprice, highprice, order) {
    $(".pagination").empty();
    $(".shop-item-list").empty()

    $("#preloader").show();
    $("#preloader").css("opacity", "0.5");
    var ajax_url = "SearchProduct?";
    if (ISBN != "") {
        ajax_url += "ISBN=" + ISBN;
    } else {
        if (category != "") {
            ajax_url += "category=" + category + "&";
        }
        if (name != "") {
            ajax_url += "name=" + name;
        }
        ajax_url += "&page=" + page;
        ajax_url += "&lowprice=" + lowprice;
        ajax_url += "&highprice=" + highprice;
        if (order != "") {
            ajax_url += "&order=" + order;
        }
    }
    jQuery('#preloader').fadeOut(700, function () {
        jQuery('#preloader').hide();
    });

    jQuery.ajax({
        type: "GET",
        url: ajax_url,
        dataType: "xml",
        success: function (xml) {
            var totalpage = Number($(xml).find("tpage").text());
            var currentpage = Number($(xml).find("page").text());
            var pre = "<li class='page-item'><a class='page-link'>";
            var suf = "</a></li>";
            $(".pagination").each(function () {
                var flag = 1;
                for (var i = 1; i < totalpage + 1; i++) {

                    if (currentpage != 1 && i == 1) {
                        flag = 0;
                        $(this).append(pre + "&laquo;" + suf);
                        $(this).find("li").find("a").click(function () {
                            get_result_ajax(ISBN, name, category, currentpage - 1, lowprice, highprice, order);
                        });
                    }

                    $(this).append(pre + i + suf);
                    var param = { index: i };
                    $(this).find("li:eq(" + (i - flag) + ")").find("a").click(param, function (event) {
                        get_result_ajax(ISBN, name, category, event.data.index, lowprice, highprice, order);
                    });
                    if (currentpage == i) {
                        $(this).find("li:eq(" + (i - flag) + ")").addClass("active");
                    }

                    if (currentpage != totalpage && i == totalpage) {
                        $(this).append(pre + "&raquo;" + suf);
                        $(this).find("li:eq(" + (i + 1 - flag) + ")").find("a").click(function () {
                            get_result_ajax(ISBN, name, category, currentpage + 1, lowprice, highprice, order);
                        });
                    }
                }
            });

            $(xml).find("book").each(function () {
                var item_ISBN = $(this).find("ISBN").text();
                var item_sid = $(this).find("sid").text();
                var item_name = $(this).find("name").text();
                var item_price = Number($(this).find("price").text()).toFixed(2);
                var item_dprice = Number($(this).find("dprice").text()).toFixed(2);
                var item_img_url = $(this).find("url").text();
                var item_description = $(this).find("description").text();
                var final_price;
                if (item_price != item_dprice) {
                    final_price = "<span class='line-through'>$" + item_price + "</span>$" + item_dprice;
                } else {
                    final_price = "$" + item_price;
                }
                var item_url = "product.jsp?ISBN=" + item_ISBN + "&sid=" + item_sid;
                $(".shop-item-list").append(
                    `
                    <li class='col-lg-12'>
                        <div class='shop-item clearfix'>
                            <div class='thumbnail'>
                                <a class='shop-item-image' href='`+ item_url + `'>
                                    <img class='img-fluid' src='`+ item_img_url + `' alt='shop first image' />
                                </a>
                            </div>
                            <div class='shop-item-summary'>
                                <h2>`+ item_name + `</h2>
                                <p>`+ item_description + `</p>
                                <div class='shop-item-price'>`+ final_price + `</div>
                                <div class='shop-item-buttons'>
                                    <a class='btn btn-default' href='`+ item_url + `'><i class='fa fa-book'></i> More Detials</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    `
                );
            });

            $(".result-categories").empty();
            $(".price-tag").empty();

            $(xml).find("category").each(function () {
                var url = "search.jsp?ISBN=" + ISBN + "&name=" + name + "&category=" + $(this).text() + "&page=1&lowpirce=-1&highprice=-1";
                $(".result-categories").append("<li class='list-group-item'><a href='" + url + "'><span class='fs-11 text-muted float-right'></span>" + $(this).text() + "</a></li>");
            });

            var pricetag = [
                "<a class='tag' href='search.jsp?ISBN=" + ISBN + "&name=" + name + "&category=" + category + "&page=1&lowprice=0&highprice=10'><span class='txt'>$0-$10</span></a>",
                "<a class='tag' href='search.jsp?ISBN=" + ISBN + "&name=" + name + "&category=" + category + "&page=1&lowprice=10&highprice=50'><span class='txt'>$10-$50</span></a>",
                "<a class='tag' href='search.jsp?ISBN=" + ISBN + "&name=" + name + "&category=" + category + "&page=1&lowprice=50&highprice=100'><span class='txt'>$50-$100</span></a>",
                "<a class='tag' href='search.jsp?ISBN=" + ISBN + "&name=" + name + "&category=" + category + "&page=1&lowprice=100&highprice=-1'><span class='txt'>$100+</span></a>"]
            var hprice = Number($(xml).find("hprice").text());
            $(".price-tag").append("<h4>Price Range</h4>");
            $(".price-tag").append(pricetag[0]);
            if (hprice > 10)
                $(".price-tag").append(pricetag[1]);
            if (hprice > 50)
                $(".price-tag").append(pricetag[2]);
            if (hprice > 100)
                $(".price-tag").append(pricetag[3]);
            $(".price-tag").append("<hr />");
        }
    });
    $('html,body').animate({scrollTop: '0px'}, 500);
}


function getRequestParameter(paras) {
    var url = location.href;
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    var paraObj = {}
    for (i = 0; j = paraString[i]; i++) {
        paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
    }
    var returnValue = paraObj[paras.toLowerCase()];
    if (typeof (returnValue) == "undefined") {
        return "";
    } else {
        return returnValue;
    }
}  