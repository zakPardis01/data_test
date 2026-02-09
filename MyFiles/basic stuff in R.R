
x <-3
y <-5



# to remove the x variable
rm(x)
remove(x)

# to remove all variables
remove(list = ls())

# to get help/ or see the complete information or document about a command, function or module just type ? in front of it
?rm()


# to see all the packages available with R
browseURL("https://cran.r-project.org/web/views/")

# to install packages
install.packages("LiblinearR")

# to list all the install packages
library()

# to list currently loaded packages
search()

# to load packages
library(dbplyr)




# Aggregation
student <- read.csv("~/Software Development/Data Analysis/Level 4 - Apprentinceship/DA - 7 = Modelling with R/MyFiles/student.csv", header = TRUE)
View(student)

# Remove Rows Where gender is NA or an Empty String ("")
student <- student[!(is.na(student$gender) | student$gender == ""), ]



#Using na.omit() (Only Removes NA, Not Empty Strings)
student <- na.omit(student)


# to find out number of male and female students
gender <-table(student$gender)
gender
View(gender)

# to generate bar plot from it
barplot(gender)


# to sort/ order the plot based on the descending order
barplot(gender[order(-gender)])


# change the layout to horizental and sort it by ascending order, and change the color to red
barplot(gender[order(gender)], horiz = TRUE, col='red')

# to have different colour for each of them and remove the border as well, main  will give title to chart, xlab add x lable
barplot(gender[order(gender)], horiz = TRUE, col=c("red", "green"), border = NA, main = "Frequency of Gender", xlab = "Number of students")

colors() # run this function to see all different colour so you can choose which one to use




# histogram
hist(student$mark)

# to specify number of cell or bars to 5
hist(student$mark, breaks = 5)

# if we want to specify our desired breakpoints between histogram cells
hist(student$mark, breaks = c(0, 40, 60, 100))
?hist()

# as above will add density instead of frequency, if we want to display frequency, we add freq=TRUE
hist(student$mark, breaks = c(0, 40, 60, 100), freq = TRUE, col = 'blue', main='Histograme of Marks')




