library(tidyverse)
library(ggplot2)


bevs <- read.csv('bevs.csv')
# this is a figure that should be saved and loaded into the report
g <- ggplot(bevs) +
  geom_line(aes(x = hours, y = temp)) +
  geom_point(
    data = dplyr::filter(bevs, activ == 1),
    aes(x = hours, y = temp),
    color = "red"
  ) +
  geom_hline(yintercept = 37.5, color = "grey") +
  facet_grid(~bev_num) +
  ggtitle("Beaver Body Temperatures") +
  theme_minimal()

g

ggsave("analysis/output/graph.png", g)
