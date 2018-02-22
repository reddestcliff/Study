# Python

### bpython interpreter
https://bpython-interpreter.org/

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

### use properity

Later, if you decide you need special behavior when an attribute is set, you can migrate to
the @property decorator and its corresponding setter attribute. Here, I define a new
subclass of Resistor that lets me vary the current by assigning the voltage
property. Note that in order to work properly the name of both the setter and getter
methods must match the intended property name.
```python
class VoltageResistance(Resistor):
	def __init__(self, ohms):
	super().__init__(ohms)
	self._voltage = 0

	@property
	def voltage(self):
		return self._voltage

	@voltage.setter
		def voltage(self, voltage):
		self._voltage = voltage
		self.current = self._voltage / self.ohms
```
Now, assigning the voltage property will run the voltage



### deque vs list
https://stackoverflow.com/questions/23487307/python-deque-vs-list-performance-comparison
Deques have O(1) speed for appendleft() and popleft() while lists have O(n) performance for insert(0, value) and pop(0).
List append performance is hit and miss because it uses realloc() under the hood. As a result, it tends to have over-optimistic timings in simple code (because the realloc doesn't have to move data) and really slow timings in real code (because fragmentation forces realloc to move all the data). In contrast, deque append performance is consistent because it never reallocs and never moves data.



### run both python2 and 3
https://stackoverflow.com/questions/341184/can-i-install-python-3-x-and-2-x-on-the-same-computer
https://stackoverflow.com/questions/15912063/how-do-i-run-python-2-and-3-in-windows-7/17245543#17245543

There is a better way of coexistence/launching of Python 2 and Python 3 on Windows. The Python 3.3 introduced the Python launcher for Windows (see http://www.python.org/dev/peps/pep-0397/).
After installation of Python 3.3, the py.exe and pyw.exe is copied to your c:\Windows directory, and the associations are set for the .py extension so that it uses the launcher. By default, Python 2 is launched for py script.py. The py -3 script.py launches Python 3. (This also means that no path for Python must be added to the environment -- the C:\Windows already is in the PATH.)

The best of all is that #!python2 in the script causes lauching via Python 2, the #!python3 causes launching the script via Python 3. This way, you can use scripts for both versions of Python, and you can lauch them the unified way -- py script.py or by just clicking on the script icon.

### spyder tips
* CTRL+SPACE autocompletes commands, function names, variable names, methods; very useful.
* CTRL + <RETURN> executes the current cell (menu enty Run -> Run cell). A cell is defined as the code between two lines which start with the agreed tag #%%.
* ALT + <CURSOR UP> moves the current line up. If multiple lines are highlighted, they are moved up together. ALT+<CURSOR DOWN> works correspondingly moving line(s) down.
* CTRL+i (otherwise) when pressed while the cursor is on an object, opens documentation for that object in the object inspector.
* %reset command which will remove all objects (such as i in the example above) from the current name space, and then execute the code in the editor to make sure standalone code is right
* In the IPython console, we can call %debug straight after an exception has been raised: this will start the IPython debug mode, and allows inspection of local variables at the point where the exception occurred as described above. This is a lot more efficient than adding print statements to the code an running it again.
* The command to get the figures to appear inline in the IPython console is %matplotlib inline.
* The command to get figures appear in their own window (which technically is a QT windown) is %matplotlib qt.

### np array vs matrix
The main advantage of numpy matrices is that they provide a convenient notation for matrix multiplication: if a and b are matrices, then a*b is their matrix product.
numpy arrays consistently abide by the rule that operations are applied element-wise (except for the new @ operator). Thus, if a and b are numpy arrays, then a*b is the array formed by multiplying the components element-wise:
To obtain the result of matrix multiplication, you use np.dot
Since a is a matrix, a**2 returns the matrix product a*a. Since c is an ndarray, c**2 returns an ndarray with each component squared element-wise.
The main advantage of numpy arrays is that they are more general than 2-dimensional matrices. 
What happens when you want a 3-dimensional array? Then you have to use an ndarray, not a matrix object. 





### numpy
http://scipy.github.io/old-wiki/pages/Numpy_Example_List#argmax.28.29

* array_split(), argsort(axis=-1, kind="quicksort"), x.astype(None) # None implies converting to the default (float64), average(a,weights=w) # weighted average,  a.clip(min=10,max=20)
*```python
 a = np.random.rand(1,8)
 [x, y, xx, yy] = np.array_split(a,4,axis = 1)
```

* numpy 1d vector prod 
the following gives same result
array([[ 3,  2,  4],
       [ 0,  0,  0],
       [15, 10, 20]])
```python
a = np.array([1,0,5])
b = np.array([3,2,4])
np.outer(a,b)
a = a[:,np.newaxis]
b = b[np.newaxis,:]
np.dot(a,b)
```
* where()
where(...)
    where(condition, [x, y])  Return elements, either from `x` or `y`, depending on `condition`. 
    If only `condition` is given, return ``condition.nonzero()``.
>>> from numpy import *
>>> a = array([3,5,7,9])
>>> b = array([10,20,30,40])
>>> c = array([2,4,6,8])
>>> where(a <= 6, b, c)
array([10, 20, 6, 8])	
	
 * r_, hstack, vstack, column_stack, concatenate, bmat, s_


