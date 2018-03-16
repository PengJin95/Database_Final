jQuery(document).ready(function () {

    _main_ajax();

});

function _main_ajax() {
    login_ajax();
    category_ajax();
}

function login_ajax() {
    $(window).keyup(function() {
        if ($("#username").val() != "" && $("#password").val() != "") {
            $("#submit-btn").attr("disabled", false);
        } else {
            $("#submit-btn").attr("disabled", true);            
        }
    });
    $("#submit-btn").click(function () {
        $("#submit-btn").text("Please wait...");
        $("#submit-btn").attr("disabled", true);
        jQuery.ajax({
            type: "POST",
            url: "Authentication",
            data: {
                "username": $("#username").val(),
                "password": $("#password").val(),
                "login": "true",
                "isBusiness": $("#isBusiness").prop("checked")
            },
            dataType: "xml",
            success: function (xml) {
                var result = $(xml).find('result').text();
                if (result == "1") {
                    $("#submit-btn").html("<i class='fa fa-check'></i>Succeeded!");
                    $("#submit-btn").attr("disabled", false);
                    window.setTimeout(function () {
                        if ($(xml).find('lastISBN').length != 0) {
                            window.location.href = "product.jsp?ISBN=" + $(xml).find("lastISBN").text() + "&sid=" + $(xml).find("lastsid").text();
                        } else {
                            window.location.href = "index.jsp";
                        }
                    }, 500);
                } else {
                    $("#submit-btn").text("SIGN IN");                    
                    $("#submit-btn").attr("disabled", false);      
                    $(".alert-primary").css("display", "block");                    
                }
            }
        });
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