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

end
