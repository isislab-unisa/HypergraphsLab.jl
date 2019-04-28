module HypergraphsLab

export add_two

greet() = print("Hello World!")


"""
    add_two(a,b)

Add two numbers: `a` is added once while `b`
is added twice
"""
function add_two(a::Float64,b::Float64)
    a+2b
end

end # module
