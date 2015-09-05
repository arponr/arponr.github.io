$(document).ready(function() {
    $(".stream .title").hover(
        function() {
            $(this).closest("li").find(".desc").show();
        },
        function() {
            $(this).closest("li").find(".desc").hide();
        }
    );
});
