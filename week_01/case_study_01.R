data(iris)
iris$Sepal.Length
iris$Sepal.Width
iris$Petal.Length
iris$Petal.Width
iris$Species

#iris$ for all of the following functions was added in for the purpose of looking at the specific values of the iris parts. 
# The assurance of all data maintained by running these functions, and also used as a means for referencing future script lines

?mean
?`$` #ran ? functions to get a general understanding of what lines of script i needed to run
?hist

mean(iris$Petal.Length)
petal_lenght_mean <- mean(iris$Petal.Length) 

#value of 3.758
#Cannot run "<-" function without having the mean be defined first

hist(iris$Petal.Length)   
abline(v =mean(iris$Petal.Length))
hist(iris$Petal.Length, probability = TRUE, xlab = 'petal length', main = 'Histogram of Iris Petal Length')
abline(v= mean(iris$Petal.Length), col='red')
lines(density(iris$Petal.Length), col='green')

# Histogram with ablines used to find the overall concentration of the petal length values -
# - along with the frequency density of the values presented (not abline function), given different colour values to distinguish them apart

ggplot(iris, aes(x = Petal.Length)) + geom_histogram()

# extra time to work on the histogram.Must check the ggplot2 packages every time before running script -
# - distribution of both histograms is relatively the same, more detailed values shown in geom-histogram from unaltered histogram division

