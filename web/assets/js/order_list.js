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
                var nav_cate = "<li class='main-nav-item'><a href='/search?category=" + cate_name + "'><i class='fa fa-circle-o-notch'></i>" + cate_name + "</a></li>";
                var search_cate = "<option value='" + cate_name + "'>" + cate_name + "</option>";
                $("#search-scope").append(search_cate);
                $("#mobile-category").append(nav_cate);
            })
            get_orderlist_ajax();
        }
    });
}

function get_orderlist_ajax() {
    jQuery.ajax({
        type: "GET",
        url: "viewOrders",
        dataType: "xml",
        success: function (xml) {
            if ($(xml).find("empty").length != 0) {
                $(".no-orders").css("display", "block");
                $(".have-orders").css("display", "none");
                return
            }
            $(".no-orders").css("display", "none");
            $(".have-orders").css("display", "block");
            var cnt = 0;
            $(xml).find('order').each(function () {
                cnt++;
                var order_id = $(this).find("oid").text();
                var order_time = $(this).find("time").text();
                var product_amount = $(this).find("productnum").text();
                var total_price = Number($(this).find("totalprice").text()).toFixed(2);
                $(".table-body").append(
                    `
                    <tr>
                        <td>`+ order_id + `</td>
                        <td>`+ order_time + `</td>
                        <td class="text-center">`+ product_amount + `</td>
                        <td class="text-center fw-400 fs-18">$`+ total_price + `</td>
                        <td class="text-center">
                            <a href="invoice.jsp?oid=`+ order_id + `&otime=`+ order_time +`" class="btn btn-flat btn-v1 btn-sm"><i class="fa fa-eye m-0 p-3"></i></a>
                        </td>
                    </tr>
                    `
                );                
            });
            $(".text-muted").text("(" + cnt + ")");
        }
    });
}


