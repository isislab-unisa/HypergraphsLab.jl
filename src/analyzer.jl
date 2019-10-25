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
    push!(data, :e => ne(g))
    #push!(data, :connected_components =>connected_components(g))
    push!(data, :size_lcc => size_lcc(g))
    push!(data, :clustering_coefficient =>global_clustering_coefficient(g))
    push!(data, :triangles_count =>triangles(g))
    push!(data, :density => density(g))
    push!(data, :max_degree =>maximum(degree(g)))
    push!(data, :min_degree =>minimum(degree(g)))
    push!(data, :average_degree =>avg_degree(g))
    #two power law exponent
    #modularity
    #degreedistribution
    data
end


function avg_degree(g::SimpleGraph)
    avg = (2*ne(g))/nv(g)
    avg
end

function size_lcc(g::SimpleGraph)
    components = connected_components(g)
    maxi = 0
    for component in components
        maxi = max(maxi,length(component))
    end
    maxi
end
