MathJax.Hub.Config({
    extensions: ["tex2jax.js"],
    tex2jax: {
        inlineMath: [["$", "$"]]
    },
    jax: ["input/TeX", "output/HTML-CSS"],
    "HTML-CSS": {
        imageFont: null,
        webFont: "STIX-Web",
        scale: 95,
        mtextFontInherit: true
    },
    showMathMenu: false,
    TeX: {
        equationNumbers: {
            autoNumber: "AMS"
        },
        extensions: ["AMSmath.js", "AMSsymbols.js", "/js/xypic.js"],
        Macros: {
            opname: ["\\operatorname{\\text{#1}}{}\\!", 1],
            mathcal: ["\\mathscr{#1}", 1],
            mathrm: ["\\text{#1}", 1],
            iso: "\\simeq",
        }
    }
});

MathJax.Ajax.loadComplete("/js/jax-config.js");

