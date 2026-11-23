Expr family of objects\
by [Shahrokh Yadegari](https://yadegari.org)
--------------------------------------------

\
Back to the [Software Page](https://yadegari.org/software/)\
\

------------------------------------------------------------------------

## \[expr\], \[expr~\], \[fexpr~\]

Based on original sources from IRCAM’s jMax Released under BSD License.

The **\[expr\]** family is a set of C-like expression evaluation objects for the graphical music language Pure Data. It used to come as an ‘extra’ external, but it is now a built-in native object.

**\[expr\]** runs in control rate and evaluates C-like expressions. See below for the list of operators. Multiple expressions separated by semicolons can be defined in a single **\[expr\]** object and this results in multiple outlets (up to 100, each for each expression). Expressions are evaluated from right to left (which means that the bottom expression will be the first executed.) The number of inlets in expr are defined by variables that take a few different forms: **\$i#**, **\$i#** and **\$s#** for 'integers', 'floats' and 'symbols' ('#' is an inlet number from 1 up to 100, ordered from left to right). As an example, we can have 3 inlets defined as "\$i1", "\$f2" and "\$s3", where:

- **\$i1** is the input from the first (left) inlet and is treated as an integer
- **\$f2** is the input from the second (middle) inlet and is treated as a float
- **\$s3** is the input from the third (middle) and expects a symbol

Arrays and variables (defined using the \[value\] object) can be accessed the same way one dimensional arrays are accessed in C; for example, “valx + 10” will be evaluated to the value of variable ‘valx’ + 10 and “tabname\[5\]” will be evaluated to be the 5th element of an array named “tabname”. The name of the arrays can also be given by an input; for example “\$s2\[5\]” will be evaluated to be the 5 element of the array whose symbol has been passed in inlet 2.

Type conversion from a float input to an integer is done automatically if the inlet is defined as an integer. Conversely, you can convert it explicitly by using functions (see below for the list of functions).

**\[expr\]** is also able to manipulate and output symbols. A symbol is written as a string with quotes around it, such as "hello", or as a symbol input **\$s#** such as **\$s2**. For more information about supported string manipulation functions see below.

**\[expr~\]** is designed to efficiently combine signal and control stream processing by vector operations on the basis of the audio block size. The operations, functions, and syntax for **\[expr~\]** is just like **\[expr\]** with the addition of the **\$v#** variable for signal vector input (also numbered up to 100). The '\$v' is needed at least for the first and main input, so:

- **\$v1** - means the first inlet is a signal input
- **\$i2** - means the second inlet is an integer input
- **\$f2** - means the third inlet is a float input
- **\$s4** - means the fourth inlet is a symbol input

The result of an expression from **\[expr~\]** is also an audio signal and multiple expressions up to 100 can also be defined via semicolons.

Note for MSP users: Currently in the MSP version all signal inputs should come first followed by other types of inlet. (There seems to be no way of mixing signal and other types of inlets in their order in Max/MSP, if you know otherwise, please let me know.) This means that signal inlets cannot be mixed with other types of inlets. For example, \[expr~ \$v1 + \$f2 + \$v3\] is not legal. The second and third inlet should be switched and \[expr~ \$v1 + \$v2 + \$f3\] should be used instead. In Pd you can mix them in any way you want.

The **\[fexpr~\]** object provides a flexible mechanism for building FIR and IIR filters by evaluating expressions on a sample by sample basis and providing access to prior samples of the input and output audio streams. When fractional offset is used, **\[fexpr~\]** uses linear interpolation to determine the value of the indexed sample. The operations, functions, and syntax for **\[fexpr~\]** is just like **\[expr\]** with the addition of **\$x#** and **\$y#** variables. The **\[fexpr~\]** object can access previous input and output samples up to the block size (64 by default).

**\$x#** is used to denote a signal input whose samples we would like to access. The syntax is \$x followed by '#' (the inlet number up to 100) and the samples indexed by brackets, for example \$x1\[-1\] specifies the previous sample of the first inlet. Therefore, if we are to build a simple filter which replaces every sample by the average of that sample and its previous one, we would use **\[fexpr~ (\$x1\[0\] + \$x1\[-1\]) / 2\]**. For ease of when the brackets are omitted, the current sample is implied, so we can write the previous filter expression as follows: **\[fexpr~ (\$x1 + \$x1\[-1\]) / 2\]**. To build IIR filters **\$y#** is used to access the previous output samples indexed from -1 inside brackets. Note now that '#' here is used to define the outlet number.

The first inlet also needs to be a signal input (\$x1), the output of **\[fexpr~\]** is a signal output and multiple expressions can also be defined via semicolons and each will correspond to an outlet that can be accessed by '\$y#'. Note that '\$v#' is not allowed in **\[fexpr~\]**, so:

- **\$x1\[n\]** - means the first inlet is a signal input and 'n' is an index from 0 to -block size
- **\$y1\[n\]** - is used to access output samples from the first expression and 'n' is an index from -1 to -block size
- **\$i2** - means the second inlet is an integer input
- **\$f2** - means the third inlet is a float input
- **\$s4** - means the fourth inlet is a symbol input

------------------------------------------------------------------------

### The operators \[expr\], \[expr~\] and \[fexpr~\] support (listed from highest precedence to lowest) are as follows:

`~`  
One’s complement

`*`  
Multiply

`/`  
Divide

`%`  
Modulo

`+`  
Add

`-`  
Subtract

`<<`  
Shift Left

`>>`  
Shift Right

`<`  
Less than (boolean)

`<=`  
Less than or equal (boolean)

`>`  
Greater than (boolean)

`>=`  
Greater than or equal (boolean)

`==`  
Equal (boolean)

`!= `  
Not equal (boolean)

`& `  
Bitwise And

`^`  
Exclusive Or

`|`  
Bitwise Or

`&&`  
Logical And (boolean)

`||`  
Logical Or (boolean)

`!`  
Logical Not (boolean)

### The supported functions for \[expr\], \[expr~\] and \[fexpr~\] are:

**General Functions**

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr>
<th>Function<br />
Name</th>
<th># of<br />
Args</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>if()</td>
<td>3</td>
<td>conditional - if (condition, IfTrue-expr, IfFalse-expr) - in [expr~] if ‘condition’ is a signal, the result will be determined on sample by sample basis (added in version 0.4)</td>
</tr>
<tr>
<td>int()</td>
<td>1</td>
<td>convert to integer</td>
</tr>
<tr>
<td>rint()</td>
<td>1</td>
<td>round a float to a nearby integer</td>
</tr>
<tr>
<td>floor()</td>
<td>1</td>
<td>largest integral value not greater than argument (added in version 0.4)</td>
</tr>
<tr>
<td>ceil()</td>
<td>1</td>
<td>smallest integral value not less than argument (added in version 0.4)</td>
</tr>
<tr>
<td>float()</td>
<td>1</td>
<td>convert to float</td>
</tr>
<tr>
<td>min()</td>
<td>2</td>
<td>minimum</td>
</tr>
<tr>
<td>max()</td>
<td>2</td>
<td>maximum</td>
</tr>
<tr>
<td>abs()</td>
<td>1</td>
<td>absolute value (added in version 0.3)</td>
</tr>
<tr>
<td>if()</td>
<td>3</td>
<td>conditional - if (condition, IfTrue-expr, IfFalse-expr) - in [expr~] if ‘condition’ is a signal, the result will be determined on sample by sample basis (added in version 0.4)</td>
</tr>
<tr>
<td>isinf()</td>
<td>1</td>
<td>is the value infinite (added in version 0.4)</td>
</tr>
<tr>
<td>finite()</td>
<td>1</td>
<td>is the value finite (added in version 0.4)</td>
</tr>
<tr>
<td>isnan()</td>
<td>1</td>
<td>is the value non a number (added in version 0.4)</td>
</tr>
<tr>
<td>copysign()</td>
<td>2</td>
<td>copy sign of a number(added in version 0.4)</td>
</tr>
<tr>
<td>imodf()</td>
<td>1</td>
<td>get signed integer value from floating point number(added in version 0.4)</td>
</tr>
<tr>
<td>modf()</td>
<td>1</td>
<td>get signed fractional value from floating-point number(added in version 0.4)</td>
</tr>
<tr>
<td>remainder()</td>
<td>2</td>
<td>floating-point remainder function (added in version 0.4)</td>
</tr>
<tr>
<td>fmod()</td>
<td>1</td>
<td>floating-point remainder function (added in version 0.4)</td>
</tr>
</tbody>
</table>

**Power Functions**

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr>
<th>Function<br />
Name</th>
<th># of<br />
Args</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>pow()</td>
<td>2</td>
<td>raise to the power of {e.g., pow(x,y) is x to the power of y}</td>
</tr>
<tr>
<td>sqrt()</td>
<td>1</td>
<td>square root</td>
</tr>
<tr>
<td>exp()</td>
<td>1</td>
<td>e raised to the power of the argument {e.g., exp(5.2) is e raised to the power of 5.2}</td>
</tr>
<tr>
<td>ln() and log()</td>
<td>1</td>
<td>natural log</td>
</tr>
<tr>
<td>log10()</td>
<td>1</td>
<td>log base 10</td>
</tr>
<tr>
<td>fact()</td>
<td>1</td>
<td>factorial</td>
</tr>
<tr>
<td>erf()</td>
<td>1</td>
<td>error function (added in version 0.4)</td>
</tr>
<tr>
<td>erfc()</td>
<td>1</td>
<td>complementary error function (added in version 0.4)</td>
</tr>
<tr>
<td>cbrt()</td>
<td>1</td>
<td>cube root (added in version 0.4)</td>
</tr>
<tr>
<td>expm1()</td>
<td>1</td>
<td>exponential minus 1 (added in version 0.4)</td>
</tr>
<tr>
<td>log1p()</td>
<td>1</td>
<td>logarithm of 1 plus (added in version 0.4)</td>
</tr>
<tr>
<td>ldexp()</td>
<td>2</td>
<td>multiply floating-point number by integral power of 2 (added in version 0.4)</td>
</tr>
</tbody>
</table>

**Trigonometric (all trigonometric functions here expect radian values)**

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr>
<th>Function<br />
Name</th>
<th># of<br />
Args</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>sin()</td>
<td>1</td>
<td>sine</td>
</tr>
<tr>
<td>cos()</td>
<td>1</td>
<td>cosine</td>
</tr>
<tr>
<td>tan()</td>
<td>1</td>
<td>tangent</td>
</tr>
<tr>
<td>asin()</td>
<td>1</td>
<td>arc sine</td>
</tr>
<tr>
<td>acos()</td>
<td>1</td>
<td>arc cosine</td>
</tr>
<tr>
<td>atan()</td>
<td>1</td>
<td>arc tangent</td>
</tr>
<tr>
<td>atan2()</td>
<td>2</td>
<td>arc tangent of 2 variables</td>
</tr>
<tr>
<td>sinh()</td>
<td>1</td>
<td>hyperbolic sine</td>
</tr>
<tr>
<td>cosh()</td>
<td>1</td>
<td>hyperbolic cosine</td>
</tr>
<tr>
<td>tanh()</td>
<td>1</td>
<td>hyperbolic tangent</td>
</tr>
<tr>
<td>asinh()</td>
<td>1</td>
<td>inverse hyperbolic sine</td>
</tr>
<tr>
<td>acosh()</td>
<td>1</td>
<td>inverse hyperbolic cosine</td>
</tr>
<tr>
<td>atan()</td>
<td>1</td>
<td>inverse hyperbolic tangent</td>
</tr>
<tr>
<td>hypot()</td>
<td>2</td>
<td>euclidean distance function (0 to this location)</td>
</tr>
</tbody>
</table>

**Table Functions**

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr>
<th>Function<br />
Name</th>
<th style="text-align: center;"># of<br />
Args</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>size()</td>
<td>1</td>
<td>size of a table</td>
</tr>
<tr>
<td>sum()</td>
<td>1</td>
<td>sum of all elements of a table</td>
</tr>
<tr>
<td>Sum()</td>
<td>3</td>
<td>sum of elements of a specified boundary of a table</td>
</tr>
<tr>
<td>avg()</td>
<td>1</td>
<td>averages all elements of a table</td>
</tr>
<tr>
<td>Avg()</td>
<td>3</td>
<td>averages elements of a specified boundary of a table</td>
</tr>
</tbody>
</table>

**Acoustics Functions**

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr>
<th>Function<br />
Name</th>
<th># of<br />
Args</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>mtof()</td>
<td>1</td>
<td>convert MIDI pitch to frequency in hertz</td>
</tr>
<tr>
<td>ftom()</td>
<td>1</td>
<td>convert frequency in hertz to MIDI pitch</td>
</tr>
<tr>
<td>dbtorms()</td>
<td>1</td>
<td>convert db to rms</td>
</tr>
<tr>
<td>rmstodb()</td>
<td>1</td>
<td>convert rms to db</td>
</tr>
<tr>
<td>powtodb()</td>
<td>1</td>
<td>convert power to db</td>
</tr>
<tr>
<td>dbtopow()</td>
<td>1</td>
<td>convert db to power</td>
</tr>
</tbody>
</table>

**String Manipulation Functions (the ones that return a symbol only work for \[expr\])**

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left; width: 50%;">Function<br />
Name</th>
<th># of<br />
Args</th>
<th>returns</th>
<th style="text-align: left; width: 30%;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>symbol(int/float/symbol [, int X, int Y])<br />
sym(int/float/symbol)</td>
<td>0, 1, 2, or 3</td>
<td>symbol</td>
<td>symbol formatted based on the type of the input<br />
<br />
0 argument will result in an empty symbol<br />
<br />
1 argument will produce a symbol from string/symbol, int, float, according to the %s, %d, %f syntax in sprintf() respectively<br />
<br />
2 argument (sym, X) will produce a symbol from string/symbol, int, float, according to the %Xs, %.Xd, %.Xf syntax in sprintf() respectively<br />
<br />
3 arguments (sym, X, Y) will produce a symbol from string/symbol, int, float, according to the %Y.Xs, %Y.Xd, %Y.Xf syntax in sprintf() respectively</td>
</tr>
<tr>
<td>var(symbol)</td>
<td>1</td>
<td>float</td>
<td>var() will treat the value of the symbol argument as a variable name and returns the value of the variable</td>
</tr>
<tr>
<td>strlen(symbol)</td>
<td>1</td>
<td>int</td>
<td>length of symbol</td>
</tr>
<tr>
<td>tolower(symbol)</td>
<td>1</td>
<td>symbol</td>
<td>convert all upper-case letters of the string to the corresponding lower-case letters</td>
</tr>
<tr>
<td>tonlower(symbol, int)</td>
<td>2</td>
<td>symbol</td>
<td>convert n'th character of the string from upper-case letter to the corresponding lower-case letter</td>
</tr>
<tr>
<td>toupper(symbol)</td>
<td>1</td>
<td>symbol</td>
<td>convert all lower-case letters of the string to the corresponding upper-case letters</td>
</tr>
<tr>
<td>tonupper(symbol, int)</td>
<td>2</td>
<td>symbol</td>
<td>convert n'th character of the string from lower-case letter to the corresponding upper-case letter</td>
</tr>
<tr>
<td>strcat(symbol, symbol, ...)</td>
<td>var</td>
<td>symbol</td>
<td>Concatenate two or more strings</td>
</tr>
<tr>
<td>strncat(symbol, symbol, int)</td>
<td>3</td>
<td>symbol</td>
<td>Concatenate the first string, by no more than n characters of the second string</td>
</tr>
<tr>
<td>strcmp(symbol, symbol)</td>
<td>2</td>
<td>int</td>
<td>Compare two strings; return an integer greater than, equal to, or less than 0, according as the first string is greater than, equal to, or less than the second string.</td>
</tr>
<tr>
<td>strncmp(symbol, symbol, int)</td>
<td>3</td>
<td>int</td>
<td>Compare no more than n characters of two strings; return an integer greater than, equal to, or less than 0, according as the first string is greater than,</td>
</tr>
<tr>
<td>strcasecmp(symbol, symbol)</td>
<td>2</td>
<td>int</td>
<td>similar to strcmp() but ignore case of the letters</td>
</tr>
<tr>
<td>strncasecmp(symbol, symbol, int)</td>
<td>3</td>
<td>int</td>
<td>similar to strncmp() but ignore case of the letters</td>
</tr>
<tr>
<td>strpbrk(symbol, symbol)</td>
<td>2</td>
<td>symbol</td>
<td>In the first string locate the first occurrence of any character in the second (character set) string and return a substring of the first string starting with the found character. If no characters from second string is found return 0;</td>
</tr>
<tr>
<td>strspn(symbol, symbol)</td>
<td>2</td>
<td>int</td>
<td>return the string array index of the first character of the first string which is not in the second (charset) string, else return the index of the first null character.</td>
</tr>
<tr>
<td>strcspn(symbol, symbol)</td>
<td>2</td>
<td>int</td>
<td>return the string array index of the first character of the first string which is also in charset, else return the index of the first null character.</td>
</tr>
</tbody>
</table>

\

------------------------------------------------------------------------

### CHANGELOG:

### version 0.58

- Added string functions in \[expr\]; now expr can output symbols (major redesign)
- Provide better error messages; now expr prints the \[expr\] string when reporting errors
- Fixed the \[expr~\] array\[0\]" bug
- Fixed a memory issue were extra unused output vectors were\
  allocated for each inlet
- NOTE: the syntax func("\$s#", ...) is now deprecated and func(\$s#, ...) should be used

### version 0.57

- fixed a bug in fact().
- fact() (factorial) now calculates and returns its value in double
- fixed the bad lvalue bug - “4 + 5 = 3” was not caught before
- Added mtof(), mtof(), dbtorms(), rmstodb(), powtodb(), dbtopow()

### version 0.56

- \[fexpr~\] now accepts a float in its first input.
- Added avg() and Avg() back to the list of functions

### version 0.55

- The arrays now redraw after a store into one of their members
- ex_if() (the “if()” function is reworked to only evaluate either the left or the right args depending on the truth value of the condition. However, if the condition is an audio vector, both the left and the right are evaluated regardless.
- priority of ‘,’ and ‘=’ was switched to fix the bug of using store “=” in functions with multiple arguments, which caused an error during execution.
- The number of inlet and outlets (MAX_VARS) is now set at 100

### version 0.5

- \[expr\], \[expr~\], and \[fexpr~\] are now built-in native objects.
- minor fixes/improvements.

### version 0.4

- \[expr\], \[expr~\], and \[fexpr~\] now support multiple expressions separated by semicolons which results in multiple outlets.
- Variables are supported now in the same way they are supported in C. - Variables have to be defined with the “value” object prior to execution.
- A new if function if (condition-expression, IfTrue-expression, IfFalse-expression) has been added.
- New math functions added.
- New shorthand notations for \[fexpr~\] have been added.
  - \$x -\>\$x1\[0\] \$x# -\> \$x#\[0\]
  - \$y = \$y1\[-1\] and \$y# = \$y#\[-1\]
- New ‘set’ and ‘clear’ methods were added for \[fexpr~\]
  - clear - clears all the past input and output buffers
  - clear x# - clears all the past values of the \#th input
  - clear y# - clears all the past values of the \#th output
  - set x# val-1 val-2 … - sets as many supplied value of the \#th input; e.g., “set x2 3.4 0.4” - sets x2\[-1\]=3.4 and x2\[-2\]=0.4
  - set y# val-1 val-2 … - sets as many supplied values of the \#th output; e.g, “set y3 1.1 3.3 4.5” - sets y3\[-1\]=1.1 y3\[-2\]=3.3 and y3\[-3\]=4.5;
  - set val val … - sets the first past values of each output; e.g., e.g., “set 0.1 2.2 0.4” - sets y1\[-1\]=0.1, y2\[-1\]=2.2, y3\[-1\]=0.4
