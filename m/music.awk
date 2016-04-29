# Generator for http://lambda.lt/m
# martynasp@gmail.com | 2016

BEGIN {
    state = 0 # '0' - new line, '1' - title, '2' - url, '3' - tags
    entry = ""

    print "<!doctype html>"
    print "<html lang=\"en\">"
    print "<head>"
    print "  <meta charset=\"utf-8\">"
    print "  <title>music discoveries</title>"
    print "  <style>"
    print "    body { font-family: monospace; background-color: #000000; color: #fefefe; }"
    print "    span.date { font-style: italic; }"
    print "    li { padding-top: .5em; }"
    print "    li a { color: #fefefe; font-weight: bold; text-decoration: underline; }"
    print "    li a:hover { text-decoration: none; }"
    print "    span.tags { color: #81ceeb; }"
    print "    #footer { color: #b0aeae; }"
    print "    #footer a { color: #b0aeae; }"
    print "  </style>"
    print "</head>"
    print "<body>"
    print "<p>"
    print "An experiment to keep track of my music discoveries. <br>"
    print "Most of the stuff has been found while being high on caffeine"
    print "and/or deep inside my terminal."
    print "</p>"
    print "<ul>"

}

# tags
state == 3 { state = 4; entry = entry "<span class=\"tags\">" $0 "</span></li>"; print entry; }
# url
state == 2 { state = 3; entry = entry "<a href=\"" $0 "\">" title "</a> "; }
# title
state == 1 { state = 2; title = $0; }
# date
state == 0 { state = 1; entry = "<li><span class=\"date\">[" $0 "]</span> "; }
state != 0 && /^$/ { state = 0; }

END {
    print "</ul>"
    print "<div id=\"footer\">"
    print "Generated with <a href=\"http://lambda.lt/m/music.awk\">music.awk</a>, "
    print "input <a href=\"http://lambda.lt/m/music.txt\">music.txt</a> "
    print " | "
    print "Last Update: "
    system("date")
    print "</div>"
    print "</body>"
    print "</html>"
}
