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
                    l: "\\left"
                    r: "\\right"
                    f: ["\\frac{#1}{#2}", 2]
                    lv: "\\lvert"
                    rv: "\\rvert"
                    op: ["\\operatorname{\\text{#1}}", 1]
                    c: "\\colon"
                    ce: "\\mathrel{:=}"
                    ec: "\\mathrel{=:}"
                    mr: ["\\mathrm{#1}", 1]
                    mc: ["\\mathscr{#1}", 1]
                    bb: ["\\mathbb{#1}", 1]
                    mb: ["\\mathbf{#1}", 1]
                    mf: ["\\mathfrak{#1}", 1]
                    qed: "~~\\diamondsuit"
                    ob: "\\op{ob}"
                    hom: "\\op{hom}"
                    ker: "\\op{ker}"
                    id: "\\op{id}"
                    max: "\\op{max}"
        )
        MathJax.Hub.Register.StartupHook "End", ->
            Hyphenator.run()
            return

    return
