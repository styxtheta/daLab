str1 <- "bruh"; bool1 <- TRUE; com1 <- 1i; num1 <- 1
mode(str1); mode(bool1); mode(com1); mode(num1)


y<-c(1,2,3)
length(y)

apple<-c('orange', 'green', 'yellow')
length(apple)
mode(apple)

#to create a sequence of numbers from 1 to 10
a<-1:10
a

#to create a matrix
mat = matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE)
print(mat)

#to create a data frame
BMI <- data.frame(
  gender = c('Male', 'Male', 'Female'),
  height = c(152, 171.9, 202.4),
  weight = c(65, 57, 57),
  Age = c(25, 24, 57)
)

BMI

#to read a text file
mydata = read.table("data.txt")
mydata

#to read from console
z <- scan()
z

#to read a string from the user
ANSWER<-readline('Are you satisfied with your life?')
ANSWER


#if construct
x<-1
if(x == 1)
{
  print("True")
  print("yes x is 1")
} else {
  print("false")
  print("x was 2 all along")
}

#for construct
for (i in 1:10)
  print(i)

#repetitive vector
rep(2,5)

#sequence
sequence(c(5,10))

#read excel files
install.packages("readxl")
library("readxl")

x<-read_excel("data.xlsx")
x



#define a function
add<-function(x,y)
{
  z<-x+y
  print(z)
}
add(2,3)


#apply functions
M <- matrix(c(1:9), nrow = 3, ncol = 3, byrow = TRUE)
apply(M, 1, sum)
apply(M, 1, mean)
sapply(1:5, function(x) x^2)
lapply(1:5, function(x) x^2)

sapply(1:3, function(x) mean(M[,x]))
sapply(1:3, function(x) mean(M[x,]))
help(sapply)
  


