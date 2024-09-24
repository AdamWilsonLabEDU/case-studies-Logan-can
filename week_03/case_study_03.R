library(ggplot2)
library(gapminder)
library(dplyr)

#ggplot(data=gapminder) + geom_point(mapping=aes(x="year", y="GPD per capita", color=continent, size=pop/10000))

#scale_y_continuous(trans = "sqrt")
#facet_wrap(~year,nrow=1)

gapminder
str(gapminder)

NoK_gapminder <-gapminder %>%
  filter(country != "Kuwait")

#%>% piping gapminder specific function to execute action

GGraph1<- (ggplot(NoK_gapminder, aes(x=lifeExp, y=gdpPercap, color = continent, size=pop/100000)) + 
             geom_point() + 
             facet_wrap(~year,nrow=1) + scale_y_continuous(trans="sqrt") + theme_bw() + labs(x= "life expectancy", y= "GDP per capita", size =0.1, color = continent_colors))

#continuous function for the purpose of making 1 graph with the necessary functions to present multiple graphs for the different continents

Groupby_gapminder <-NoK_gapminder %>%
  group_by(continent, year)

Weighted_gapminder <- Groupby_gapminder %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop, summarizepop = sum(as.numeric(pop))))

#group by and weighted functions produced for finding the central value

GGgraph2 <- (ggplot()+
               geom_point(data=Groupby_gapminder, aes(x= year, y= gdpPercap, color= continent, size=pop/100000))+
               geom_line(data=Groupby_gapminder, aes(x=year, y=gdpPercap, color = continent, group = country))+ 
               geom_point(data=Weighted_gapminder, aes(x= year, y= gdpPercapweighted, color= "black"))+
               geom_line(data=Weighted_gapminder, aes (x=year, y=gdpPercapweighted, color = "black"))+
               facet_wrap(~continent,nrow=1)+
               theme_bw()+
               labs(x= "year",y= "GDP Per cap."))