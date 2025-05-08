#!/bin/bash

OUTPUT_FILE="/app/docker_summary.html"
CURRENT_TIME=$(date +"%Y-%m-%d %H:%M:%S")

{
echo "<html><head><title>Docker Summary</title>
<style>
  body { background-color: #121212; color: #f0f0f0; font-family: Arial, sans-serif; padding: 20px; }
  h1 { color: #ffffff; }
  button { background-color: #333; color: #fff; border: none; padding: 10px 20px; margin-bottom: 20px; cursor: pointer; }
  button:hover { background-color: #555; }
  table { border-collapse: collapse; width: 100%; margin-top: 10px; }
  th, td { border: 1px solid #444; padding: 8px; text-align: left; }
  th { background-color: #222; cursor: pointer; }
  tr:nth-child(even) { background-color: #1e1e1e; }
  tr:hover { background-color: #333; }
</style>
<script>
function sortTable(n) {
  var table = document.getElementById(\"dockerTable\");
  var rows = Array.from(table.rows).slice(1);
  var asc = table.getAttribute(\"data-sort-dir\") !== \"asc\";
  rows.sort((a, b) => {
    var x = a.cells[n].innerText.toLowerCase();
    var y = b.cells[n].innerText.toLowerCase();
    return (x < y ? -1 : x > y ? 1 : 0) * (asc ? 1 : -1);
  });
  rows.forEach(row => table.appendChild(row));
  table.setAttribute(\"data-sort-dir\", asc ? \"asc\" : \"desc\");
}
function regenerate() {
  fetch('/generate').then(() => location.reload());
}
</script>
</head><body>
<h1>Docker Summary</h1>
<p>Generated at: $CURRENT_TIME</p>
<button onclick=\"regenerate()\">Generate Summary</button>
<table id=\"dockerTable\" data-sort-dir=\"asc\">
<tr>
  <th onclick=\"sortTable(0)\">Container ID</th>
  <th onclick=\"sortTable(1)\">Name</th>
  <th onclick=\"sortTable(2)\">Image</th>
  <th onclick=\"sortTable(3)\">Status</th>
  <th onclick=\"sortTable(4)\">Ports</th>
</tr>"
docker ps -a --format '<tr><td>{{.ID}}</td><td>{{.Names}}</td><td>{{.Image}}</td><td>{{.Status}}</td><td>{{.Ports}}</td></tr>'
echo "</table></body></html>"
} > "$OUTPUT_FILE"

echo "Docker summary generated!"