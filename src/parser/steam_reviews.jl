function load_steam_reviews(fname::AbstractString, T::Type{<:Real}, vertex_name::AbstractString, vertex_set_name::AbstractString, edge_name::AbstractString)
        h=Hypergraph{T}(0,0)
        weight = convert(T,1)
        vertices_ids_mapping = Dict{AbstractString,Int}()
        new_id=1
        lines=0
        nodes=0
        meta_edge_fetch=false
        meta_vertex_fetch=false
        io = open(fname,"r") #file name
        for line in eachline(io) #for each hyperedge of the file
            lines+=1
            vertices_dict= Dict{Int64,T}()
            actual_object=JSON.parse(line)
            actual_object[edge_name]

            if (!meta_edge_fetch) #fetching metadata for hyperedge
                i=1
                for key in keys(actual)
                    set_hyperedge_meta!(h,key,i)
                    i+=1
                end
                meta_edge_fetch=true
            end

            vertices_ids=actual_object[vertex_set_name]
            for v_id in vertices_ids #for each vertex of the file
                old_id = v_id[vertex_name]

                if (!meta_vertex_fetch) #fetching metadata for vertices
                    i=1
                    for key in keys(v_id)

                        set_vertex_meta!(h,key,i)
                        i+=1
                    end
                    meta_vertex_fetch=true
                end

                if !haskey(vertices_ids_mapping,old_id)
                    add_vertex!(h)
                    vertices_ids_mapping[old_id] = new_id
                    new_id+=1
                end
                vertices_dict[vertices_ids_mapping[old_id]] = weight
            end
            add_hyperedge!(h,vertices = vertices_dict)
        end
        h
end
