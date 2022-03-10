# Native Bounder

NativeBounder is a library gather text inside of two lexical tokens inside of a string.

Example:

```d

import std.stdio;

import nbound;

void main() {
    try {
        string chunk = nb_gettext("((text)text()))", "(", ")"); // (text)text()
    } catch (NBUnmatched) {
        writeln("Something went wrong.");
    }
}



```

Essentially written for lexical analysis, for applications that need it.

It has two exceptions, 

- NBounds Unmatched