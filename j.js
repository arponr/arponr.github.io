// Generated by CoffeeScript 1.7.1
(function() {
  jQuery(function() {
    $(".stream li").each(function() {
      $(this).hover(function() {
        $(this).find(".desc").toggle();
      });
    });
  });

}).call(this);