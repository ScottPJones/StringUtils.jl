module UnicodeNames

include("./unicodedata.jl")

function lookupchar(str::ASCIIString)
    res = get(unicode16bit, str, 0xd800)
    res != 0xd800 && return UInt32(res)
    get(unicode32bit, str, typemax(UInt32))
end

function loadnames(filename)
    v = Vector{ASCIIString}()
    open(filename, "r") do f
        while true
            l = readline(f)
            l == "" && break
            push!(v, l[1:end-1])
        end
    end
    v
end

function createdicts(filename, v::Vector{ASCIIString})
    open(filename, "w+") do f
        println(f, "const unicode16bit = Dict{ASCIIString, UInt16}(")
        flg16 = true
        for l in v
            vec = split(l, ";")
            num = vec[1]
            str = vec[2]
            alias = vec[11]
            if flg16 && parse(UInt32, num, 16) > 0x0ffff
                println(f, ")\nconst unicode32bit = Dict{ASCIIString, UInt32}(")
                flg16 = false
            end
            if str[1] != '<'
                # Don't save names that simply contain hex representation
                len = length(num)
                if !(str[end-len-1] == '-' && str[end-len:end] == num)
                    println(f, "    \"",str,"\" => 0x",num,",")
                end
            end
            if alias != ""
                println(f, "    \"",alias,"\" => 0x",num,",")
            end
        end
        println(f, ")")
    end
end

end
