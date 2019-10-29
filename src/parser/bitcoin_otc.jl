function load_bitcoin_otc(fname::AbstractString, T::Type{<:Real}, sep::AbstractChar)
    h= Hypergraph{T,AbstractDict,AbstractDict}(0,0)
    weight = convert(T,1)
    vertices_ids_mapping = Dict{Int128,T}() #map vertex_ids into consecutive ids
    hyperedge_ids_mapping = Dict{Int128,T}() #we have to add a dict for hyperegdes to control if a hyperedge already exists
    new_id=1
    hyper_new_id =1
    he_dict = Dict{Int128,Array{Int128}}()
    io = open(fname,"r")
    for line in eachline(io)
        h_meta=Dict{String,Any}()
        vertex_2_edge =split(line,sep)[1:end] #instead of google and facebook, the first word of the line is a node
        app_vertex=parse(Int128,vertex_2_edge[1])
        app_edge=parse(Int128,vertex_2_edge[2])
        h_meta["Rating"]=parse(Int64,vertex_2_edge[3])
        h_meta["TimeStamp"]=parse(Float64,vertex_2_edge[4])
        if !haskey(hyperedge_ids_mapping,app_edge) # if hyperedge doesn't exists in Hypergraph
            hyperedge_ids_mapping[app_edge]=hyper_new_id
            hyper_new_id+=1
            if !haskey(vertices_ids_mapping,app_vertex) #if vertex doesn't exists in Hypergraph
                vertices_ids_mapping[app_vertex]=new_id
                SimpleHypergraphs.add_vertex!(h)
                new_id+=1
            end
            add_hyperedge!(h,vertices=Dict{Int,T}([(vertices_ids_mapping[app_vertex],weight)]))
            h_meta_vertex=Dict{Int,Any}()
            h_meta_vertex[vertices_ids_mapping[app_vertex]]=h_meta
            set_hyperedge_meta!(h,h_meta_vertex,hyperedge_ids_mapping[app_edge])
        else #if hyperedge already exists in Hypergraph
            if !haskey(vertices_ids_mapping,app_vertex)
                vertices_ids_mapping[app_vertex]=new_id
                SimpleHypergraphs.add_vertex!(h,hyperedges=Dict{Int,T}([(hyperedge_ids_mapping[app_edge],weight)]))
                new_id+=1
                h_meta_vertex=Dict{Int,Any}()
                h_meta_vertex[vertices_ids_mapping[app_vertex]]=h_meta
                set_hyperedge_meta!(h,merge(get_hyperedge_meta(h,hyperedge_ids_mapping[app_edge]),h_meta_vertex),hyperedge_ids_mapping[app_edge])
            end

        end
    end
    h
end
