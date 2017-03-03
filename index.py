#!/usr/bin/env python3
import cgitb
import cgi
import os
import sys
cgitb.enable()
print("Content-type: text/html\n\n")
print("<h1>Hello World!</h1>")
print("<h2>Python version: {}</h2>".format(sys.version))
print("<h2>REQUEST_URI: {}</h2>".format(os.environ['REQUEST_URI']))
print("<code>")
for i in dir(cgi):
    print(i)
print("<code>" + str(dir(cgi)) + "</code>")
cgi.test()
