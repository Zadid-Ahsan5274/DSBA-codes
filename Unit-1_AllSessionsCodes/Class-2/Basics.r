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





