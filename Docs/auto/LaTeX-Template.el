(TeX-add-style-hook
 "LaTeX-Template"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "report"
    "rep10"
    "inputenc"
    "amsthm"
    "amsmath"
    "mathtools"
    "amsfonts"
    "amssymb"
    "graphicx"
    "verbatim"
    "fancyhdr"
    "listings"
    "algorithm"
    "algpseudocode"
    "geometry"
    "tikz"
    "tikz-qtree")
   (TeX-add-symbols
    '("Lim" 2)
    '("Frac" 2)
    '("abs" 1)
    '("lr" 2)
    '("set" 1)
    "e"
    "R"
    "N"
    "Q"
    "I"
    "Z"
    "Oh"
    "oh")
   (LaTeX-add-lengths
    "tindent")
   (LaTeX-add-amsthm-newtheorems
    "pic"
    "lem"
    "thm"
    "cor"
    "ex"
    "defn"
    "prob"
    "con"
    "rem"
    "cex"
    "ts"))
 :latex)

