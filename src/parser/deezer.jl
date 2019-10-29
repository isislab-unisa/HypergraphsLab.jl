function load_deezer(fname::AbstractString, T::Type{<:Real})
    h=Hypergraph{T,AbstractString,AbstractString}(0,0)
    weight = convert(T,1)
    hyperedges_ids_mapping = Dict{AbstractString,Int}()
    new_id=1
    io=open(fname,"r")
    file= readline(io)
    object_dict=JSON.parse(file)
    for key in keys(object_dict)
        hyperedges=Dict{Int,Int}()
        for v in object_dict[key]
            if (!haskey(hyperedges_ids_mapping,v))
                hyperedges_ids_mapping[v]=new_id
                SimpleHypergraphs.add_hyperedge!(h)
                set_hyperedge_meta!(h,v,new_id)
                new_id+=1
            end
            hyperedges[hyperedges_ids_mapping[v]]=weight
        end
        add_vertex!(h,hyperedges=hyperedges)
    end
    h
end
