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
Finally, I have added two new ways of representing characters in the literal string,
`\:emojiname:` and `\{latexname}`.
This makes life a lot easier when you want to keep the text of a program in ASCII, and
also to be able to write programs using those characters that might not even display
correctly in their editor.

This now has some initial formatting capability, based on Tom Breloff's wonderful PR #10 to the
JuliaLang/Formatting.jl package (by Dahua Lin and other contributors).
`\%(arguments)` is interpolated as a call to fmt(arguments).

I also plan on adding support for `\%c(arguments)`, where c is a C style formatting character.
I'm debating if I should make it take the full C style syntax, with leading 0, width/precision,
etc, before the single character.

