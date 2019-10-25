function loadamazon(fname::AbstractString, T::Type{<:Real}, sep::AbstractChar,init_sep_line::Real)
    h= Hypergraph{T}(0,0)
    weight = convert(T,1)
    vertices_ids_mapping = Dict{Int128,Int}() #map vertex_ids into consecutive ids
     new_id=1
     lines=0
     nodes=0
    io = open(fname,"r")
    for line in eachline(io)
        lines+=1
        vertices_ids =split(line,sep)[init_sep_line:end] #instead of google and facebook, the first word of the line is a node
        vertices_dict = Dict{Int64,T}()
        for v_id in vertices_ids
            old_id = parse(Int128, v_id)
            if !haskey(vertices_ids_mapping, old_id)
                add_vertex!(h)
                vertices_ids_mapping[old_id] = new_id
                new_id +=1
                nodes+=1
            end
            vertices_dict[vertices_ids_mapping[old_id]] = weight
        end
        add_hyperedge!(h,vertices = vertices_dict)
    end
    h
end
