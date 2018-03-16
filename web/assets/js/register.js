jQuery(document).ready(function () {

    _main_ajax();

});

function _main_ajax() {
    check();
    register_ajax();
    category_ajax();
}

function check() {
    $("#username").keyup(function () {
        var pattern = /^[a-zA-Z0-9]+$/;
        if (pattern.test($("#username").val()) == true) {
            $("#username-invalid").css("display", "none");
        } else {
            $("#username-invalid").css("display", "block");
            $("#submit-btn").attr("disabled", true);
        }
    });

    $("#email").change(function () {
        var pattern = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
        if (pattern.test($("#email").val()) == true) {
            $("#email-invalid").css("display", "none");
        } else {
            $("#email-invalid").css("display", "block");
            $("#submit-btn").attr("disabled", true);
        }
    });

    $("#pwdr").keyup(function () {
        if ($("#pwd").val() != $("#pwdr").val()) {
            $("#pwd-mat").css("display", "block");
            $("#submit-btn").attr("disabled", true);
        } else {
            $("#pwd-mat").css("display", "none");
        }
    });

    $("#zip").change(function () {
        var pattern = /^[0-9]{5}$/;
        if (pattern.test($("#zip").val()) == true) {
            $("#zip-invalid").css("display", "none");
        } else {
            $("#zip-invalid").css("display", "block");
            $("#submit-btn").attr("disabled", true);
        }
    });

    $(window).keyup(function () {
        var flag = -1;
        $("#register-form input").each(function () {
            if ($(this).val() == "") {
                $("#submit-btn").attr("disabled", true);
                return;
            }
        });
        if ($("#account_type").val() == "") {
            $("#submit-btn").attr("disabled", true);
            return;
        }
        if ($("#account_type").val() == "Home") {
            $(".type-home input").each(function () {
                if ($(this).val() == "") {
                    $("#submit-btn").attr("disabled", true);
                    flag = 0;
                }
            });
        }
        if ($("#account_type").val() == "Business") {
            $(".type-business input").each(function () {
                if ($(this).val() == "") {
                    $("#submit-btn").attr("disabled", true);
                    flag = 0;
                }
            });
        }
        console.log(flag);
        if ($("#username-invalid").css("display") == "none" &&
            $("#email-invalid").css("display") == "none" &&
            $("#pwd-mat").css("display") == "none" &&
            $("#zip-invalid").css("display") == "none" &&
            flag != 0) {
            $("#submit-btn").attr("disabled", false);
        }
    })
}


function register_ajax() {
    $("#submit-btn").click(function () {
        $("#submit-btn").text("Please wait...");
        $("#submit-btn").attr("disabled", true);
        if ($("#account_type").val() == "Home") {
            jQuery.ajax({
                type: "POST",
                url: "Authentication",
                data: {
                    "username": $("#username").val(),
                    "email": $("#email").val(),
                    "password": $("#pwd").val(),
                    "address": $("#stadd").val(),
                    "city": $("#city").val(),
                    "zip": $("#zip").val(),
                    "state": $("#state").val(),
                    "type": $("#account_type").val(),
                    "fname": $("#fname").val(),
                    "lname": $("#lname").val(),
                    "gender": $("#gender").val(),
                    "marriage": $("#marriage").val(),
                    "age": $("#age").val(),
                    "income": $("#mincome").val(),
                    "register": "true"
                },
                dataType: "xml",
                success: function (xml) {
                    var result = $(xml).find('result').text();
                    if (result == "1") {
                        $("#submit-btn").html("<i class='fa fa-check'></i>Succeeded!");
                        $("#submit-btn").attr("disabled", false);
                        window.setTimeout(function () {
                            window.location.href = "index.jsp";
                        }, 500);
                    } else {
                        $("#submit-btn").text("SIGN IN");
                        $("#submit-btn").attr("disabled", false);
                        $("#username-exists").css("display", "block");
                    }
                }
            });
        } else {
            jQuery.ajax({
                type: "POST",
                url: "Authentication",
                data: {
                    "username": $("#username").val(),
                    "email": $("#email").val(),
                    "password": $("#pwd").val(),
                    "address": $("#stadd").val(),
                    "city": $("#city").val(),
                    "zip": $("#zip").val(),
                    "state": $("#state").val(),
                    "type": $("#account_type").val(),
                    "cname": $("#cname").val(),
                    "income": $("#aincome").val(),
                    "category": $("#industry").val(),
                    "register": "true"
                },
                dataType: "xml",
                success: function (xml) {
                    var result = $(xml).find('result').text();
                    if (result == "1") {
                        $("#submit-btn").html("<i class='fa fa-check'></i>Succeeded!");
                        $("#submit-btn").attr("disabled", false);
                        window.setTimeout(function () {
                            window.location.href = "index.jsp";
                        }, 500);
                    } else {
                        $("#submit-btn").text("SIGN IN");
                        $("#submit-btn").attr("disabled", false);
                        $("#username-exists").css("display", "block");
                    }
                }
            });
        }
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