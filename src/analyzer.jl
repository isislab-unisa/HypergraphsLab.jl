using LightGraphs

function evaluatehgproperties(h::Hypergraph; excludemodularity::Bool=false)
    data = Dict{Symbol, Any}()
    hedistribution = Dict{Int, Int}()
    vdistribution = Dict{Int, Int}()
    push!(data, :v=>nhv(h))
    push!(data, :he=>nhe(h))
    push!(data, :maxhesize=>maximum(length.(getvertices.(Ref(h), 1:data[:he]))))
    push!(data, :maxdegree=>maximum(length.(gethyperedges.(Ref(h), 1:data[:v]))))
    for he in 1:nhe(h)
        push!(
            hedistribution,
            length(getvertices(h, he)) => get(hedistribution, length(getvertices(h, he)), 0) + 1
            )
    end
    for v in 1:nhv(h)
        push!(
            vdistribution,
            length(gethyperedges(h, v)) => get(vdistribution, length(gethyperedges(h, v)), 0) + 1
            )
    end
    push!(data, :edgesdistribution=>hedistribution)
    push!(data, :degreedistribution=>vdistribution)

    # if !excludemodularity
    #     modularity()
    # end

    data
end

function evaluatetwosecproperties(h::Hypergraph)
    t = TwoSectionView(h)
    data= Dict{Symbol,Any}()
    g=SimpleGraph(t)
    push!(data, :two_e => ne(g))
    graph_degrees=degree(g)
    lcc=largest_cc(g)
    subgraph_lcc=induced_subgraph(g,lcc)[1]
    #push!(data, :connected_components =>connected_components(g))
    push!(data, :two_size_lcc => length(lcc))
    push!(data, :two_clustering_coefficient =>global_clustering_coefficient(g))
    push!(data, :two_triangles_count =>triangles_count(g))
    push!(data, :two_density_lcc => density(g))
    push!(data, :two_diameter_lcc =>diameter(subgraph_lcc))
    push!(data, :two_max_degree =>maximum(graph_degrees))
    push!(data, :two_min_degree =>minimum(graph_degrees))
    push!(data, :two_average_degree =>avg_degree(g))
    #two power law exponent
    #modularity
    push!(data, :two_degree_distribution =>degreedistribution(g))
    data
end

function export_properties(h::Hypergraph,fname::AbstractString,dname::AbstractString)
    datahg=evaluatehgproperties(h)
    datatwosec=evaluatetwosecproperties(h)
    data=merge(datahg,datatwosec)
    jsondata=JSON.json(data)
    io=open("hgdata/"*dname*"/"*fname*"properties.json","w")
    write(io,jsondata)
    close(io)
end

function degreedistribution(g::SimpleGraph)
    degrees=Dict{Int,Int128}()
    for deg in degree(g)
        if (haskey(degrees,deg))
            degrees[deg]+=1
        else
            degrees[deg]=1
        end
    end
    degrees
end

function triangles_count(g) #must sum all triangle count for each vertex and then the result is divided by 3
    a=triangles(g)
    sum=0
    for i in a
        sum+=i
    end
    sum/3
end

function avg_degree(g::SimpleGraph)
    avg = (2*ne(g))/nv(g)  #2*|E|/|V|
    avg
end

function largest_cc(g::SimpleGraph)
    components = connected_components(g)
    lcc_vlist=Array{Int64,1}()
    for component in components
        l_comp=length(component)
        if (max(length(lcc_vlist),l_comp)==l_comp)
            lcc_vlist=component
        end
    end
    lcc_vlist
end
