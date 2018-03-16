jQuery(document).ready(function () {
    _main_ajax();
});

function _main_ajax() {

    addkeyup();
    category_ajax();
    form_validate();

}

function addkeyup() {
    $("#billing_phone").keyup(function () {
        $("#billing_phone").removeClass("error");
        $("label.error[for='billing_phone']").remove();

    })
    $("#billing_zipcode").keyup(function () {
        $("#billing_zipcode").removeClass("error");
        $("label.error[for='billing_zipcode']").remove();
    })
    $("#shipping_phone").keyup(function () {
        $("#shipping_phone").removeClass("error");
        $("label.error[for='shipping_phone']").remove();

    })
    $("#shipping_zipcode").keyup(function () {
        $("#shipping_zipcode").removeClass("error");
        $("label.error[for='shipping_zipcode']").remove();
    })
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
        }
    });
}

function form_validate() {

    $("#tform").validate({
        debug: true,

        rules: {
            billing_firstname: "required",
            billing_lastname: "required",
            billing_email: { required: true, email: true },
            billing_phone: "required",
            billing_address: "required",
            billing_city: "required",
            billing_state: "required",
            billing_zipcode: "required",
            shipping_firstname: "required",
            shipping_lastname: "required",
            shipping_email: { required: true, email: true },
            shipping_phone: "required",
            shipping_address: "required",
            shipping_city: "required",
            shipping_state: "required",
            shipping_zipcode: "required",
            payment_name: "required",
            payment_state: "required",
            payment_cc_number: { required: true },
            payment_cc_exp_month: "required",
            payment_cc_exp_year: "required",
            payment_cc_cvv: "required",
        },
        submitHandler: function () {
            if(check_rest() == 0) {
                console.log("prepare to send");
                place_order_ajax();
            }
        }
    });
}

function check_rest() {
    var flag = 0;
    if (/^[0-9]{10}$/.test($("#billing_phone").val()) == false) {
        $("#billing_phone").addClass("error");
        $("#billing_phone").after("<label for='billing_phone' class='error'>Please specify a valid phone number</label>");
        flag = -1;
    }
    if (/^[0-9]{5}$/.test($("#billing_zipcode").val()) == false) {
        $("#billing_zipcode").addClass("error");
        $("#billing_zipcode").after("<label for='billing_zipcode' class='error'>The specified US ZIP Code is invalid</label>");
        flag = -1;
    }
    console.log($("#shipping").css("display"));
    if ($("#shipping").css("display") != "none") {
        if (/^[0-9]{10}$/.test($("#shipping_phone").val()) == false) {
            $("#shipping_phone").addClass("error");
            $("#shipping_phone").after("<label for='shipping_phone' class='error'>Please specify a valid phone number</label>");
            flag = -1;
        }
        if (/^[0-9]{5}$/.test($("#shipping_zipcode").val()) == false) {
            $("#shipping_zipcode").addClass("error");
            $("#shipping_zipcode").after("<label for='shipping_zipcode' class='error'>The specified US ZIP Code is invalid</label>");
            flag = -1;
        }
    }
    return flag;
}

function place_order_ajax() {
    jQuery.ajax({
        type: "GET",
        url: "placeOrder",
        data: {
            "firstname_b": $("#billing_firstname").val(),
            "lastname_b": $("#billing_lastname").val(),
            "email_b": $("#billing_email").val(),
            "phone_b": $("#billing_phone").val(),
            "address_b": $("#billing_address").val(),
            "city_b": $("#billing_city").val(),
            "state_b": $("#billing_state").val(),
            "zipcode_b": $("#billing_zipcode").val(),
            "firstname": $("#shipping_firstname").val(),
            "lastname": $("#shipping_lastname").val(),
            "email": $("#shipping_email").val(),
            "phone": $("#shipping_phone").val(),
            "address": $("#shipping_address").val(),
            "city": $("#shipping_city").val(),
            "state": $("#shipping_state").val(),
            "zipcode": $("#shipping_zipcode").val(),
            "name": $("#payment_name").val(),
            "type": $("#payment_state").val(),
            "number": $("#payment_cc_number").val(),
            "expiremonth":$("#payment_cc_exp_month").val(),
            "expireyear":$("#payment_cc_exp_year").val(),
            "cvv2": $("#payment_cc_cvv").val(),
        },
        success: function () {
            window.location.href = "checkout_success.jsp";
        }
    });
}