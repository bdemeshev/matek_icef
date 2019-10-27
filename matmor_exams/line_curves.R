library(tikzDevice)
library(azbuka) # devtoools::install_github("bdemeshev/azbuka")
library(tidyverse)
library(gridExtra) # grid.Arrange

a <- tikzsetup()

# source("tikz_setup.R")


# line curves ------------------------------------------------------------

my_f = function(x, y) (x - 1)^2 + y

x = seq(-3, 3, length.out = 100)
y = seq(-3, 3, length.out = 100)
h = data.frame(x = rep(x, times = 100), y = rep(y, each = 100))

h$z = my_f(h$x, h$y)

p = ggplot(h, aes(x = x, y = y, z = z)) + stat_contour() + theme_bw() +
  scale_y_continuous(name = "") + scale_x_continuous(name = "")
p

file_name <- "figure/line_curves"
tikz_full <- paste0(file_name, ".tex")
png_full <- paste0(file_name, ".png")

ggsave(filename = png_full, device = "png", dpi = 200)

tikz(standAlone = FALSE, file = tikz_full, bareBones = TRUE)
print(p)
dev.off()



