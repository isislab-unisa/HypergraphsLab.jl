using HypergraphsRepository
using SimpleHypergraphs
using Pkg
#TODO
#recur in each dir and get all hgf files
toload = ["hgdata/fb/0.circles.hgf"]

cd("../HypergraphsRepository.jl")
Pkg.activate(".")
cd("src")

h = hg_load("hgdata/Amazon/com-amazon.all.dedup.cmty.hgf", Int)
post = buildpost(h,"Amazon/2019-11-03-amazon-communities.md","2019-11-03-amazon-communities.md")

h = hg_load("hgdata/Bitcoin/alpha/soc-sign-bitcoinalpha.csv.hgf", Int)
post = buildpost(h,"Bitcoin/2019-11-03-bitcoin-alpha.md","2019-11-03-bitcoin-alpha.md")

h = hg_load("hgdata/Bitcoin/otc/soc-sign-bitcoinotc.csv.hgf", Int)
post = buildpost(h,"Bitcoin/2019-11-03-bitcoin-otc.md","2019-11-03-bitcoin-otc.md")

h = hg_load("hgdata/EUInstitute/email-Eu-core-department-labels.hgf", Int)
post = buildpost(h,"EUInstitute/2019-11-03-eu-core.md","2019-11-03-eu-core.md")

h = hg_load("hgdata/fb/0.circles.hgf", Int)
post = buildpost(h,"fb/2019-11-03-facebook-circles.md","2019-11-03-facebook-circles.md")

h = hg_load("hgdata/gplus/100129275726588145876.circles.hgf", Int)
post = buildpost(h,"gplus/2019-11-03-gplus-circles.md","2019-11-03-gplus-circles.md")

h = hg_load("hgdata/twitter/356963.circles.hgf", Int)
post = buildpost(h,"twitter/2019-11-03-twitter-circles.md","2019-11-03-twitter-circles.md")

h = hg_load("hgdata/ClothingFit/renttherunway_final_data.hgf", Int)
post = buildpost(h,"ClothingFit/2019-11-03-clothingfit.md","2019-11-03-clothingfit.md")

h = hg_load("hgdata/DBLP/com-dblp.all.cmty.hgf", Int)
post = buildpost(h,"DBLP/2019-11-03-dblp-communities.md","2019-11-03-dblp-communities.md")

h = hg_load("hgdata/Deezer/HR_genres.hgf", Int)
post = buildpost(h,"Deezer/2019-11-03-deezer.md","2019-11-03-deezer.md")
"""
h = hg_load("hgdata/Friendster/com-friendster.all.cmty.hgf", Int)
post = buildpost(h,"Friendster/2019-11-03-friendster-communities.md","2019-11-03-friendster-communities.md")
"""

h_ytex=loadyoutube("graphdata/Youtube/com-youtube.top4-8.cmty.txt",Int,'\t',1)

h = hg_load("hgdata/Friendster/com-friendster.top5000.cmty.hgf", Int)
post = buildpost(h,"Friendster/2019-11-03-friendster-communities.md","2019-11-03-friendster-top5000communities.md")

h = hg_load("hgdata/IMDB/data.hgf", Int)
post = buildpost(h,"IMDB/2019-11-03-imdb-films.md","2019-11-03-imdb-films.md")

h = hg_load("hgdata/LiveJournal/com-lj.top5000.cmty.hgf", Int)
post = buildpost(h,"LiveJournal/2019-11-03-livejournal-communities.md","2019-11-03-livejournal-communities.md")

h = hg_load("hgdata/Orkut/com-orkut.top5000.cmty.hgf", Int)
post = buildpost(h,"Orkut/2019-11-03-orkut-communities.md","2019-11-03-orkut-communities.md")

h = hg_load("hgdata/Wiki-Topcat/wiki-topcats-categories.hgf", Int)
post = buildpost(h,"Wiki-Topcat/2019-11-03-wiki-top-categories.md","2019-11-03-wiki-top-categories.md")

h = hg_load("hgdata/Youtube/com-youtube.top5000.cmty.hgf", Int)
post = buildpost(h,"Youtube/2019-11-03-youtube-communities.md","2019-11-03-youtube-communities.md")
