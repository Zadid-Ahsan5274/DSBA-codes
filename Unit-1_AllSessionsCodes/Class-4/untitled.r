# For run -> Ctrl+Enter
y <- 5+7 # assignment operator
x <- y + 5 # assignment operator
print(x)
print(y)
print("This is the value of y: ",y)
print("Hello World")

# Series/Array
x1 <- 21:40
min(x1) # minimum value of an array
mean(x1) # average value of an array
sd(x1) # standard deviation of an array

z <- c(2.1,3.5,8.9)  # concatenate
print(z)

z1 <- c(2.1,3.5,z)
sqrt(y)  # square root of y
sqrt(z)  # square root of array z

?seq
seq(1,20, by=2)  # sequence of numbers   will be incremented by 2

array1 <- c(2.1,"zadid",8.9)
array2 <- c(2.1,3.5,8.9,4.1,12.9)
class(array2)
class(array1)
print(array1)
class(12)
class("12")
class("zadid")
rep(c(0,1,2),times=10)

y <- c(12, 15, 25)

v1 <- c(2.1,"zadid",3.5,TRUE)
print(v1)
class(12.5)

array2[1]
array2[3]  #indexing
array2[3:5]  #slicing

sqrt(array2[1])

sqrt(array1[1])

# list
v2 <- list(2.1,"zadid",3.5,TRUE)
v2[[1]]

# Kind of dictionary in python
# Named array
array3 <- c(apple = 2.1,orange = 3.5,grape = 8.9)
array3[1]
array3["apple"]  
v3 <- array3[1]

# Flat array, no dimentions
array4 <- 1:20
class(array4)
dim(array4) <- c(2,10)
dim(array4)
array4



array5 <- 1.1:20.1
class(array5)
dim(array5)
length(array5)

# Matrix
dim(array5) <- c(4,5)   # row 4 column 5
dim(array5)

array5

# Array / Vector synonymous
#Matrix  cbind -> column bind
matrix()
names <- c("bill","john","jerry","lisa")
names
array5
namedMatrix <- cbind(names,array5)
namedMatrix


# Data frame
as.data.frame(as.table(namedMatrix))
data.frame(names,array5)
namedMatrix

# Data frame is the ultimate data structure for data analysis

### EDA -> Exploratory Data Analysis ###
getwd()   # Current working directory
setwd("D:/PGD-ABP-DBSA-Projects/Class-3")   # Change working directory
# Copy and Paste the path from window explorer and replace all "\" with "/"
getwd()
# CSV -> Comma Separated Values
# Xlsx -> Proprietary file format by Microsoft
# Difference in internal structures

# Load plants data set
plants <- read.csv("plants.csv")
class(plants)
# In data frame data type will be retained
dim(plants)
names(plants)
nrow(plants)
ncol(plants)

head(plants)
tail(plants)
summary(plants)

install.packages("tidyverse")
install.packages("readxl")
library("readxl")
plants2 <- read_excel("D:/PGD-ABP-DBSA-Projects/Class-3/plants.xls")
class(plants2)
View(plants2)

View(plants)

# Load cars data set
cars <- read.csv("D:/PGD-ABP-DBSA-Projects/Class-3/cars.csv")
dim(cars)
names(cars)
head(cars)
tail(cars)

cars$speed
cars$dist
plot(cars$speed,cars$dist,pch=19,col="blue")
plot(cars)
plot(x = cars$speed,y = cars$dist, xlab = "Speed",ylab="Stopping Distance",pch=12,col="red")
str(cars)
hist(cars$speed,col="blue",breaks=10)
data(mtcars)
head(mtcars)
data(iris)
head(iris)
View(iris)

### dplyr package load ###
install.packages("dplyr")
library(dplyr)
library(readxl)
df1 <- read_excel("2014-07-08.xlsx")
head(df1)
View(df1)
dim(df1)

### dplyr usage ###
install.packages("dplyr")
library(dplyr)
names(df1)

### Select command ###
select(df1,ip_id,package,country)   # Select -> view specific columns in a dataframe
v2 <- select(df1,r_arch:ip_id)
v1 <- select(df1,-r_arch)
View(v1)

### Filter command ###
filter(df1,country == "US")
filter(v2,country == "US" | country == "IN",package == "ggplot2")
filter(v2,country == "US" & country == "IN")  # will not return any row
filter(v2,country == "US" | country == "IN",package == "ggplot2",size>100500)
filter(df1,country == "US" | country == "IN",package == "ggplot2",size>100500)

### Arrange command ###
arrange(df1,size)  # By default - ascending order
arrange(df1,desc(size))
v3 <- mutate(df1,sizeKB = size/1024)
dim(v3)
dim(df1)
select(v3,sizeKB)
select(v3,r_arch:sizeKB)
v4 <- mutate(df1,corrected_size = size+1000)
select(v4,r_arch:corrected_size)

v4[,4] #indexing
v4[1:10,4] # Row 1-4, Column 4
v4[12:15,6:7]
mutate(df1,corrected_size = size+1000)[  ,6:7]
mutate(df1,corrected_size = size+1000)[  ,c(2,5,7)]
summarise(df1,mean(size))
summarise(df1,sd(size))
summarise(df1,max(size))

df1_groupby_package <- group_by(df1,package)
dim(df1_groupby_package)
summarise(df1_groupby_package,average_size = mean(size),n(),sd(size))

### %>% -> pipe operator ###
myvar1 <- select(df1,size:ip_id)
myvar2 <- filter(myvar1,country=="US")
dim(myvar2)
mutate(myvar2,sizeKB = size/1024)

df1 %>% select(size:ip_id) %>% filter(country=="US") %>% mutate(sizeKB = size/1024) %>% arrange(size) %>% head()

### Class 4 contents start below ###

### tidyr package ###
install.packages("tidyr")
library(tidyr)
students <- read.csv("D:/PGD-ABP-DBSA-Projects/data files/students.txt")

# This student data needs to be unpivoted

### pivoting and unpivoting ###

### spread() command -> pivoting
### gather() command -> unpivoting
studentsv2 <- gather(students,key = gender, value = count,male:female)   # unpivoting
studentsv2
spread(studentsv2,gender,count)
students %>% gather(gender,count,male:female) %>% spread(gender,count) %>% print()

students2 <- read.csv("D:\\PGD-ABP-DBSA-Projects\\data files\\students2.txt")
students2
# students2v2 <- gather(students2,gender_section,count,male_1:female_2)
students2v2 <- gather(students2,gender_section,count,-grade)
students2v2
separate(students2v2,gender_section,c("gender","section"),sep="_")


