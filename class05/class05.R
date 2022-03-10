# Installed ggplot
library(ggplot2)
ggplot(cars)
ggplot(cars) + aes(x = speed, y = dist) + geom_point()

# Genes data
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
nrow(genes)
ncol(genes)
colnames(genes)
table(genes$State)

# Genes plots
 ggplot(genes) + aes(x = Condition1, y = Condition2) + geom_point()
ggplot(genes) + aes(x = Condition1, y = Condition2, col = State) + geom_point()
p <- ggplot(genes) + aes(x = Condition1, y = Condition2, col = State) + geom_point()
p + scale_colour_manual(values = c("blue", "gray", "red"))
p + scale_colour_manual(values = c("blue", "gray", "red")) + labs(title = "Gene Expression Changes Upon Drug Treatment", x = "Control (no drug)", y = "Drug Treatment")

# Installed gapminder, dplyr
library(gapminder)
library(dplyr)

# Gapminder 2007
gapminder_2007 <- gapminder %>% filter(year==2007)
ggplot(gapminder_2007) + aes(x = gdpPercap, y = lifeExp) + geom_point()
ggplot(gapminder_2007) + aes(x = gdpPercap, y = lifeExp) + geom_point(alpha = 0.5)
ggplot(gapminder_2007) + aes(x = gdpPercap, y = lifeExp, color = continent, size = pop) + geom_point(alpha = 0.5)
ggplot(gapminder_2007) + aes(x = gdpPercap, y = lifeExp, color = pop) + geom_point(alpha = 0.8)
ggplot(gapminder_2007) + aes(x = gdpPercap, y = lifeExp, size = pop) + geom_point(alpha = 0.5)
ggplot(gapminder_2007) + aes(x = gdpPercap, y = lifeExp, size = pop) + geom_point(alpha = 0.5) + scale_size_area(max_size = 10)

# Gapminder 1957
gapminder_1957 <- gapminder %>% filter(year == 1957)
gm1957 <- ggplot(gapminder_1957) + aes(x = gdpPercap, y = lifeExp) + geom_point()
gm1957 + aes(color = continent, size = pop) + scale_size_area(max_size = 15) + geom_point(alpha = 0.7)
gapminder_1957 <- gapminder %>% filter(year == 1957 | year == 2007)
ggplot(gapminder_1957) + geom_point(aes(x = gdpPercap, y = lifeExp, color = continent, size = pop), alpha = 0.7) + scale_size_area(max_size = 10) + facet_wrap(~year)

# Bar charts
gapminder_top5 <- gapminder %>% filter(year == 2007) %>% arrange(desc(pop)) %>% top_n(5, pop)
gapminder_top5
ggplot(gapminder_top5) + geom_col(aes(x = country, y = pop))
ggplot(gapminder_top5) + geom_col(aes(x = country, y = pop, fill = continent))
ggplot(gapminder_top5) + geom_col(aes(x = country, y = pop, fill = lifeExp))
ggplot(gapminder_top5) + aes(x = reorder(country, -pop), y = pop, fill = country) + geom_col(col = "gray30") + guides(scale = "none")

# Flipping bar charts
head(USArrests)
USArrests$State <- rownames(USArrests)
ggplot(USArrests) + aes(x = reorder(State, Murder), y = Murder) + geom_col() + coord_flip()
ggplot(USArrests) + aes(x = reorder(State, Murder), y = Murder) + geom_point() + geom_segment(aes(x = State, xend = State, y = 0, yend = Murder), color = "blue") + coord_flip()

# Animating plots
# Installed gifski, gganimate
library(gapminder)
library(gganimate)
# Plot was animated, but will not show in final report

# Combining plots
# Installed patchwork
library(patchwork)
p1 <- ggplot(mtcars) + geom_point(aes(mpg, disp))
p2 <- ggplot(mtcars) + geom_boxplot(aes(gear, disp, group = gear))
p3 <- ggplot(mtcars) + geom_smooth(aes(disp, qsec))
p4 <- ggplot(mtcars) + geom_bar(aes(carb))

(p1 | p2 | p3) / p4
