import http.server
import socketserver
import os
import subprocess

PORT = 8090

class Handler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/generate':
            subprocess.run(["/app/generate_summary.sh"])
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"Summary generated")
        elif self.path == '/' or self.path == '/view':
            self.path = '/docker_summary.html'
            return http.server.SimpleHTTPRequestHandler.do_GET(self)
        else:
            self.send_error(404, "File not found")

# Make sure we are in the correct working directory
os.chdir("/app")

# Start server
with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"Serving at port {PORT}")
    httpd.serve_forever()
