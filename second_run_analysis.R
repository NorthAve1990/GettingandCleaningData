## Second Tiday Dataset

getwd()
source("first_run_analysis.R")

## Calculate the average
# install.packages("reshape")
library(reshape)
library(reshape2)
library(tidyr)
library(dplyr)

## Free some memeory
rm(list = c("f","fd","fds","fdss","fdsx","fdsy","fdsz","s","sd","sds","sdss","sdsx","sdsy","sdsz"))

## Make one final dataset - using melt and dcast
secdset    <- melt(tidy_data, id.vars = c("SubjectT", "ACT"), measure.vars = c(3:68))
secdsetavg <- dcast(secdset, c("ACT", "SubjectT") ~ variable, mean)
write.table(secdsetavg, "S_Tidy_Dataset.txt", quote = FALSE, sep = "\t", row.names = FALSE)
rm(list = c("secdset"))

## Make one final dataset - using gather, group_by and summarise
sdc <- gather(tidy_data, variable, value, -ACT, -SubjectT, c(3:68))
sdse <- group_by(sdc, SubjectT, ACT) %>% summarise_each(funs(mean))
write.table(sdse, "second_tds.txt", quote = FALSE, sep = "\t", row.names = FALSE)
rm(list = c("tidy_data"))
rm(list = c("sdc"))
