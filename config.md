<!--
Add here global page variables to use throughout your website.
-->
+++
author = "Mehmet Baris Batukan"
mintoclevel = 2
maxtoclevel = 3

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/"]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = "Mehmet Baris Batukan"
website_descr = "Persoanl Website"
website_url   = "https://github.com/mbbatukan/mywebsite.git/"
+++

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\R}{\mathbb R}
\newcommand{\scal}[1]{\langle #1 \rangle}

@def prepath = "mywebsite"