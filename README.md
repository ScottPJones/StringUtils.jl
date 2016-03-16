# StringUtils

[![Build Status](https://travis-ci.org/ScottPJones/StringUtils.jl.svg?branch=master)](https://travis-ci.org/ScottPJones/StringUtils.jl)

The StringUtils package in a work-in-progress, where I am placing various improvements on the
String functionality in Julia language.

Currently, it adds a Swift style string macro, `u"..."`, which uses the Swift syntax for
interpolation, i.e. `\(expression)`.  This means that you never have to worry about strings with
the $ character in them, which is rather frequent in some applications.
Also, Unicode sequences are represented as in Swift, i.e. as `\u{hexdigits}`, where there
can be from 1 to 6 hex digits. This syntax eliminates having to worry about always outputting
4 or 8 hex digits, to prevent problems with 0-9,A-F,a-f characters immediately following.
Finally, I have added four ways of representing characters in the literal string,
`\:emojiname:`, `\<latexname>`, `\&htmlname;` and `\N{UnicodeName}`.
This makes life a lot easier when you want to keep the text of a program in ASCII, and
also to be able to write programs using those characters that might not even display
correctly in their editor.

This now has some initial formatting capability, based on Tom Breloff's wonderful PR #10 to the
JuliaLang/Formatting.jl package (by Dahua Lin and other contributors).

`\%(arguments)` is interpolated as a call to fmt(arguments).
This is especially useful when defaults have been set for the type of the first argument.

`fmt_default!{T}(::Type{T}, syms::Symbol...; kwargs...)` sets the defaults for a particular type.
`fmt_default!(syms::Symbol...; kwargs...)` sets the defaults for all types.
Symbols that can currently be used are: `:ljust` or `:left`, `:rjust` or `:right`, `:commas`,
`:zpad` or `:zeropad`, and `:ipre` or `:prefix`.
`reset!{T}(::Type{T})` resets the defaults for a particular type.
`defaultSpec(x)` will return the defaults for the type of x, and
`defaultSpec{T}(::Type{T})` will return the defaults for the given type.

This also adds support for `\%ccc(arguments)`, where ccc is one or more characters of a
single C style format specification, which is interpolated as a call to cfmt("ccc", arguments).

I'm also experimenting with adding Python style syntax (as much as possible), as
u"\{pythonformat}"