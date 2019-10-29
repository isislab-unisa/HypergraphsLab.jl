function load_steam_reviews(fname::AbstractString, T::Type{<:Real}, vertex_name::AbstractString, vertex_set_name::AbstractString, edge_name::AbstractString)
        h=Hypergraph{T,AbstractDict,AbstractDict}(0,0)
        weight = convert(T,1)
        vertices_ids_mapping = Dict{AbstractString,Int}()
        new_id=1
        lines=0
        io = open(fname,"r") #file name
        for line in eachline(io) #for each hyperedge of the file
            lines+=1
            h_meta=Dict{AbstractString,Any}()
            vertices_dict= Dict{Int64,T}()
            actual_object=JSON.parse(line)
            for key in keys(actual_object)
                h_meta[key]=actual_object[key]
            end
            i=1
            vertices_ids=actual_object[vertex_set_name]
            for v_id in vertices_ids #for each vertex of the file
                v_meta=Dict{AbstractString,Any}()
                for key in keys(v_id)
                    v_meta[key]=v_id[key]
                end
                old_id = v_id[vertex_name]
                if !haskey(vertices_ids_mapping,old_id)
                    SimpleHypergraphs.add_vertex!(h)
                    set_vertex_meta!(h,v_meta,new_id)
                    vertices_ids_mapping[old_id] = new_id
                    new_id+=1
                end
                vertices_dict[vertices_ids_mapping[old_id]] = weight
            end
            add_hyperedge!(h,vertices = vertices_dict)
            set_hyperedge_meta!(h,h_meta,lines)
        end
        h
end
