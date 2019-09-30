function load_eu_txt(fname::AbstractString, T::Type{<:Real}, sep::AbstractChar)
    h= Hypergraph{T}(0,0)
    weight = convert(T,1)
    vertices_ids_mapping = Dict{Int128,T}() #map vertex_ids into consecutive ids
    hyperedge_ids_mapping = Dict{Int128,T}() #we have to add a dict for hyperegdes to control if a hyperedge already exists
    new_id=1
    he_new_id =1;
    io = open(fname,"r")
    he_dict = Dict{Int128,Array{Int128}}()
    for line in eachline(io)
        vertex_2_edge =split(line,sep)[1:end] #instead of google and facebook, the first word of the line is a node
        app_vertex=parse(Int128,vertex_2_edge[1])

        app_edge=parse(Int128,vertex_2_edge[2])
        if !haskey(hyperedge_ids_mapping,app_edge)
            hyperedge_ids_mapping[app_edge]=he_new_id
            he_new_id+=1

            if !haskey(he_dict,hyperedge_ids_mapping[app_edge])
                he_dict[hyperedge_ids_mapping[app_edge]]=Array{Int128,1}()
            end
        end
        vertices_ids_mapping[new_id]=app_vertex

        push!(he_dict[hyperedge_ids_mapping[app_edge]],new_id)
        new_id+=1
    end
    println(he_dict)
    for key in sort(collect(keys(he_dict)))
        v_app=Dict{Int64,T}()
        for v in he_dict[key]
            v_app[v]=weight
            add_vertex!(h)
        end
        add_hyperedge!(h,vertices=v_app)
    end
    h
end
