# 5+7
# print("Hello World!")

# Load Auto.csv
autods <- read.csv("Auto.csv") # comments
# now i am going to see the first 5 rows of the data
head(autods)

# Exploratory data analysis - EDA
str(autods)
install.packages("Hmisc")
library(Hmisc)
describe(autods)  # Need to load Hmisc package
summary(autods)
class(autods)
dim(autods)
nrow(autods)
ncol(autods)
head(autods)
head(autods,3)
View(autods)
tail(autods)

install.packages("dplyr")
library(dplyr)
sample_n(autods,5)


class(autods)
x <- 150
x
class(x)
y <- "zadid"
y
class(y)
z <- 130.9
z
class(z)

is.na(autods)
!is.na(autods)
sum(is.na(autods))


####################
install.packages("readxl")
library(readxl)

# Reading Excel file
autods_excel <- read_excel("Auto.xlsx")

autods <- read.csv("Auto.csv",na.strings = c("","?","NA"))
sum(is.na(autods))

head(autods)
sum(is.na(autods$weight))
sum(is.na(autods$horsepower))
sum(is.na(autods$name))

autods$origin

table(autods$origin)
unique(autods$origin)
unique(autods$horsepower)

class(autods)
class(autods$origin)
class(autods$name)
class(autods$horsepower)

library(dplyr)
?select
?sample_n
?describe # wont' work

head(autods)
select(autods, name, mpg, cylinders, origin)
autodssubset1 <- select(autods,name,weight,horsepower)
dim(autodssubset1)
select(autods,name:origin)
head(select(autods,name:origin))
head(select(autods,mpg:weight))
select(autods,-name)
select(autods, -c(name, weight))
select(autods, -starts_with("m"))
select(autods,contains("e"))

filter(autods, mpg > 44)
filter(autods,mpg>34)
filter(autods, mpg > 34, weight > 2000, origin==1)
filter(autods, mpg > 34 & weight > 2000 & origin==1)
filter(autods, mpg > 44 | weight > 4500)

min(autods$mpg)
max(autods$mpg)

min(autods$weight)
max(autods$weight)

filter(autods, is.na(autods$horsepower))
filter(autods, !is.na(autods$horsepower))
dim(filter(autods, !is.na(autods$horsepower)))
autodvnomv <- filter(autods, !is.na(autods$horsepower))

mean(autods$horsepower,na.rm=TRUE)
autods$horsepower[autods$horsepower=="NA"]
autods$horsepower[is.na(autods$horsepower)] <- mean(autods$horsepower,na.rm=TRUE)
autods$horsepower[is.na(autods$horsepower)]
autods$horsepower[1:10] # index based
autods$horsepower(1:10) # This will not work
autods$horsepower[autods$horsepower > 150] # condition based
autods$horsepower[is.na(autods$horsepower)] <- median(autods$horsepower,na.rm=TRUE)

autods$horsepower[is.na(autods$horsepower)]
autods$horsepower[73] <- 100

# creation of customised function
mycommands1 <- function(){
    print("Hello World!")
    print("Hello")
    print("World!")

    x <- 5
    y <- 5*2
    print(y)
}

mycommands1()

mymath1 <- function(x){
    # x <- 10
    y <- x * 10
    print(sqrt(y))
}

mymath1(15)

# Taking user input using function
usernameandage <- function(){
    name <- readline(prompt="Enter your name: ")
    age <- readline(prompt="Enter your age: ")
    age <- as.integer(age)
    print(name)
    print(age)
}
usernameandage()



##############################
install.packages("readr")
install.packages("tidyverse")
library(readr)
library(dplyr)
library(tidyverse)
autods <- read_csv("Auto.csv",na="?")
sum(is.na(autods$horsepower))
mean(autods$horsepower,na.rm=TRUE)
autods$horsepower[is.na(autods$horsepower)] <- mean(autods$horsepower,na.rm=TRUE)
autods$horsepower[is.na(autods$horsepower)] <- median(autods$horsepower,na.rm=TRUE)
autods$horsepower[1:10]
autods$horsepower[autods$horsepower > 200]


# Finding mode
mymode <- function(v) {
  u <- unique(v)
  u[which.max(tabulate(match(v, u)))]
}
mymode(autods$horsepower)

autods$horsepower[is.na(autods$horsepower)] <- mymode(autods$horsepower)
sd(autods$horsepower)
var(autods$horsepower)

select() # select columns
filter() # filter rows
arrange() # arrange rows
mutate() # create new columns
group_by() # group rows
summarize() # summarize rows

select(autods, name, weight, horsepower)
x <- filter(autods, mpg > 44, weight > 2000, origin==1)
x
y <- select(autods, name, mpg, origin, weight, horsepower)
filter(y, mpg>30, horsepower>2000,origin==1)

head(autods)

colnames(autods)
# use %>% symbol
# This symbol is a dplyr feature that allows us to chain multiple functions together.
autods %>% 
  select(mpg, origin,cylinders, weight, year, horsepower) %>% 
  filter(mpg>30, weight>2000) %>% 
  arrange(horsepower) %>% 
  mutate(watt = horsepower*746, kmg = mpg * 1.6) %>% 
  select(mpg, origin, kmg, cylinders, year, weight,watt) %>%
  group_by(origin,year) %>%
  summarise(meanofmpg = mean(mpg),n(),n_distinct(cylinders)) 
  
# autods %>% filter(mpg>30, horsepower>2000,origin==1) %>% select(mpg, origin,weight,horsepower)
table(autods$origin)

cor(autods$mpg,autods$weight)

#########
# String manipulation
astring <- c("We love R programming", "We love Python programming", "We love Julia programming")
x <- "R programming" # Sequence of characters - "r", "p", "o", "g", "r", "a", "m", "i", "n", "g"
strsplit(astring, " ") # Splitting a string into a list of substrings based on a specified separator
astring2 <- "Rahim"
astring2[1][1]
astring <- "We love R programming"
strsplit(astring, " ")[[1]][[2]]
'['(strsplit(astring, " "),1) # extract command

unlist(strsplit(astring, " "))
'['(unlist(strsplit(astring, " ")),1)

unique(autods$name)

# family of commands - lapply, sapply, tapply, apply, mapply, ...
unlist(lapply(strsplit(autods$name, " "),'[',1))
colnames(autods)
autods$model <- unlist(lapply(strsplit(autods$name, " "),'[',1))
colnames(autods)
head(select(autods,name,model))
unique(autods$model)
table(autods$model)

install.packages("openxlsx")     
library(openxlsx)        
write.csv(autods,"Auto_modified.csv")
write.xlsx(autods,"Auto_modified.xlsx")

par(mfrow=c(1,1))
lm(mpg~weight, data=autods)
boxplot(autods$weight, autods$mpg)

######
automodelds <- read.csv("Auto.csv")
head(automodelds)

par(mfrow=c(1,1)) # 2 rows and 1 column - images will appear side by side
lm(mpg~weight, data=automodelds)
plot(automodelds$weight,automodelds$mpg)
plot(automodelds$weight,automodelds$cylinders, main="Auto Model", xlab="Weight", ylab="Miles per Gallon", col="blue", pch=19, cex=1.5)
plot(automodelds$weight,automodelds$horsepower, main="Auto Model", xlab="Weight", ylab="Horsepower", col="red", pch=19, cex=1.5)

# Graphics in R using Base R
plot(automodelds$weight,automodelds$mpg,main="Auto Model",xlab="Weight",ylab="Miles per Gallon",col="red",pch=10,cex=1.5,frame=TRUE)
?plot

abline(v=30,col="blue",lwd=2)
abline(h=3000,col="blue",lwd=2)
boxplot(automodelds$mpg ~ automodelds$origin, main="Miles per Gallon", xlab="Model", ylab="Miles per Gallon", col="blue", notch=FALSE,horizontal=FALSE,frame=TRUE)
