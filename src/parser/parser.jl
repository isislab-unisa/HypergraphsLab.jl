using HypergraphsRepository
using SimpleHypergraphs

h_fb = loadcircles("graphdata/fb/0.circles", Int, '\t')
hg_save("hgdata/fb/0.circles.hgf", h_fb)
export_json("hgdata/fb/0.circles.json", h_fb)

h_steam = load_steam_reviews("graphdata/steam/steam.json",Int,"item_id", "reviews" ,"user_id")

hg_save("hgdata/steam/steam.hgf", h_steam)
export_json("hgdata/fb/steam.json", h_steam)
get_vertex_meta(h_steam,1)
h_youtube = loadyoutube("graphdata/youtube/com-youtube.top5000.cmty.txt",Int,'\t')
hg_save("hgdata/steam/steam.hgf", h_steam)
export_json("hgdata/fb/steam.json", h_steam)



h_gplus=loadgplus("graphdata/gplus/100129275726588145876.circles",Int,'\t')
hg_save("hgdata/gplus/100129275726588145876.circles.hgf", h_gplus)
export_json("hgdata/fb/100129275726588145876.circles.json", h_gplus)
