module FixStrings
export ASCIIStr, UTF8Str, ByteStr

# Deal with mess from #16058
if VERSION >= v"0.5.0-dev+3876"
    const ASCIIStr = String
    const UTF8Str = String
    const ByteStr = String
else
    const ASCIIStr = ASCIIString
    const UTF8Str = UTF8String
    const ByteStr = ByteString
end
end
