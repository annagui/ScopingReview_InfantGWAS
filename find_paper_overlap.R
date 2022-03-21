### This script was created to automatically remove duplicates between PubMed and PsychINFO search for the 
### SCOPING REVIEW ON GENOME-WIDE ASSOCIATION STUDIES OF EARLY BEHAVIOR
#by Anna Gui, February 2022

setwd("/path/to/working/directory")
pubmed<-read.csv("csv-genome-wid-set.csv") #downloaded output for PubMed search, date 11/02/2022
psychinfo1<-read.csv("delivery-1.csv") #first 100 articles downloaded as output of PsychINFO search, date 11/02/2022
psychinfo2<-read.csv("delivery-2.csv") #articles 101-200 downloaded as output of PsychINFO search, date 11/02/2022
psychinfo3<-read.csv("delivery-3.csv") #last 84 articles downloaded as output of PsychINFO search, date 11/02/2022


psychinfo<-rbind.data.frame(psychinfo1,psychinfo2,psychinfo3) #merge all PsychINFO output files
write.csv(psychinfo,"psychinfo_all.csv",row.names = F,quote = F) #save new spreadsheet for psychInfo search


length(which(pubmed$DOI %in% psychinfo$DOI)) #number of overlapping articles based on DOI
length(which(psychinfo$DOI %in% pubmed$DOI)) #check same number the other way round


duplicates_pI<-pubmed[which(pubmed$DOI %in% psychinfo$DOI),] #get index of overlapping articles

pubmed_clean<-pubmed[-(which(pubmed$DOI %in% psychinfo$DOI)),] #remove from PubMed spreadsheet the articles that can be found in the PsychINFO spreadsheet

write.csv(pubmed_clean,"pubmed_clean.csv",row.names = F,quote = F) #save new spreadsheet for PubMed search

