# Task 01: Download and Load the Dataset
titanic <- read.csv("titanic.csv")
df_titanic <- as.data.frame(titanic)
head(df_titanic)
View(df_titanic)

# Task 03: Explore the Dataset 
str(df_titanic)
install.packages("Hmisc")
library(Hmisc)
describe(df_titanic)  # Need to load Hmisc package
summary(df_titanic)
class(df_titanic)
dim(df_titanic)
nrow(df_titanic)
ncol(df_titanic)
tail(df_titanic)

install.packages("dplyr")
library(dplyr)
sample_n(df_titanic,5)

# Task 04: Handle Missing Values
# Before handling missing values - 
df_titanic_1 <- read.csv("titanic.csv")

# After handling missing values - 
df_titanic_1$Age[is.na(df_titanic_1$Age)] <- mean(df_titanic_1$Age, na.rm = TRUE) # replacing missing values with mean of Age
sum(is.na(df_titanic_1$Age)) # Now age column has no missing values

df_titanic_1$Cabin[is.na(df_titanic_1$Cabin)] <- "Unknown" # replacing missing values with "Unknown"
sum(is.na(df_titanic_1$Cabin))

df_titanic_1[is.na(df_titanic_1$Embarked)] <- "S" # replacing missing values with "Unknown"
sum(is.na(df_titanic_1$Embarked))
sum(is.na(df_titanic_1))

# Task 05: Data Manipulation using dplyr
# filter(): select data where age > 50
install.packages("dplyr")
library(dplyr)
head(filter(df_titanic, Age > 50))

# select(): select PassengerId, Name, Age, Sex, Survived where age > 50
head(select(filter(df_titanic, Age > 50), PassengerId, Name, Age, Sex, Survived))

# arrange(): arrange data by age in ascending order
head(arrange(df_titanic, Pclass))

# mutate(): create a new column called "Age_Class" which is the age divided by the class
head(mutate(df_titanic, Age_Class = Age/Pclass))

# distinct(): select distinct values of Sex
df_titanic %>% distinct(Embarked)

# %>% operator is used to chain multiple functions together
# %>% is known as the pipe operator in R
df_titanic %>% filter(Age > 50) %>% select(PassengerId, Name, Age, Sex, Survived, Pclass, Embarked) %>% group_by(Embarked) %>% mutate(Age_Class = Age/Pclass) %>% head()

# Task 06: Summarize Data
summarise(df_titanic_1, mean_age = mean(Age), mean_fare = mean(Fare), mean_survived = mean(Survived))
summarise(df_titanic_1, sd_age = sd(Age), sd_fare = sd(Fare), sd_survived = sd(Survived))
summarise(df_titanic_1, median_age = median(Age), median_fare = median(Fare), median_survived = median(Survived))

# Task 07: String Manipulation and Summarization
grep("ade", df_titanic_1$Name, value = TRUE) # Pattern matching
nchar(df_titanic_1$Name) # Counting number of characters in each string
paste(df_titanic_1$Name, df_titanic_1$Age, sep = " - ")
sprintf("%s - %f", df_titanic_1$Name, df_titanic_1$Age)
substr(df_titanic_1$Name, 1, 3) # Extracting first 3 characters of each string
strsplit(df_titanic_1$Name, " ")
gregexpr("s", df_titanic_1$Name) # Counting number of occurrences of "s" in each string

summarise(df_titanic_1, mean_age = mean(Age), mean_fare = mean(Fare), mean_survived = mean(Survived), mean_name_length = mean(nchar(Name)))
summarise(df_titanic_1, sd_age = sd(Age), sd_fare = sd(Fare), sd_survived = sd(Survived), sd_name_length = sd(nchar(Name)))
summarise(df_titanic_1, median_age = median(Age), median_fare = median(Fare), median_survived = median(Survived), median_name_length = median(nchar(Name)))

# Task 08: Indexing and Slicing
df_titanic[1:5, ] # Selecting first 5 rows
df_titanic[1:5, 1:5] # Selecting first 5 rows and first 5 columns
df_titanic[1:5, c(1,3,5)] # Selecting first 5 rows and columns 1, 3, and 5
df_titanic[df_titanic$Pclass == 1, ] # Selecting rows where Pclass is 1
subset(df_titanic, select = c(PassengerId, Name, Sex, Survived))

# Task 09: Scatter Plot
plot(df_titanic$Age, df_titanic$Fare, main = "Age vs Fare", xlab = "Age", ylab = "Fare", col = "blue")

library(ggplot2)
ggplot(df_titanic, aes(x = Age, y = Fare)) + geom_point() + ggtitle("Age vs Fare") + xlab("Age") + ylab("Fare") + theme_bw()

# Task 10: Boxplot
boxplot(Fare ~ Pclass, data = df_titanic, main = "Fare by Pclass", xlab = "Pclass", ylab = "Fare")
   
ggplot(df_titanic, aes(x = Pclass, y = Fare)) + geom_boxplot() + ggtitle("Fare by Pclass") + xlab("Pclass") + ylab("Fare") + theme_bw()

