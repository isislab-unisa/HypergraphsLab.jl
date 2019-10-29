function load_twittercircles(fname::AbstractString, T::Type{<:Real}, sep::AbstractChar)
    h = Hypergraph{T}(0,0)
    weight = convert(T, 1)
    vertices_ids_mapping = Dict{Int, Int}() #map vertex_ids into consecutive ids
    new_id = 1
    io = open(fname, "r")
    for line in eachline(io) #for each he
        vertices_ids = split(line, sep)[2:end] #the first id is the he_id
        vertices_dict = Dict{Int, T}() #each dict represents a he
        for v_id in vertices_ids
            old_id = parse(Int, v_id)
            if !haskey(vertices_ids_mapping, old_id)
                SimpleHypergraphs.add_vertex!(h)
                vertices_ids_mapping[old_id] = new_id #map old_id into new_id
                new_id += 1
            end
            vertices_dict[vertices_ids_mapping[old_id]] = weight
        end
        add_hyperedge!(h, vertices = vertices_dict)
    end
    close(io)
    h
end
