function load_eu_txt(fname::AbstractString, T::Type{<:Real}, sep::AbstractChar)
    h= Hypergraph{T}(0,0)
    weight = convert(T,1)
    vertices_ids_mapping = Dict{Int128,T}() #map vertex_ids into consecutive ids
    hyperedge_ids_mapping = Dict{Int128,T}() #we have to add a dict for hyperegdes to control if a hyperedge already exists
    new_id=1
    hyper_new_id =1
    he_dict = Dict{Int128,Array{Int128}}()
    io = open(fname,"r")
    for line in eachline(io)
        vertex_2_edge =split(line,sep)[1:end] #instead of google and facebook, the first word of the line is a node
        app_vertex=parse(Int128,vertex_2_edge[1])
        print("app_vertex:")
        println(app_vertex)
        app_edge=parse(Int128,vertex_2_edge[2])
        print("app_edge:")
        println(app_edge)
        if !haskey(hyperedge_ids_mapping,app_edge)
            hyperedge_ids_mapping[app_edge]=hyper_new_id
            hyper_new_id+=1
            if !haskey(vertices_ids_mapping,app_vertex)
                vertices_ids_mapping[app_vertex]=new_id
                add_vertex!(h)
                new_id+=1
            end
            add_hyperedge!(h,vertices=Dict{Int,T}([(vertices_ids_mapping[app_vertex],weight)]))
        else
            if !haskey(vertices_ids_mapping,app_vertex)
                vertices_ids_mapping[app_vertex]=new_id
                add_vertex!(h,hyperedges=Dict{Int,T}([(hyperedge_ids_mapping[app_edge],weight)]))
                new_id+=1
            end
        end
    end
    h
end
