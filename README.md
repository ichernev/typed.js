typed.js
========

Javascript type anotation library

Note
----

I haven't exported this to npm, bower, amd, cjs, browser environments. Expect
that soon.

Basic usage
-----------

```coffeescript
typed = require 'typed'

f = typed(Number, String) (x, y) ->
  a = 0
  a += x
  b = ''
  b += y
  return a, b

# works good
f(1, 'a')

# throws exception
f('a', 1)
```

Supported type expressions
--------------------------

* Boolean, Number, String, Function, RegExp, Object
* any -- matches anything
* any(type1[, type2...]) -- matches type1 OR type2 OR ...
* maybe(type) -- matches type OR null OR undefined
* maybe(type1, type2 ...) -- matches undefined OR null OR type1 OR type2 OR ...
* [type] -- matches an array of type
* [type1, type2 ...] -- matches a fixed length array, where each element is
  checked for the corresponding type
* {'key': type, ...} -- matches an object which has the specified keys of the
  specified types
