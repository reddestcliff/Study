# Python

### pytest
http://pythontesting.net/framework/pytest/pytest-introduction/


### static abstract method
https://julien.danjou.info/blog/2013/guide-python-static-class-abstract-methods

### mini fmt string example
http://fmtlib.net/latest/syntax.html

### rjust ljust example
"I love <>".replace('<>', 'python').rjust(30).ljust(33,'*')

### conda with different python environment
https://conda.io/docs/user-guide/tasks/manage-python.html
https://stackoverflow.com/questions/37442494/is-it-ok-having-both-anacondas-2-7-and-3-5-installed-in-the-same-time

### use dot for dict access
https://stackoverflow.com/questions/2352181/how-to-use-a-dot-to-access-members-of-dictionary

### Json minify
https://pypi.python.org/pypi/JSON_minify
pip install JSON-minify

### Pycharm
run script directly ctrl+shift+F10

### run python from npp
"C:\python path\python.exe" - i "$(FULL_CURRENT_PATH)"


## Python2

## Tips
*** run both python2 and 3
https://stackoverflow.com/questions/341184/can-i-install-python-3-x-and-2-x-on-the-same-computer
https://stackoverflow.com/questions/15912063/how-do-i-run-python-2-and-3-in-windows-7/17245543#17245543
There is a better way of coexistence/launching of Python 2 and Python 3 on Windows. The Python 3.3 introduced the Python launcher for Windows (see http://www.python.org/dev/peps/pep-0397/).

After installation of Python 3.3, the py.exe and pyw.exe is copied to your c:\Windows directory, and the associations are set for the .py extension so that it uses the launcher. By default, Python 2 is launched for py script.py. The py -3 script.py launches Python 3. (This also means that no path for Python must be added to the environment -- the C:\Windows already is in the PATH.)

The best of all is that #!python2 in the script causes lauching via Python 2, the #!python3 causes launching the script via Python 3. This way, you can use scripts for both versions of Python, and you can lauch them the unified way -- py script.py or by just clicking on the script icon.





