getwd()

#### Butler small dataset ####
# read Butler.smallDataSet.xlsx 
install.packages("readxl")
library(readxl)
dataset <- read_excel("Butler_smallDataset.xlsx")
head(dataset)

# linear regression model
linear_model <- lm(Time ~ Miles, data=dataset)
linear_model
print(linear_model)

# Predict Time based on linear_model
predicted_time <- predict(linear_model,dataset)
predicted_time

error <- dataset$Time - predicted_time
error_square <- error^2
error_square

mean(error_square)
sqrt(mean(error_square))

# Plot scatter plot of residuals
plot(dataset$Miles,error,main="Scatter plot of residuals",xLab="Miles",yLab="Residuals")	

#### Butler large dataset ####
# read butler large dataset
dataset_large <- read_excel("Butler.xlsx")
head(dataset_large)
colnames(dataset_large)
str(dataset_large)

# Generate correlation matrix
correlation_matrix <- cor(dataset_large[,c("Gasoline Consumption","Miles","Deliveries","Time")],use="complete.obs")
correlation_matrix

pairs(dataset_large[,c("Time","Miles","Deliveries")],main="Pair Plot")
linear_model_large <- lm(Time ~Miles*Deliveries,data=dataset_large)
linear_model_large
summary(linear_model_large)

# Predict time based on linear model large
predicted_time_large <- predict(linear_model_large,dataset_large)
predicted_time_large

error_large <- dataset_large$Time - predicted_time_large
error_square_large <- error_large^2
error_square_large

mean(error_square_large)
sqrt(mean(error_square_large))

# Plot scatter plot of residuals
plot(dataset_large$Miles,error_large,main="Scatter plot of residuals",xLab = "Miles",yLab="Residuals")

# Boxplot of time with ThroughCongestedHighway
boxplot(dataset_large$Time ~ dataset_large$ThroughCongestedHighway, main="Boxplot of time with ThroughCongestedHighway", xLab="ThroughCongestedHighway",yLab="Time")

linear_model_large <- lm(Time ~Miles*Deliveries*ThroughCongestedHighway,data=dataset_large)
linear_model_large
predicted_time_large <- predict(linear_model_large,dataset_large)
predicted_time_large

error_large <- dataset_large$Time - predicted_time_large
error_square_large <- error_large^2
error_square_large

mean(error_square_large)
sqrt(mean(error_square_large))

#### Reynold Dataset ####
dataset_reynolds <- read_excel("Reynolds_b2_14_06_24.xlsx")
head(dataset_reynolds)

# Generate linear model between "Months Employed" and "Scales Sold"
linear_model_reynold <- lm(`Scales Sold`~ `Months Employed`,data=dataset_reynolds)
linear_model_reynold
summary(linear_model_reynold)

# Plot residuals
predicted_scales_sold <- predict(linear_model_reynold,dataset_reynolds)
error_reynolds <- dataset_reynolds$`Scales Sold`-predicted_scales_sold
error_square_reynolds <- error_reynolds^2
error_square_reynolds

mean(error_square_reynolds)
sqrt(mean(error_square_reynolds))
plot(dataset_reynolds$`Months Employed`,error_reynolds,main="Scatter plot of residuals over `Months Employed`",xLab="`Months Employed`",yLab="Residuals")

### Create `Months Employed` squared
dataset_reynolds$`Months Employed Squared` <- dataset_reynolds$`Months Employed`^2
head(dataset_reynolds)

linear_model_reynold_2 <- lm(`Scales Sold`~`Months Employed`+`Months Employed Squared`,data=dataset_reynolds)
linear_model_reynold_2
predicted_scales_sold <- predict(linear_model_reynold_2,dataset_reynolds)
error_reynolds <- dataset_reynolds$`Scales Sold`-predicted_scales_sold
error_square_reynolds <- error_reynolds^2
error_square_reynolds

mean(error_square_reynolds)
sqrt(mean(error_square_reynolds))

plot(dataset_reynolds$`Months Employed`,error_reynolds,main="Scatter plot of residuals",xLab="Months Employed",yLab="Residuals")

#### Oscar dataset ####
# read Oscar.xlsx

dataset_oscar <- read.csv("OscarsDemo_b5_28_06.xlsx")
head(dataset_oscar)
logistic_model <- glm(Winner~OscarNominations,data=dataset_oscar,family=binomial)
summary(logistic_model)

# Predict winner based on logistic model
predicted_winner <- predict(logistic_model,dataset_oscar,type="response")
predicted_winner

threshold = 0.5
predicted_winner_class <- if (predicted_winner > threshold,1,0)
predicted_winner_class

# Confusion matrix
table(dataset_oscar$Winner,predicted_winner_class)

# accuracy
accuracy <- sum(diag(table(dataset_oscar$Winner,predicted_winner_class)))/nrow(dataset_oscar)
accuracy

library(caret)

# Classification tree model on Oscar dataset
library(rpart)
tree_model <- rpart(Winner~OscarNominations,data=dataset_oscar,method="class")
summary(tree_model)

# Plot tree
plot(tree_model)
library(rpart.plot)
rpart.plot(tree_model,type=3,extra=102,under=TRUE,main="Classification Tree for Predicting Winner")
text(tree_model)

# Predicted winner based on tree model
predicted_winner_tree <- predict(tree_model,dataset_oscar,type="class")
predicted_winner_tree

# Confusion matrix
table(dataset_oscar$Winner,predicted_winner_tree)

# Accuracy
accuracy <- sum(diag(table(dataset_oscar$Winner,predicted_winner_tree)))/nrow(dataset_oscar)
accuracy

# Regression tree on butler dataset
tree_model_regression <- rpart(Time ~ Miles + Deliveries, data=dataset_large,method="anova",control=rpart.control(maxdepth=8))
summary(tree_model_regression)

# Plot tree
plot(tree_model_regression)
rpart.plot(tree_model_regression,type=3,extra=101,under=TRUE,main="Regression tree for predicting time")

# Predict time based on tree model regression
predicted_time_tree <- predict(tree_model_regression,dataset_large)
predicted_time_tree

error_large <- dataset_large$Time - predicted_time_tree
error_square_large <- error_large^2
error_square_large

mean(error_square_large)
sqrt(mean(error_square_large))

# Clustering with k-means iris dataset
# read iris dataset
library(datasets)
data(iris)
head(iris)

# Load dataset as dataframe
iris_df <- as.data.frame(iris)
iris_df <- iris_df[,-5]
head(iris_df)

plot(iris_df$Sepal.Length,iris_df$Sepal.Width,main="Sepal Length vs. Sepal Width",xLab = "Sepal Length",yLab="Sepal Width")
plot(iris_df$Sepal.Length,iris_df$Petal.Width,main="Sepal Length vs. Sepal Width",xLab = "Sepal Length",yLab="Sepal Width")

pairs(iris_df,main="Pair Plot")

k <- 3
set.seed(123)
kmeans_model <- kmeans(iris_df,centers=k)
kmeans_model

# Get the cluster assignments
Y <- kmeans_model$cluster
Y
sse <- kmeansMod$tot.withinss
centroids <- kmeansMod$centers

# Plot kmeans
plot(iris_df,col=kmeans_model$cluster)
points(kmeans_model$centers,col=1:k,pch=8,cex=2)

# Plot SSE for different k values
sse_values <- c()

for (k in 1:10){
    kmeansMod <- kmeans(iris_df,centers=k,iter.max=1000)
    sse_values <- c(sse_values,kmeansMod$tot.withinss)
}
plot(sse_values,type="b",xLab="k",yLab="sse")
plot(1:10,sse_values,type="b",xLab="k",yLab="sse")
