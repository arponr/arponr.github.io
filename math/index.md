---
layout: page
writing:
    - section: Formal writing
      entries:
          - title: Characters in global equivariant homotopy theory
            file: senior-thesis.pdf
            date: March 2015
            desc: My undergraduate thesis, on the generalized character theory of Hopkins-Kuhn-Ravenel and Stapleton.
    - section: Informal notes
      entries:
          - title: Vector fields and the J-homomorphism
            file: vfields.pdf
            date: May 2014
            desc: On the ideas in Adams's solution to the problem of finding vector fields on spheres, and its relation to his work on the J-homomorphism.
          - title: Defining the cotangent complex
            file: quillen-cotangent.pdf
            date: December 2013
            desc: On Quillen's application of the theory of model categories to defining a homology theory of algebras in analogy with singular homology.
          - title: The Dold-Kan correspondence
            file: doldkan.pdf
            date: October 2013
            desc: A proof of the titular result, and a couple of quick consequences.
            
---

## Introduction

I'm a graduate student in mathematics, with interests centered around homotopy theory. I'll be at Cambridge University for [Part III](//www.maths.cam.ac.uk/postgrad/mathiii/) during the 2015--16 academic year, and starting my PhD at Stanford University in Fall 2016.

If you'd like more information, feel free to contact me at [arpon.raksit@gmail.com](mailto:arpon.raksit@gmail.com).

{% for w in page.writing %}
## {{ w.section }}
<ul class="stream">
{% for e in w.entries %}
<li>
  <a href="/files/{{ e.file }}">{{ e.title }}</a>
  <div class="desc">
    {{ e.date }} &mdash;
    {{ e.desc }}
  </div>
</li>
{% endfor %}  
</ul>
{% endfor %}
