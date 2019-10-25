function clothing_load_example(fname::AbstractString, T::Type{<:Real}, vertex_name::AbstractString, edge_name::AbstractString)
        h=Hypergraph{T,AbstractDict,AbstractDict}(0,0)
        weight = convert(T,1)
        vertices_ids_mapping = Dict{AbstractString,Int128}()
        hyperedge_ids_mapping = Dict{AbstractString,Int128}()
        he_to_v=Dict{Int64,Dict{Int64,Int64}}()
        new_id=1
        new_he_id=1
        lines=0
        io = open(fname,"r") #file name
        h_meta_dict=Dict{Int64,Any}()
        for line in eachline(io) #for each hyperedge of the file
            lines+=1
            vertices_dict= Dict{Int64,T}()
            actual_object=JSON.parse(line) #get the JSON object from the file
            vertex_id=actual_object[vertex_name] #get vertex
            hyperedge_id=actual_object[edge_name] #get edge
            if !haskey(vertices_ids_mapping,vertex_id) #if vertex doesn't exist
                add_vertex!(h) #create vertex
                vertices_ids_mapping[vertex_id]=new_id #add vertex to Dict
                new_id+=1
            end
            if !haskey(hyperedge_ids_mapping,hyperedge_id)
                hyperedge_ids_mapping[hyperedge_id]=new_he_id #add hyperedge to dict
                new_he_id+=1
                he_to_v[hyperedge_ids_mapping[hyperedge_id]]=Dict{Int64,Int64}()
            end
            h_meta=Dict{String,Any}()
            h_review= Dict{String,Any}()
            for key in keys(actual_object)
                if (key != edge_name && key != vertex_name)
                    h_review[key]=actual_object[key]
                end
            end
            h_meta[actual_object["item_id"]]=h_review
            if haskey(h_meta_dict,hyperedge_ids_mapping[hyperedge_id])
                h_meta_dict[hyperedge_ids_mapping[hyperedge_id]]=merge(h_meta_dict[hyperedge_ids_mapping[hyperedge_id]],h_meta)
            else
                h_meta_dict[hyperedge_ids_mapping[hyperedge_id]]=h_meta
            end
            he_to_v[hyperedge_ids_mapping[hyperedge_id]][vertices_ids_mapping[vertex_id]]=weight
        end
        for key in sort(collect(keys(he_to_v)))
            add_hyperedge!(h,vertices=he_to_v[key])
            set_hyperedge_meta!(h,h_meta_dict[key],key)
        end
        h
end
