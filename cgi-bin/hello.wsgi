import sys

#Expand Python classes path with your app's path
sys.path.insert(0, "/opt/hello_app/cgi-bin")

from hello import app

#Put logging code (and imports) here ...

#Initialize WSGI app object
application = app
