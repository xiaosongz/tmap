# example to show the misplotted legend frame when using expression in the legend title.
library(tmap)

current.mode <- tmap_mode("plot")

data(NLD_muni, NLD_prov)

tm_shape(NLD_muni) +
    tm_fill(col="population", convert2density=TRUE, 
        style="kmeans", title = expression("Population (per " * km^{2} * ")")) +
    tm_borders("grey25", alpha=.5) + 
    tm_shape(NLD_prov) +
    tm_borders("grey40", lwd=2) +
tm_format("NLD", bg.color="white", frame = TRUE) +
tm_credits("(c) Statistics Netherlands (CBS) and\nKadaster Nederland", position=c("left", "bottom"))+
    tm_layout(legend.frame = T) # turn on legend.frame to show the actual impact of the miscalculated legend title width.

# restore current mode
tmap_mode(current.mode)
