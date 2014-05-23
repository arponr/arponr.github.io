MathJax.Hub.Config(
    extensions: ["tex2jax.js"]
    jax: ["input/TeX", "output/HTML-CSS"]
    tex2jax:
        inlineMath: [["$","$"]]
    "HTML-CSS":
        scale: 95
        availableFonts: []
        webFont: "Neo-Euler"
        mtextFontInherit: true
    TeX:
        extensions: [
            "AMSmath.js"
            "AMSsymbols.js"
            "/js/xypic.js"
        ]
        Macros:
            op: ["\\operatorname{\\text{#1}}", 1])
