function buildpost(h::Hypergraph,metafname::AbstractString,fname::AbstractString,)
    data = evaluatehgproperties(h)
    two_data =evaluatetwosecproperties(h)
    data=merge(data,two_data)
    io=open("posts/"*fname*".md","w") # output file
    iometa=open("graphdata/"*metafname,"r") # metadata input file
    for line in eachline(iometa)
        write(io,line) #copying the metadata in the output file
        write(io,"\n")
    end
    for key in keys(data) #writing the analysis in the output file
        write(io,key)
        write(io,": ")
        if (!(typeof(data[key])<:Dict))  #if it's a simple metric
            write(io,string(data[key]))
        else                            # if it's a distributions or a collection of metrics
            start=1
            for dis in keys(data[key]) #formatting text for distributions
                if (start!=1)
                    write(io,",")
                else
                    start=0
                end
                write(io,string(dis))
                write(io,":")
                write(io,string(data[key][dis]))
            end
        end
        write(io,"\n")
    end
    close(io)
    data
end

function getmetadata(metafname::AbstractString)
    io=open("graphdata/"*"/"*metafname,"r")
    meta=Dict{AbstractString,AbstractString}()
    for line in eachline(io)
        line=split(line,": ")
        meta[line[1]]=line[2]
    end
    meta
end
