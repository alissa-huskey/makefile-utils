Makefile Utils
==============

End user utilities for Makefiles.

Usage
-----

Simply download `utils.mk` and include it in your makefile.

```make
include utils.mk
```

Example
-------

An example Makefile is included in this repo.

![demo](demo.gif)

Features
--------

- help target        : list all targets have the format:
                       `target:  ## help text`
- vars target        : print a list of variables and their values, excluding
                       env, default, automatic, and any that start with `.`
- PROJECT variable   : name of project; can be set in including makefile or
                       defaults to basename of directory utils.mk is in
- .prettify variable : can be used to colorize the first value in each
                       tab-seperated line and columnize the list
                       example:
                       `@printf "%s\t%s\n" "time" "$(shell now)" | $(.prettify)`


Meta
----

- Github: [alissa-huskey/makefile-utils](https://github.com/alissa-huskey/makefile-utils)
- License: MIT
