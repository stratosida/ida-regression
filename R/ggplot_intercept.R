library(ggplot2)
p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()

# Fixed values
p + geom_vline(xintercept = 5)
p + geom_vline(xintercept = round(fivenum(mtcars$wt),1))


```{r}
x<-rnorm(300)
y<-rt(300,df=10)
xy<-data.frame(x,y)

require(ggplot2); require(grid)
# make the basic plot object
ggplot(xy, aes(x, y)) +        
  # set the locations of the x-axis labels as Tukey's five numbers   
  scale_x_continuous(limit=c(min(x), max(x)), 
                     breaks=round(fivenum(x),1)) +     
  # ditto for y-axis labels 
  scale_y_continuous(limit=c(min(y), max(y)),
                     breaks=round(fivenum(y),1)) +     
  # specify points
  geom_point() +
  # specify that we want the rug plot
  geom_rug(size=0.1) +   
  # improve the data/ink ratio
  theme_set(theme_minimal(base_size = 18))

```