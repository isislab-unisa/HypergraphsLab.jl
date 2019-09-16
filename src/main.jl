using HypergraphsRepository
using SimpleHypergraphs

#TODO
#recur in each dir and get all hgf files
toload = ["hgdata/fb/0.circles.hgf"]

h = hg_load("hgdata/fb/0.circles.hgf", Int)
post = buildpost(h)
