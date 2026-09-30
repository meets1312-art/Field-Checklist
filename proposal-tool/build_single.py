#!/usr/bin/env python3
"""Build dist/proposal-builder.html: index.html with the PDF reader inlined, so it is ONE file to share."""
import os
here = os.path.dirname(os.path.abspath(__file__))
rd = lambda *p: open(os.path.join(here, *p), encoding="utf-8").read()
html = rd("index.html")
lib, worker = rd("lib", "pdf.min.js"), rd("lib", "pdf.worker.min.js")
for name, txt in (("pdf.min.js", lib), ("pdf.worker.min.js", worker)):
    assert "</script" not in txt, name + " contains </script"
tag = '<script src="lib/pdf.min.js"></script>'
assert tag in html
html = html.replace(tag, "<script>" + lib + "</script>\n<script type=\"text/plain\" id=\"pdfWorkerSrc\">" + worker + "</script>")
os.makedirs(os.path.join(here, "dist"), exist_ok=True)
out = os.path.join(here, "dist", "proposal-builder.html")
open(out, "w", encoding="utf-8").write(html)
print("wrote", out, round(len(html) / 1e6, 2), "MB")
