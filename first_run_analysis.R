## Merge datasets
getwd()

## First datasets
fdss <- read.table(file="subject_test.txt")
fdsx <- read.table(file="./test/X_test.txt")
fdsy <- read.table(file="./test/y_test.txt")

## Merging First datasets
fdsz <- data.frame(fdss, fdsy)
fds  <- data.frame(fdsz, fdsx)

## Second datasets
sdss <- read.table(file="subject_train.txt")
sdsx <- read.table(file="./train/X_train.txt")
sdsy <- read.table(file="./train/y_train.txt")

## Merging Second datasets
sdsz <- data.frame(sdss, sdsy)
sds  <- data.frame(sdsz, sdsx)

## Read Features
f <- read.table(file="features.txt")
s <- read.table(file="features.txt")

## Make Features Vector
fe <- as.vector(f[,2])
se <- as.vector(s[,2])

## Apply Column Names for Tidy Dataset
colnames(fds) <- c("SubjectT", "ACT", fe)
colnames(sds) <- c("SubjectT", "ACT", se)


## Extracts only the Mean and Standard
fd <- fds[, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216, 217, 229, 230, 242, 243, 255, 256, 268:273, 347:352, 426:431, 505, 506, 518, 519, 531, 532, 544, 545)]
sd <- sds[, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216, 217, 229, 230, 242, 243, 255, 256, 268:273, 347:352, 426:431, 505, 506, 518, 519, 531, 532, 544, 545)]

## Make one final dataset
tidy_data <- rbind(sd, fd)

## Apply activity labels
tidy_data$ACT[tidy_data$ACT == 1] <- "WALKING"
tidy_data$ACT[tidy_data$ACT == 2] <- "WALKING_UPSTAIRS"
tidy_data$ACT[tidy_data$ACT == 3] <- "WALKING_DOWNSTAIRS"
tidy_data$ACT[tidy_data$ACT == 4] <- "SITTING"
tidy_data$ACT[tidy_data$ACT == 5] <- "STANDING"
tidy_data$ACT[tidy_data$ACT == 6] <- "LAYING"

## Make one final dataset
write.table(tidy_data, "Tidy_Dataset.txt", quote = FALSE, sep = "\t", row.names = FALSE)
