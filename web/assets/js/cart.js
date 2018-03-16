jQuery(document).ready(function () {
    _main_ajax();
});

function _main_ajax() {

    category_ajax();
    update_cart();

}

function category_ajax() {
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
            get_cart_list();
        }
    });
}

function update_cart() {
    $("#update-cart").click(function () {
        $("#preloader").show();
        $("#preloader").css("opacity", "0.5");
        var amount_list = "";
        $(".item-quantity").each(function () {
            amount_list += $(this).val() + "_";
        });
        jQuery.ajax({
            type: "GET",
            url: "updateShoppingcart?update=" + amount_list.substring(0, amount_list.length - 1),
            success: function () {
                $(".cart-item-list").empty();
                $(".cart-item-list").append(`
                <!-- cart header -->
                <div class="item head clearfix">
                    <span class="cart_img"></span>
                    <span class="product_name fs-13 bold">PRODUCT NAME</span>
                    <span class="remove_item fs-13 bold"></span>
                    <span class="total_price fs-13 bold">TOTAL</span>
                    <span class="qty fs-13 bold">QUANTITY</span>
                </div>
                <!-- /cart header -->`);
                get_cart_list();
                jQuery('#preloader').fadeOut(700, function () {
                    jQuery('#preloader').hide();
                });
                $("#proceed-to-checkout").attr("disabled", false);
            }
        });
    });
}

function get_cart_list() {
    console.log("This is a test");
    jQuery.ajax({
        type: "GET",
        url: "shoppingcart",
        dataType: "xml",
        success: function (xml) {
            if ($(xml).find("empty").length != 0) {
                $(".empty-cart").css("display", "block");
                $(".not-empty-cart").css("display", "none");
                return
            }
            $(".empty-cart").css("display", "none");
            $(".not-empty-cart").css("display", "block");
            var total_item_price = 0;
            $(xml).find("productinfo").each(function () {
                var item_ISBN = $(this).find("ISBN").text();
                var item_name = $(this).find("name").text();
                var img_url = $(this).find("url").text();
                var item_quantity = $(this).find("quantity").text();
                var item_price = Number($(this).find("dprice").text()).toFixed(2);
                var item_total_price = Number(item_quantity * item_price).toFixed(2);
                total_item_price += Number(item_total_price);
                var item_sid = $(this).find("sid").text();
                var item_url = "product.jsp?ISBN=" + item_ISBN + "&sid=" + item_sid;
                var item_inventory = $(this).find("inventory").text();
                $(".cart-item-list").append(
                    `
                    <div class="item">
                        <div class="cart_img float-left fw-100 p-10 text-left"><img src="`+ img_url + `" alt="" width="80" /></div>
                        <a href="`+ item_url + `" class="product_name">
                            <span>`+ item_name + `</span>
                            <small>ISBN: `+ item_ISBN + `</small>
                        </a>
                        <a href="#" class="remove_item" style="visibility: hidden"><i class="fa fa-times"></i></a>
                        <div class="total_price">$<span>`+ item_total_price + `</span></div>
                        <div class="qty"><input class="item-quantity" type="number" value="`+ item_quantity + `" placeholder="` + item_quantity + `" name="qty" max="` + item_inventory + `" min="0" /> &times; $` + item_price + `</div>
                        <div class="clearfix"></div>
                    </div>
                    <!-- /cart item -->
                    `
                );
            });

            $(".total-to-checkout").text("$" + Number(total_item_price).toFixed(2));

            $(".item-quantity").change(function () {
                var cnt_o = 0, cnt = 0;
                $(".item-quantity").each(function () {
                    cnt++;
                    if ($(this).attr("placeholder") == $(this).val()) {
                        cnt_o++;
                    }
                });
                if (cnt_o == cnt) {
                    $("#proceed-to-checkout").attr("disabled", false);
                } else {
                    $("#proceed-to-checkout").attr("disabled", true);
                }
            });

            var amount_list = "";
            $(".item-quantity").each(function () {
                amount_list += $(this).val() + "_";
            });
            jQuery.ajax({
                type: "GET",
                url: "updateShoppingcart?update=" + amount_list.substring(0, amount_list.length - 1),
                success: function () {}
            });
        }
        
    });
}