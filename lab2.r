#basic plot
height<-c(145, 167, 176, 123, 150)
weight<-c(51, 63, 64, 40, 55)
plot(height, weight) #plot values after reading from vector

#write into csv
bmi <- cbind(height, weight)
write.csv(bmi, file="BMI.csv", row.names = FALSE)

#plot values read from file
df<-read.csv("BMI.csv")
plot(df$height, df$weight)
plot(df$height, df$weight, xlab = "height", ylab = "weight") #add labels to x and y axis

#pch sets the shape of the datapoints, 16 for fill; cex sets the size
plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species, pch = 16, cex = 2)
#sets legend over the plot
legend(x = 4.5, y = 7, legend = levels(iris$Species), col = c(1:3), pch=16) 

#HISTOGRAM
hist(bmi, breaks = 5, main = "Breaks=5")
help(hist)

#BOXPLOT
head(iris)
boxplot(iris$Sepal.Length ~ iris$Species)
box()

#BARPLOT
barplot(iris$Sepal.Length)

#SAVING PLOT
png("Sepal vs Petal Length in Iris.png", width=500, height=500, res=72)
plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species, main = "Sepal vs Petal Length in Iris.png")
help(png)

#GGPLOT
install.packages("ggplot2")
library("ggplot2")
install.packages("naivebayes")
library("naivebayes")

#CATEGORICAL DATA BAYES
datavoters<-read.csv("voters.txt", header = FALSE)
model <- naive_bayes(datavoters $V1 ~ ., data = datavoters)
help("naive_bayes")
predict(model, datavoters [1:10,-1]) #-1 refers excluse 1st column
predict(model, datavoters [1:10,], type = "raw")
pred <- predict(model, datavoters [, -1])
table(pred, datavoters$V1) #confusion matrix

## Example with metric predictors:
data(iris)
m <- naive_bayes(Species ~ ., data = iris) # . represents all
## alternatively:
m <- naive_bayes(iris[,-5], iris[,5]) # -5 exclude 5th column
m
table(predict(m, iris[,-5]), iris[,5]) #confusion matrix


#KMEANS
x <- data.frame(y1=rnorm(100, sd = 0.3),y2=rnorm(100, sd = 0.4))
ch <- kmeans(x, 2) # 2 clusters
plot(x, col = ch$cluster)
points(ch$centers, col = 1:2, pch = 8, cex = 2)
#using ggplot
ggplot(x, aes(y1,y2, color = ch$cluster)) + geom_point()
#another example
ch <- kmeans(x, 5, nstart = 25)
plot(x, col = ch$cluster)
points(ch$centers, col = 1:5, pch = 8)


#KNN
library("class")
x1 <- c(7,7,3,1)
x2 <- c(7,4,4,4)
y <- c(1,1,2,2) #label
df <- cbind(x1, x2)
testDF <- c(3,7)
pred <- knn(train = df, test = testDF, cl = y, k=3)
pred
testdf<-c(2,7)
pred


#Linear Regression
library("MASS")
data(cats)
head(cats)
summary(cats)
plot(Hwt ~ Bwt, data=cats)
cat.mod <- lm(Bwt ~ Hwt, data=cats)
summary(cat.mod)
testData <- data.frame(Hwt=3.5)
predict(cat.mod, testData)


#Decision Tree
library("rpart")
df <- read.csv("adults.csv")
train <- data.frame(
  ClaimID = c(1,2,3),
  RearEnd = c(TRUE, FALSE, TRUE),
  Fraud = c(TRUE, FALSE, TRUE)
)
train

mytree<-rpart(
  Fraud~RearEnd,
  data = train,
  method = "class",
  minsplit = 2,
  minbucket = 1
)
mytree

train <- data.frame(
  ClaimID = 1:5,
  Activity = factor(
    x = c("active", "very active", "very active", "inactive", "very inactive"),
    levels = c("very inactive", "inactive", "active", "very active"),
    ordered = TRUE
  ),
  Fraud = c(FALSE, TRUE, TRUE, FALSE, TRUE)
)

train

mytree <- rpart(
  Fraud ~ Activity,
  data = train,
  method = "class",
  minsplit = 2,
  minbucket = 1
)
mytree


#LOGISTIC REGRESSION
mydata <- read.csv("cancer.csv")
mydata$wt.loss[is.na(mydata$wt.loss)] <- mean(mydata$wt.loss, na.rm = TRUE)
mydata$meal.cal[is.na(mydata$meal.cal)] <- mean(mydata$meal.cal, na.rm = TRUE)
mydata$ph.ecog[is.na(mydata$ph.ecog)] <- mean(mydata$ph.ecog, na.rm = TRUE)
mydata$pat.karno[is.na(mydata$pat.karno)] <- mean(mydata$pat.karno, na.rm = TRUE)
mydata$ph.karno[is.na(mydata$ph.karno)] <- mean(mydata$ph.karno, na.rm= TRUE)

index <-1:nrow(mydata)
trainindex <-sample(index, trunc(length(index)/4))
train<-mydata[trainindex,]
test <-mydata[-trainindex, ]
mylogit <-glm(status ~ inst+time+age+sex+ph.ecog+ph.karno+pat.karno+meal.cal+wt.loss, family = binomial("logit"), data=train )
summary.glm(mylogit)
new<-glm(status ~ inst+sex+ph.ecog, family = binomial("logit"), data=train )
predt <-predict(new, test ,type = 'response')
predt