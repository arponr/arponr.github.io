---
---

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
        equationNumbers: {
            autoNumber: "AMS"
        },
        extensions: ["AMSmath.js", "AMSsymbols.js", "/js/xypic.js"],
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

MathJax.Ajax.loadComplete("{{ site.baseurl }}/js/jax-config.js");

