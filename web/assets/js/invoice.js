jQuery(document).ready(function () {

    _main_ajax();

});


function _main_ajax() {

    category_ajax();
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
            });
            get_order_detail_ajax();
        }
    });
}

function get_order_detail_ajax() {
    jQuery.ajax({
        type: "POST",
        url: "viewOrderdetail",
        data: {
            oid: getRequestParameter("oid")
        },
        dataType: "xml",
        success: function (xml) {
            $(".order-information").append(
                `
                <div class="col-sm-6">
                    <h4>BILL TO</h4>
                    <div class="block">`+ $(xml).find("bfname").text() + " " + $(xml).find("blname").text()+ `</div>
                    <div class="block">`+ $(xml).find("baddress").text() + `</div>
                    <div class="block">`+ $(xml).find("bcity").text() + `, ` + $(xml).find("bstate").text() + `, ` + $(xml).find("bzipcode").text() + `</div>
                    <div class="block">`+ $(xml).find("bphone").text() +  `</div>
                </div>
        
                <div class="col-sm-6">
                    <h4>SHIP TO</h4>
                    <div class="block">`+ $(xml).find("sfname").text() + " " + $(xml).find("slname").text()+ `</div>
                    <div class="block">`+ $(xml).find("saddress").text() + `</div>
                    <div class="block">`+ $(xml).find("scity").text() + `, ` + $(xml).find("sstate").text() + `, ` + $(xml).find("szipcode").text() + `</div>
                    <div class="block">`+ $(xml).find("sphone").text() + `</div>
                </div>
                `
            );
            var sum = 0;
            $(xml).find("transaction").each(function () {
                sum += Number($(this).find("tprice").text());
                var status = "";
                if ($(this).find("status").text() == "Completed")
                    status = '<td><span class="text-success">Completed</span></td>';
                else
                    status = '<td><span class="text-warning">Processing</span></td>';

                $(".table-body").append(`
                    <tr>
                        <td>`+ $(this).find("name").text() + `</td>
                        <td>`+ $(this).find("ISBN").text() + `</td>
                        <td>`+ $(this).find("quantity").text() + `</td>
                        <td>$`+ $(this).find("price").text() + `</td>
                        <td>$`+ $(this).find("tprice").text() + `</td>
                        `+ status + `
                    </tr>
                `)
            });
            $(".table-body").append(`
                <tr class="b-0 fs-16">
                    <td class="b-0"</td>
                    <td class="b-0"></td>
                    <td class="b-0"></td>
                    <td class="fw-600">TOTAL</td>
                    <td class="fw-600">$`+ sum + `</td>
                    <td class="b-0"></td>
                </tr>
            `);

        }
    });
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