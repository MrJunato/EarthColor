chooseCRANmirror(11)
#https://secondnature.org/planet-earth-1401465698wt7/

'
# install packages --------------------------------------------------------

install.packages("imager")
install.packages("ggplot2")
'

# load packages -----------------------------------------------------------

library(imager)
library(ggplot2)

# test image library ------------------------------------------------------

plot(boats)
x <- boats
plot(x)

# internet image ----------------------------------------------------------
image <- load.image("earth.jpg")
dim(image)
plot(image)

# Function to change the number of clusters -------------------------------
new_color <- function(x){
  #matrix_image <- matrix(image, nrow = 300*300, ncol = 3)
  matrix_image <- array(image,dim=c(300*300,3))
  colnames(matrix_image) <- c("Red","Green","Blue")
  #plot(matrix_image)
  #head(matrix_image)
  
  set.seed(99)
  kmeans_image <- kmeans(matrix_image, x,iter.max=1000)
  #str(kmeans_image)
  #kmeans_image$centers
  #kmeans_image$cluster
  
  for(i in 1:(300*300)){
    cluster <- kmeans_image$cluster[i]
    matrix_image[i,1:3] <-  kmeans_image$centers[cluster,1:3]
  }
  
  new_image <- array(matrix_image,dim=c(300,300,1,3))
  new_image<- cimg(new_image)
  plot(new_image)
}

# Change function number to watch the difference in earth image -----------
#Tip: Test it with 3, 8 and 16
new_color(3)
