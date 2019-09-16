using HypergraphsRepository
using SimpleHypergraphs

h = loadcircles("graphdata/fb/0.circles", Int, '\t')
hg_save("hgdata/fb/0.circles.hgf", h)
export_json("hgdata/fb/0.circles.json", h)
