library(chapman)
library(tidyverse)


plotpng <- function(x, filename, height=1600, ...) {
  output_dir = "~/.ms/pics/"
  x = x %>% 
    set_graphics_parameters(
                            vertex.label.cex = 5,
                            edge.arrow.size = 2,
                            margin=c(0,0,0,0),
                            edge.width = 5)
  
  png(filename = paste0(output_dir, filename),
      bg = "transparent",
      width = 2400,
      height = height,
      )
  plot(x, ...)
  dev.off()
}

# # Random Walk
# m = random_walk(T=3,with_dots=TRUE, p=0.4)
# plotpng(m,"random_walk_chain.png", height = 400, xlim = c(-2.3,2))
# 
# # Gambler's ruin
# m = gamblers_ruin()
# plotpng(m,"gamblers_ruin_chain.png", height = 400, xlim = c(-2,2))
# 
# # Regime switching
# m = regime_switching()
# plotpng(m,"regime_switching_chain.png", height = 400, xlim = c(-2,2))
# 
# # Deterministically monotone
# m = deterministically_monotone()
# plotpng(m,"deterministically_monotone_chain.png", height=400)
# 
# # Tennis
# m = tennis()
# plotpng(m, "tennis_chain.png", vertex.size = 45, veretx.label.cex=3.5)
# 
# # Manual-multi-step
# from = c(1,1,2,3,4,5)
# to =   c(1,2,3,4,5,1)
# prob = c(1/2, 1/2, 1,1,1,1)
# 
# m =
#   markov_chain(data.frame(to, from, prob)) %>%
#   set_auto_edge_colors %>%
#   set_auto_layout
# plotpng(m,"manual-multi-step_chain.png")
# 
# # Deck-2-2
# m = deck22()
# plotpng(m,"deck-2-2_chain.png")
# 
# 
# # Basil
# m = tribble(
#   ~from, ~to, ~prob,
#   "1", "2", 1/2,
#   "1", "3", 1/2,
#   "2", "1", 1/3,
#   "2", "4", 1/3,
#   "2", "F", 1/3,
#   "3", "1", 1/3,
#   "3", "4", 1/3,
#   "3", "S", 1/3,
#   "4", "2", 1/3,
#   "4", "3", 1/3,
#   "4", "5", 1/3,
#   "5", "4", 1/2,
#   "5", "F", 1/2,
#   "F", "F", 1,
#   "S", "S", 1
# ) %>%
#   markov_chain %>%
#   # set_state("1", x=0, y=2) %>%
#   # set_state("2", x=1, y=2) %>%
#   # set_state("F", x=2, y=2) %>%
#   # set_state("3", x=0, y=1) %>%
#   # set_state("4", x=1, y=1) %>%
#   # set_state("5", x=2, y=1) %>%
#   # set_state("S", x=0, y=0) %>%
#   set_auto_layout %>%
#   set_auto_edge_colors %>%
#   curve_overlapping_edges(curve = 0.3) %>%
#   set_edge("S","S", loop_angle = -pi/2) %>%
#   stretch(2) %>%
#   rotate(pca = T) %>%
#   rotate( pi )
# 
# plotpng(m, "basil_chain.png")
# 
# 
# 
# Professor chain
m = professor()
plotpng(m,"professor_chain.png")



# # Chap 6. Period example 1
# m = markov_chain(3) %>%
#   add_edge(1,2) %>%
#   add_edge(2,3) %>%
#   add_edge(3,1) %>%
#   set_auto_layout %>%
#   stretch(0.5)
# plotpng(m,"period-example-1_chain.png", height = 1000)
# 
# # Chap 6. Period example 2
# m = markov_chain(3) %>%
#   add_edge(1,2) %>%
#   add_edge(2,3) %>%
#   add_edge(3,1, prob=1/2) %>%
#   add_edge(3,3, prob=1/2) %>%
#   set_auto_layout %>%
#   set_auto_edge_colors %>%
#   stretch(0.5)
# plotpng(m, "period-example-2_chain.png", height=1000)
# 
# # cl-stat-02
# m = tribble(
#   ~from, ~to, ~prob,
#   1, 1, 1/2,
#   1, 2, 1/2,
#   2, 3, 1/2,
#   2, 7, 1/2,
#   3, 4, 1,
#   4, 3, 1/2,
#   4, 5, 1/2,
#   5, 6, 1,
#   6, 6, 1/2,
#   6, 3, 1/2,
#   7, 8, 1,
#   8, 7, 3/4,
#   8, 8, 1/4
# ) %>%
#   markov_chain %>%
#   set_auto_layout %>%
#   set_auto_edge_colors %>%
#   curve_overlapping_edges %>%
#   rotate(pca=T) %>%
#   stretch(1.6) %>%
#   set_edge(8,8,loop_angle=pi/2)
# m$layout[1,]=c(-0.5,0.5)
# plotpng(m, "cl-stat-02_chain.png", height = 1000)
# 
# # cl-stat-10
# m = tribble(
#   ~from, ~to, ~prob,
#   0, 1, 1/2,
#   0, 6, 1/2,
#   1, 2, 1,
#   2, 3, 1,
#   3, 4, 1,
#   4, 5, 1,
#   5, 1, 1,
#   6, 6, 1
# ) %>%
#   markov_chain %>%
#   set_auto_layout %>%
#   set_auto_edge_colors %>%
#   curve_overlapping_edges %>%
#   set_edge("6","6",loop_angle=-pi/2) %>%
#   stretch(ax = 2, ay =1) %>%
#   stretch(0.5)
# 
# plotpng(m, "cl-stat-10_chain.png")
# 
# # cl-stat-11
# m = markov_chain(3) %>% 
#   add_edge(1,2) %>% 
#   add_edge(2,1, prob = 1/4) %>% 
#   add_edge(2,2, prob = 1/2) %>% 
#   add_edge(2,3, prob = 1/4) %>% 
#   add_edge(3,3) %>% 
#   set_auto_layout %>% 
#   set_auto_edge_colors %>% 
#   set_edge(2,2, loop_angle = pi/2) %>% 
#   set_edge(3,3, loop_angle = pi/2) %>% 
#   curve_overlapping_edges %>% 
#   rotate(pca=T) %>% 
#   stretch(2)
# 
# plotpng(m, height = 800, "cl-stat-11_chain.png")
# 
#   
#
# Professor
# m = professor() %>% set_absorbing_state_color
# plotpng(m,"professor_chain.png", vertex.label.cex = 3)

# Wonder Woman
# m = markov_chain(c("000","001","010","100","011", "101", "110", "111")) %>% 
#   add_edge("000","001", prob=1/3) %>% 
#   add_edge("000","010", prob=1/3) %>% 
#   add_edge("000","100", prob=1/3) %>% 
#   add_edge("001","000", prob=1/3) %>% 
#   add_edge("001","011", prob=1/3) %>% 
#   add_edge("001","101", prob=1/3) %>% 
#   add_edge("010","011", prob=1/3) %>% 
#   add_edge("010","000", prob=1/3) %>% 
#   add_edge("010","110", prob=1/3) %>% 
#   add_edge("100","101", prob=1/3) %>% 
#   add_edge("100","110", prob=1/3) %>% 
#   add_edge("100","000", prob=1/3) %>% 
#   add_edge("011","010", prob=1/3) %>% 
#   add_edge("011","001", prob=1/3) %>% 
#   add_edge("011","111", prob=1/3) %>% 
#   add_edge("101","100", prob=1/3) %>% 
#   add_edge("101","111", prob=1/3) %>% 
#   add_edge("101","001", prob=1/3) %>% 
#   add_edge("110","111", prob=1/3) %>% 
#   add_edge("110","100", prob=1/3) %>% 
#   add_edge("110","010", prob=1/3) %>% 
#   add_edge("111","111", prob=1) %>% 
#   set_auto_layout %>% 
#   set_auto_edge_colors %>% 
#   curve_overlapping_edges(0.3)
# s = P_dput(m)
# plotpng(m,"wonder_woman_chain.png")

# # Pattern HTH
# m = pattern_HTH()
# plotpng(m,"pattern_HTH_chain.png", height = 1000)
# 
# # Pattern HTH
# m = pattern_HHH()
# plotpng(m,"pattern_HHH_chain.png", height = 1000)

# mc_prob1_prb

# m = markov_chain(7) %>% 
#   add_edge(1, 1, prob = 1/2, loop_angle = -pi) %>% 
#   add_edge(1, 3, prob = 1/2) %>% 
#   add_edge(2, 1, prob = 1/4) %>% 
#   add_edge(2, 2, prob = 1/2) %>% 
#   add_edge(2, 3, prob = 1/4) %>% 
#   add_edge(3, 2, prob = 1/2 ) %>% 
#   add_edge(3, 3, prob = 1/2, loop_angle = -pi/2) %>% 
#   add_edge(4, 3, prob = 1) %>% 
#   add_edge(5, 4, prob = 1/2) %>% 
#   add_edge(5, 6, prob = 1/2) %>% 
#   add_edge(6, 7, prob = 1) %>% 
#   add_edge(7, 6, prob = 1/2) %>% 
#   add_edge(7, 7, prob = 1/2, loop_angle = pi/2) %>% 
#   set_auto_layout() %>% 
#   set_auto_edge_colors() %>% 
#   stretch(2) %>% 
#   rotate(pca=T) %>% 
#   curve_overlapping_edges()
# plotpng(m,"mc_prob1_chain.png", height=1000)

# # facility_prb (airline computers breaking down)
# p=0.3
# m = tribble(
#     ~from, ~to, ~label, ~prob,
#     "1-1-0-0", "1-0-1-0", "p", p,
#     "1-1-0-0", "2-0-0-0", "1-p", 1-p,
#     "1-0-1-0", "1-1-0-0", "1-p", 1-p,
#     "1-0-1-0", "0-1-0-1", "p", p,
#     "0-1-0-1", "1-0-1-0", "1", 1,
#     "0-0-1-1", "0-1-0-1", "1", 1,
#     "2-0-0-0", "0-0-1-1", "p^2", p^2,
#     "2-0-0-0", "1-0-1-0", "2 p (1-p)", 2* p * (1-p),
#     "2-0-0-0", "2-0-0-0", "(1-p)^2", (1-p)^2
#     ) %>%
#     markov_chain %>%
#     set_edge("2-0-0-0","2-0-0-0",loop_angle = -pi/5) %>%
#     set_auto_layout %>%
#     rotate(pca=T) %>%
#     stretch(2) %>%
#     curve_overlapping_edges %>%
#     set_graphics_parameters(vertex.size = 35,
#                             vertex.label.cex = 3,
#                             edge.label.cex=5,
#                             edge.color="grey50")
# plotpng(m,"facility_chain.png")

# # facility_prb simplified (airline computers breaking down)
# p=0.3
# m = tribble(
#   ~from, ~to, ~label, ~prob,
#   "1-1-0-0", "1-0-1-0", "p", p,
#   "1-1-0-0", "2-0-0-0", "1-p", 1-p,
#   "1-0-1-0", "1-1-0-0", "1-p", 1-p,
#   "1-0-1-0", "0-1-0-1", "p", p,
#   "0-1-0-1", "1-0-1-0", "1", 1,
#   "2-0-0-0", "2-0-0-0", "1", 1
# ) %>%
#   markov_chain %>%
#   set_edge("2-0-0-0","2-0-0-0",loop_angle = -pi/2) %>%
#   set_auto_layout %>%
#   rotate(pca=T) %>% 
#   stretch(2) %>%
#   curve_overlapping_edges %>%
#   set_graphics_parameters(vertex.size = 40,
#                           vertex.label.cex = 3,
#                           edge.label.cex=5,
#                           edge.color="grey50")
# plotpng(m,"facility_simplified_chain.png", height=700)

# facility_prb simpliest (airline computers breaking down)
# p=0.3
# m = tribble(
#   ~from, ~to, ~label, ~prob,
#   "1-1-0-0", "1-0-1-0", "p", p,
#   "1-1-0-0", "2-0-0-0", "1-p", 1-p,
#   "1-0-1-0", "1-1-0-0", "1-p", 1-p,
#   "1-0-1-0", "0-1-0-1", "p", p,
#   "0-1-0-1", "0-1-0-1", "1", 1,
#   "2-0-0-0", "2-0-0-0", "1", 1
# ) %>%
#   markov_chain %>%
#   set_edge("2-0-0-0","2-0-0-0",loop_angle = -pi/2) %>% 
#   set_edge("0-1-0-1","0-1-0-1",loop_angle = -pi/2) %>% 
#   set_auto_layout %>%
#   rotate(pca=T) %>% 
#   stretch(2) %>% 
#   curve_overlapping_edges %>%
#   set_graphics_parameters(vertex.size = 40, 
#                           vertex.label.cex = 3, 
#                           edge.label.cex=5,
#                           edge.color="grey50")
# plotpng(m,"facility_simplest_chain.png", height=700)
#     

# mc_prob18 (the bold play)
p=0.3; q=1-p
m = markov_chain() %>% 
  add_state("0", x=-2, y=0) %>% 
  add_state("1", x=-1, y=-1) %>% 
  add_state("2", x=-1, y=1) %>% 
  add_state("3", x=1, y=-1) %>% 
  add_state("4", x=1, y=1) %>% 
  add_state("5", x=2, y=0) %>% 
  add_edge("0","0", prob=1, loop_angle = pi) %>% 
  add_edge("1","0", prob=q) %>% 
  add_edge("1","2", prob=p) %>% 
  add_edge("2","0", prob=q) %>% 
  add_edge("2","4", prob=p) %>% 
  add_edge("3","1", prob=q) %>% 
  add_edge("3","5", prob=p) %>% 
  add_edge("4","3", prob=q) %>% 
  add_edge("4","5", prob=p) %>% 
  add_edge("5","5", prob=1) %>% 
  set_auto_edge_colors() %>% 
  set_absorbing_state_color()
plotpng(m,"bold_play_chain.png")