$(document).ready(function() {
    $(".nano").nanoScroller();

    var $side = $(".side");
    var $browseBar = $(".browse-bar");
    var $main = $(".main");
    var $sideToggle = $(".side-toggle");

    var distance = $side.css("width");

    $sideToggle.click(function () {
        console.log("click");
        var sign = $browseBar.hasClass("active") ? "-=" : "+=";
        $.each([$side, $browseBar, $main], function(i, o) {
            o.animate({left: sign + distance}, 200);
        });
        $browseBar.toggleClass("active");
    });
});
