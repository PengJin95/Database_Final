jQuery(document).ready(function () {

    _main_ajax();

});

function _main_ajax() {
    category_ajax();
}

function category_ajax() {
    jQuery.ajax({
        type: "GET",
        url: "getCategory",
        dataType: "xml",
        success: function (xml) {
            $(xml).find('category').each(function () {
                var cate_name = $(this).text();
                var nav_cate = "<li class='main-nav-item'><a href='/search?category=" + cate_name + "'><i class='fa fa-circle-o-notch'></i>" + cate_name+ "</a></li>"; 
                var search_cate =  "<option value='" + cate_name + "'>" + cate_name + "</option>";
                $("#search-scope").append(search_cate);
                $("#mobile-category").append(nav_cate);       
            })
            top_ajax();
        }
    });
}

function top_ajax() {
    jQuery.ajax({
        type: "GET",
        url: "getTop",
        dataType: "xml",
        success: function (xml) {
            var i = 0;
            $(xml).find('top').each(function () {
                var sid = $(this).find("sid").text();
                var ISBN = $(this).find("ISBN").text();
                var name = $(this).find("name").text();
                var price = Number($(this).find("price").text()).toFixed(2);
                var dprice = Number($(this).find("dprice").text()).toFixed(2);
                var image_url = $(this).find("url").text();
                var url = "product.jsp?sid=" + sid + "&ISBN=" + ISBN;
                $(".shop-item-list .shop-item-image:eq("+ i + ")").attr("href", url);
                $(".shop-item-list .img-fluid:eq("+ i +")").attr("src", image_url);
                $(".shop-item-list h2:eq("+ i +")").text(name);
                if (price == dprice) {
                    $(".shop-item-list .shop-item-price:eq("+ i + ")").text("$" + price);
                } else {
                    $(".shop-item-list .shop-item-price:eq("+ i + ")").html("<span class='line-through'>$" + price + "</span>$" + dprice);
                }
                i++;
            });
        }
    });
}