using HypergraphsRepository
using SimpleHypergraphs
using JSON

h_fb = loadcircles("graphdata/fb/107.circles", Int, '\t')
hg_save("hgdata/fb/0.circles.hgf", h_fb)
export_json("hgdata/fb/0.circles.json", h_fb)

h_twitter = load_twittercircles("graphdata/twitter/356963.circles", Int, '\t')
hg_save("hgdata/twitter/356963.circles.hgf", h_twitter)
export_json("hgdata/twitter/356963.circles.json", h_twitter)

h_steam = load_steam_reviews("graphdata/steam/steam.json",Int,"item_id", "reviews" ,"user_id")
hg_save("hgdata/steam/steam.hgf", h_steam)
export_json("hgdata/fb/steam.json", h_steam)

h_youtube = loadyoutube("graphdata/youtube/com-youtube.top5000.cmty.txt",Int,'\t')
hg_save("hgdata/Youtube/com-youtube.top5000.cmty.hgf", h_youtube)
export_json("hgdata/Youtube/com-youtube.top5000.cmty.json", h_youtube)

h_friendster = loadfriendster("graphdata/Friendster/com-friendster.all.cmty.txt" ,Int, '\t',1)
hg_save("hgdata/Friendster/com-friendster.all.cmty.hgf", h_friendster)
export_json("hgdata/Friendster/com-friendster.all.cmty.json", h_friendster)

h_lj = loadlivejournal("graphdata/LiveJournal/com-lj.top5000.cmty.txt" ,Int, '\t',1)
hg_save("hgdata/LiveJournal/com-lj.top5000.cmty.hgf", h_lj)
export_json("hgdata/LiveJournal/com-lj.top5000.cmty.json", h_lj)

h_orkut = loadorkut("graphdata/Orkut/orkut.txt" ,Int, '\t',1)
hg_save("hgdata/Orkut/orkut.hgf", h_orkut)
export_json("hgdata/Orkut/orkut.json", h_orkut)

h_amazon = loadamazon("graphdata/Amazon/com-amazon.top5000.cmty.txt",Int,'\t',1)
hg_save("hgdata/Amazon/com-amazon.top5000.cmty.hgf", h_amazon)
export_json("hgdata/Amazon/com-amazon.top5000.cmty.json", h_amazon)

h_gplus = loadgplus("graphdata/gplus/100129275726588145876.circles",Int,'\t')
hg_save("hgdata/gplus/100129275726588145876.circles.hgf", h_gplus)
export_json("hgdata/gplus/100129275726588145876.circles.json", h_gplus)

h_eu = load_european_institute("graphdata/EUInstitute/email-Eu-core-department-labels.txt",Int128,' ')
hg_save("hgdata/EUInstitute/email-Eu-core-department-labels.hgf", h_eu)
export_json("hgdata/EUInstitute/email-Eu-core-department-labels.json", h_eu)

h_wikicat = loadwikicat("graphdata/Wiki-Topcat/wiki-topcats-categories_try.txt",Int ,' ',2)
hg_save("hgdata/Wiki-Topcat/wiki-topcats-categories_try.hgf", h_wikicat)
export_json("hgdata/Wiki-Topcat/wiki-topcats-categories_try.json", h_wikicat)

h_dblp = loaddblp("graphdata/DBLP/com-dblp.top4.cmty.txt",Int128, '\t')
hg_save("hgdata/DBLP/com-dblp.top4.cmty.hgf", h_dblp)
export_json("hgdata/DBLP/com-dblp.top4.cmty.json", h_dblp)

h_clothing_fit = load_clothing("graphdata/clothingFit/renttherunway_final_data.json",Int,"item_id","user_id")
hg_save("hgdata/clothingFit/renttherunway_final_data.hgf", h_clothing_fit)
export_json("hgdata/clothingFit/renttherunway_final_data.json", h_clothing_fit)

h_bitcoin_otc = load_bitcoin_otc("graphdata/Bitcoin/soc-sign-bitcoinotc.csv",Int,',')
hg_save("hgdata/Bitcoin/soc-sign-bitcoinotc.csv.hgf", h_bitcoin_otc)
export_json("hgdata/clothingFit/soc-sign-bitcoinotc.csv.json", h_bitcoin_otc)

h_bitcoin_alpha = load_bitcoin_alpha("graphdata/Bitcoin/soc-sign-bitcoinalpha.csv",Int,',')
hg_save("hgdata/Bitcoin/soc-sign-bitcoinalpha.csv.hgf", h_bitcoin_alpha)
export_json("hgdata/Bitcoin/soc-sign-bitcoinalpha.csv.json", h_bitcoin_alpha)

h_deezer=load_deezer("graphdata/Deezer/HR_genres.json",Int)
hg_save("hgdata/Deezer/HR_genres.hgf", h_deezer)
export_json("hgdata/Deezer/HR_genres.json", h_deezer)
