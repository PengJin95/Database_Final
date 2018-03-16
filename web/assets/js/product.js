jQuery(document).ready(function () {
    _main_ajax();
});

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


function _main_ajax() {
    var ISBN = getRequestParameter("ISBN");
    var sid = getRequestParameter("sid");
    sendmessage(ISBN, sid);
    category_ajax(ISBN, sid);
}

function sendmessage(ISBN, sid) {
    $("#message-btn").click(function () {
        var content = $("#text-encode").text($("#text").val()).html();
        $("#message-btn").text("Sending...");
        $("#message-btn").attr("disabled", true);
        jQuery.ajax({
            type: "POST",
            url: "sendMessage",
            data: {
                "content": content,
                "ISBN": ISBN,
                "sid": sid
            },
            success: function (xml) {
                var result = $(xml).find('result').text();
                if (result == "1") {
                    $("#message-btn").html("<i class='fa fa-check'></i>Succeeded!");
                    $("#message-btn").attr("disabled", false);
                    window.setTimeout(function () {
                        $("#message-btn").text("Send another message");
                        $("#message-btn").attr("disabled", false);
                    }, 2000);
                } else {
                    $("#message-btn").html("<i class='fa fa-warning'></i>Failed to send the message");
                    $("#message-btn").attr("disabled", true);
                    window.setTimeout(function () {
                        $("#message-btn").text("Send the message again");
                        $("#message-btn").attr("disabled", false);
                    }, 2000);
                }
            }
        });

    })
}

function category_ajax(ISBN, sid) {
    jQuery.ajax({
        type: "GET",
        url: "getCategory",
        dataType: "xml",
        success: function (xml) {
            $(xml).find('category').each(function () {
                var cate_name = $(this).text();
                var nav_cate = "<li class='main-nav-item'><a href='/search?category=" + cate_name + "'><i class='fa fa-circle-o-notch'></i>" + cate_name + "</a></li>";
                var search_cate = "<option value='" + cate_name + "'>" + cate_name + "</option>";
                $("#search-scope").append(search_cate);
                $("#mobile-category").append(nav_cate);
            })
            call_salesperson(ISBN, sid);
        }
    });
}

function call_salesperson(ISBN, sid) {
    jQuery.ajax({
        type: "GET",
        url: "getSalespersonInfo?ISBN=" + ISBN + "&sid=" + sid,
        success: function() {
            book_ajax(ISBN, sid);
        }
    });
}

function book_ajax(ISBN, sid) {
    jQuery.ajax({
        type: "GET",
        url: "getProductInfo?ISBN=" + ISBN + "&sid=" + sid,
        dataType: "xml",
        success: function (xml) {
            $("#book-title").text($(xml).find("name").text());
            var author_list = "";
            $(xml).find("author").each(function () {
                author_list += $(this).text() + ", ";
            });
            $("#author-list").text(author_list.substring(0, author_list.length - 2));
            console.log( $(xml).find("url").text());
            $("figure img").attr("src", $(xml).find("url").text());
            var price = Number($(xml).find("bookinfo").find("price").text()).toFixed(2);
            var dprice = Number($(xml).find("bookinfo").find("dprice").text()).toFixed(2);
            if (price == dprice) {
                $(".shop-item-price").text("$" + price);
            } else {
                $(".shop-item-price").html("<span class='line-through'>$" + price + "</span>$" + dprice);
            }
            var stock = $(xml).find("inventory").text();
            if (stock == 0) {
                $(".text-success").css("display", "none");
                $(".text-default").css("display", "block");
                $(".product-add-cart").attr("disabled", "true");
                $("#quantity").attr("max", 0);
                $("#quantity").attr("min", 0);
                $("#quantity").attr("value", 0);
            } else {
                $(".text-default").css("display", "none");
                $(".text-success").css("display", "block");
                $("#quantity").attr("max", stock);
            }
            $("#ISBN").text($(xml).find("ISBN").text());
            $("#format").text($(xml).find("format").text());
            $("#language").text($(xml).find("language").text());
            $("#publisher").text($(xml).find("publisher").text());
            $("#release_date").text($(xml).find("publishdate").text());
            $("#version").text($(xml).find("version").text());
            $("#book_category").text($(xml).find("category").text());
            $("#description").html($(xml).find("description").text());
            $("#description").html($("#description").text());
            $("#store_name").text($(xml).find("bookinfo").find("sname").text());
            $("#store_address").text($(xml).find("bookinfo").find("address").text() + $(xml).find("bookinfo").find("city").text());
            $("#store_region").text($(xml).find("bookinfo").find("rname").text());

            $(xml).find("storeinfo").each(function () {
                var htm = "<li class='list-group-item'><a href='product?ISBN=" + ISBN
                    + "&sid=" + $(this).find("sid").text() + "'><span class='fs-11 text-muted float-right'>$" + $(this).find("dprice").text()
                    + "</span>" + $(this).find("sname").text() + "</a></li>";
                $(".list-group-noicon").append(htm);
            });
            cart_ajax(ISBN, sid, $(xml).find("name").text(), $(xml).find("url").text(), dprice, stock);
        }
    });
}

function cart_ajax(ISBN, sid, name, purl, dprice, stock) {
    $(".product-add-cart").click(function () {
        $(this).attr("disabled", true);
        $(this).text("Processing");
        jQuery.ajax({
            type: "GET",
            url: "addProduct",
            data: {
                "ISBN": ISBN,
                "sid": sid,
                "name": name,
                "purl": purl,
                "dprice": dprice,
                "quantity": $("#quantity").val(),
                "inventory": stock
            },
            success: function () {
                $(".product-add-cart").attr("disabled", false);
                $(".product-add-cart").text("Succeeded!");
                
                window.setTimeout(function () {
                    $(".product-add-cart").text("Add to cart");
                },1000);
                 
                 
            }
        });
    });

}