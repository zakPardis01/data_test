

df <- read.csv("~/Software Development/Data Analysis/Level 4 - Apprentinceship/DA - 7 = Modelling with R/MyFiles/Data Files/Linear Regression/House_Price.csv", header=TRUE)
View(df)

summary(df)

hist(df$crime_rate)

pairs(~price+crime_rate+n_hot_rooms+rainfall, data=df)


# create barplot

barplot(table(df$airport))
barplot(table(df$waterbody))
barplot(table(df$bus_ter))

# observation
# n_hot_rooms and rainfall has outliers
# n_hot_rooms has missing values
# bus_term is a useless variable as all has bus_term
# crime_rate has some other functional relationship with price

# Outlier
# are values that appears far away and diverges from an overall pattern in a sample


# OUTLIER Treatment
#The treatment of the outlier values/cases is called Outlier Treatment. Typically outlier treatment is done by capping/flooring.


# Capping and Flooring
    #• Impute all the values above 3* P99 and below 0.3*P1
    #• Impute with values 3* P99 and 0.3*P1
    #• You can use any multiplier instead of 3, as per your business requirement



#Capping is replacing all higher side values exceeding a certain theoretical maximum or upper control limit (UCL) by the UCL value. Statistical formula for UCL is UCL = Q3 + 1.5 * IQR
#Flooring is replacing all values falling below a certain theoretical minimum or lower control limit (UCL) by the LCL value. Statistical formula for LCL is LCL = Q1 – 1.5 * IQR

quantile(df$n_hot_rooms, 0.99)

uv = 3 * quantile(df$n_hot_rooms, 0.99)
 
df$n_hot_rooms[df$n_hot_rooms > uv] <- uv

summary(df$n_hot_rooms)

print(df$n_hot_rooms)



# treating lower quartile in rainfall variable
lv=0.3 * quantile(df$rainfall, 0.01)
df$rainfall[df$rainfall<lv] <-lv
summary(df$rainfall)





# MISSING VALUES
# different ways to treat missing values
    # replace them with zero
    # delete the data with missing value
    # replace them with mean, median, mode
    # replace them with nearest segment, like change a city value within it's region or nearest city value

# to find mean of a variable
mean(df$n_hos_beds) # if it's include null values, result will be NA

# To remove NA values and get the mean of n_hos_beds
mean(df$n_hos_beds, na.rm = TRUE)


which(is.na(df$n_hos_beds)) # will list the row with where n_hos_beds is null

# now to replace it with mean
df$n_hos_beds[is.na(df$n_hos_beds)] <- mean(df$n_hos_beds, na.rm = TRUE)




# Dummy Variable creation
install.packages('dummies')
library(fastDummies)

df <- dummy(df, drop=FALSE)
View(df)

df2 <- dummy_columns(df)


# Correlation matrix is a table showing correlation coefficients between variables.

cor(df)
round(cor(df2), 2)

available.packages()["dummies", ]




