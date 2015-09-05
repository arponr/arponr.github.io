MathJax.Hub.Config({
    extensions: ["tex2jax.js"],
    tex2jax: {
        inlineMath: [["$", "$"]],
    },
    jax: ["input/TeX", "output/HTML-CSS"],
    "HTML-CSS": {
        imageFont: null,
        webFont: "STIX-Web",
        scale: 100,
        linebreaks: {
            automatic: true,
            width: "75% container"
        }
    },
    showMathMenu: false,
    TeX: {
        extensions: ["AMSmath.js", "AMSsymbols.js", "/js/xypic.js"],
        TagSide: "left",
        TagIndent: "0em",
        Macros: {
            opname: ["\\operatorname{#1}", 1],
            mathcal: ["\\mathscr{#1}", 1],
            iso: "\\simeq",
            c: "\\colon",
            ce: "\\mathrel{:=}",
            l: "\\left",
            r: "\\right",
        }
    }
});

MathJax.Ajax.loadComplete("/js/jax-config.js");

