from flask import Flask, request, session, redirect, url_for, flash
from flask import render_template_string
from flask_github import GitHub, GitHubError

app = Flask(__name__)
app.config.from_object(__name__)

github = GitHub(app)

HTMLBLOB = """
<!DOCTYPE HTML>
<html>
<table><tbody>
<tr>
    <td class="label"><label for="repo">Repository:</label></td>
    <!-- ok: template-unquoted-attribute-var -->
    <td class="input"><input type="text" id="repo" name="repo" value="{{ request.args.get('repo', '') }}" /></td>
</tr>
<tr>
    <td><label for="issue">Issue:</label></td>
    <!-- ruleid: template-unquoted-attribute-var -->
    <td><input type="number" id="issue" name="issue" value={{ request.args.get('issue', '1')}} min="1"/></td>
</tr>
</tbody></table>
</html>"""

@app.route('/')
def index():
    return render_template_string(HTMLBLOB)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)