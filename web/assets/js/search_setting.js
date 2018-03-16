jQuery(document).ready(function () {

    _main();


});
function _main() {
    $("#nav-search-btn").click(search_action);
    $("#nav-search-bar").keydown(function(e) {
        if(e.keyCode == 13){
            search_action();
        }
    })
    $("#side-search-btn").click(function() {
        var name = ($("#side-search-bar").val() == "") ? "Harry Potter" : $("#side-search-bar").val();
        window.location.href="search.jsp?name=" + name;
    })
    $("#side-search-bar").keydown(function(e) {
        if(e.keyCode == 13){
            var name = ($("#side-search-bar").val() == "") ? "Harry Potter" : $("#side-search-bar").val();
            window.location.href="search.jsp?name=" + name;
        }
    })
}

function search_action() {
    var pattern = /^[0-9]{10}$/;
    if (pattern.test($("#nav-search-bar").val()) == true) {
        window.location.href= "search.jsp?ISBN=" + $("#nav-search-bar").val();
    } else {
        var name = $("#nav-search-bar").val();
        pattern = /^(\s)*$/
        if (pattern.test(name) == true) {
            name = "Harry Potter";
        }
        var cate = $("#search-scope").val();
        if (cate == "0") {
            window.location.href= "search.jsp?name=" + name;
        } else {
            window.location.href= "search.jsp?category=" + cate + "&name=" + name;            
        }
    }    
}