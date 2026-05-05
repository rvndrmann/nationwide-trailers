#!/usr/bin/env python3
"""Simple HTTP server that auto-resolves /about -> /about.html"""
import http.server
import socketserver
import os

PORT = 8080

class Handler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        path = self.path.split('?')[0].split('#')[0]
        # If path has no extension and isn't a directory, try .html
        if '.' not in os.path.basename(path) and not path.endswith('/'):
            html_path = path + '.html'
            if os.path.exists('.' + html_path):
                self.path = html_path + (self.path[len(path):] if len(self.path) > len(path) else '')
        super().do_GET()

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"Serving at http://localhost:{PORT}")
    httpd.serve_forever()
