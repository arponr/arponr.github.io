jQuery ->
    $(".stream li").each ->
        $(this).hover ->
            $(this).find(".desc").toggle()
            return
        return

    if !$(document.body).hasClass("math")
        Hyphenator.run()
    else
        MathJax.Hub.Config(
            extensions: ["tex2jax.js"]
            tex2jax:
                inlineMath: [["$", "$"]]
            jax: ["input/TeX", "output/HTML-CSS"]
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
                    opname: ["\\operatorname{\\text{#1}}", 1]
                    mathcal: ["\\mathscr{#1}", 1]
                    mathrm: ["\\text{#1}", 1]
                    iso: "\\mathrel{\\large\\simeq}"
                    qed: "~~\\diamondsuit"
        )
        MathJax.Hub.Register.StartupHook "End", ->
            Hyphenator.run()
            return

    return
