function load_imdb(fname::AbstractString, T::Type{<:Real},sep::AbstractChar, v_column::Real, h_column::Real)
    h=Hypergraph{T,Dict{Any,Any},AbstractString}(0,0)
    weight = convert(T,1)
    hyperedges_ids_mapping = Dict{AbstractString,Int}()
    h_new_id=1
    v_new_id=1
    io=open(fname,"r")
    line=readline(io)
    metadata=split(line,'\t')
    for line in eachline(io)
        data=split(line,'\t')
        v_id=data[v_column]
        h_ids=data[h_column]
        h_oldids=split(h_ids,',')
        h_for_v=Dict{Int64,Int64}()
        for h_oldid in h_oldids
            if (!haskey(hyperedges_ids_mapping,h_oldid))
                hyperedges_ids_mapping[h_oldid]=h_new_id
                add_hyperedge!(h)
                set_hyperedge_meta!(h,h_oldid,h_new_id)
                h_new_id+=1
            end
            h_for_v[hyperedges_ids_mapping[h_oldid]]=weight
        end
        add_vertex!(h,hyperedges=h_for_v)
        metavertex=Dict{Any,Any}()
        i=1
        for meta in metadata

            metavertex[meta]=data[i]
            i+=1
        end
        set_vertex_meta!(h,metavertex,v_new_id)
        v_new_id+=1
    end

    h
end
