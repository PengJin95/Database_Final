jQuery(document).ready(function () {

    _main_ajax();

});

function _main_ajax() {
    category_ajax();
    submit_bind();
    form_check();
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
            top_ajax();
        }
    });
}

function submit_bind() {
    $(".submit-info-form").keyup(function () {
        $(".submit-info-form").removeClass("error");
        $("label.error[for='zipcode']").remove();

    })
    $(".submit-pwd-form").keyup(function () {
        $(".submit-pwd-form").removeClass("error");
        $("label.error[for='pwd']").remove();
    })
}

function form_check() {
    $("#form2").validate({
        debug: true,
        rules: {
            pwd1: "required",
            pwd2: "required"
        },
        submitHandler: function () {
            if ($("#pwd1").val() != $("#pwd2").val()) {
                $("#pwd2").addClass("error");
                $("#pwd2").after("<label for='pwd' class='error'>The specified US ZIP Code is invalid</label>");
            } else {
                $(".submit-pwd-form").attr("disabled", true);
                $(".submit-pwd-form").text("Processing...");
                jQuery.ajax({
                    type: "POST",
                    url: "updateCustomer",
                    data: {
                        "password": $("#pwd1").val(),
                        "account_pwd_settings": true                        
                    },
                    success: function () {
                        $(".submit-pwd-form").attr("disabled", false);
                        $(".submit-pwd-form").html("<i class='fa fa-check'></i> CHANGES SAVED!");
                        window.setTimeout(function () {
                            $(".submit-pwd-form").html("SAVE CHANGES");
                        }, 1000);
                    }
                });
            }
        }
    });

    $("#form1").validate({
        debug: true,

        rules: {
            email: { required: true, email: true },
            address: "required",
            city: "required",
            zipcode: "required",
            state: "required"
        },
        submitHandler: function () {
            if (/^[0-9]{5}$/.test($("#zipcode").val()) == false) {
                $("#zipcode").addClass("error");
                $("#zipcode").after("<label for='zipcode' class='error'>The specified US ZIP Code is invalid</label>");
            } else {
                $(".submit-info-form").attr("disabled", true);
                $(".submit-info-form").text("Processing...");
                jQuery.ajax({
                    type: "POST",
                    url: "updateCustomer",
                    data: {
                        "email": $("#email").val(),
                        "address": $("#address").val(),
                        "city": $("#city").val(),
                        "zipcode": $("#zipcode").val(),
                        "state": $("#state").val(),
                        "account_info_settings": true
                    },
                    success: function () {
                        $(".submit-info-form").attr("disabled", false);
                        $(".submit-info-form").html("<i class='fa fa-check'></i> CHANGES SAVED!");
                        window.setTimeout(function () {
                            $(".submit-info-form").html("SAVE CHANGES");
                        }, 1000);
                    }
                });
            }
        }
    });
}