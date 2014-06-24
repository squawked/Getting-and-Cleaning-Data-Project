library(data.table)

run.analysis <- function( url) {
  
  # create working directory
  dir.create("project")
  setwd("project")
  path <- getwd()
  
  #download file
  download.file(url, file.path(path, "Dataset.zip"))
  
  #unzip file
  unzip("Dataset.zip")
  
  # read Train data
  dTrainY <- fread("y_train.txt")
  dTrainSubj <- fread("subject_train.txt")
  setnames(dTrainSubj, "V1", "SubjectID")
  setnames(dTrainY, "V1", "ActivityID")
  
  dTrain <- cbind(dTrainSubj, dTrainY, dTrainX)
  
  # read Test data
  setwd("../test")
  dTestX <- read.table("X_test.txt")
  dTestSubj <- fread("subject_test.txt")
  dTestY <- fread("y_test.txt")
  setnames(dTestSubj, "V1", "SubjectID")
  setnames(dTestY, "V1", "ActivityID")
  dTest <- cbind(dTestSub, dTestY, dTestX)
  
  # merge Train and test data
  allData <- rbind(dTrain, dTest)
  
  # read features
  setwd ("..")
  features <- fread("features.txt")
  
  # extract mean features
  featmean <- features[grep("mean\\(", features$V2),]
  # extract std features
  featstd <- features[grep("std\\(", features$V2),]
  # merge std and mean features
  feat2 <- rbind(featmean, featstd)
  
  # Tidy up feature column names
  feat2$V2 <- gsub("-mean()", "Mean", feat2$V2, fixed=TRUE)
  feat2$V2 <- gsub("-std()", "Std", feat2$V2, fixed=TRUE)
  feat2$V2 <- gsub("-", "", feat2$V2, fixed=TRUE)
  
  #prepend "V" to the column name to match column names in allData
  feat2$V1 <- paste("V", feat2$V1,sep="")
  
  # extract only columns with std deviation/mean features
  dataStdMean <-allData[, c("SubjectID", "ActivityID",feat2$V1)]
  
  # rename columns from code to description
  colnames(dataStdMean) <- c("SubjectID", "ActivityID",feat2$V2)
  
  # get average by SubjectID and ActivityID
  cd <- aggregate(dataStdMean, list(dataStdMean$SubjectID,dataStdMean$ActivityID), FUN=mean)
  
  cd <- merge(activityNames, cd, by="ActivityID")
  # drop ActivityID
  cd <- cd[,2:69]
  
  # order by subjectID
  orddata <- cd[order(cd[,2], cd[,1]),]
  
  # swap column position of ActivityName and SubjectID
  od2 <- orddata[,c(2,1,3:68)]
  
  # write out result to file
  write.table(od2, "HumanActivityRecognitionAverage.txt", sep="\t", row.names=FALSE)
  
  
}