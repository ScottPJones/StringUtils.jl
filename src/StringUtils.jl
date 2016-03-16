"""
String utilities and performance improvements

Copyright 2016 Gandalf Software, Inc., Scott P. Jones
Licensed under MIT License, see LICENSE.md
"""
module StringUtils
export @u_str, @sinterpolate
export s_unescape_string, s_escape_string, s_print_unescaped, s_print_escaped

include("literals.jl")
include("unicodenames.jl")
include("htmlnames.jl")

# From Formatting.jl
import Base.show

export FormatSpec, FormatExpr, printfmt, printfmtln, format, generate_formatter
export pyfmt, cfmt, fmt, fmt_default, fmt_default!, reset!, defaultSpec

include("cformat.jl" )
include("fmtspec.jl")
include("fmtcore.jl")
include("formatexpr.jl")
include("fmt.jl")

end
