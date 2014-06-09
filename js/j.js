// Generated by CoffeeScript 1.7.1
(function() {
  jQuery(function() {
    $(".stream li").each(function() {
      $(this).hover(function() {
        $(this).find(".desc").toggle();
      });
    });
    if (!$(document.body).hasClass("math")) {
      Hyphenator.run();
    } else {
      MathJax.Hub.Config({
        extensions: ["tex2jax.js"],
        tex2jax: {
          inlineMath: [["$", "$"]]
        },
        jax: ["input/TeX", "output/HTML-CSS"],
        "HTML-CSS": {
          scale: 95,
          availableFonts: [],
          webFont: "Neo-Euler",
          mtextFontInherit: true
        },
        TeX: {
          extensions: ["AMSmath.js", "AMSsymbols.js", "/js/xypic.js"],
          Macros: {
            opname: ["\\operatorname{\\text{#1}}", 1],
            mathcal: ["\\mathscr{#1}", 1],
            mathrm: ["\\text{#1}", 1],
            iso: "\\mathrel{\\large\\simeq}",
            qed: "~~\\diamondsuit"
          }
        }
      });
      MathJax.Hub.Register.StartupHook("End", function() {
        Hyphenator.run();
      });
    }
  });

}).call(this);
