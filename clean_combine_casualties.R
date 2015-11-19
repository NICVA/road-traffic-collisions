setwd("C:/Documents/road-traffic-collisions/data-archive/casualties/")
# If you fork and clone the Github repo, set this to 
## where you have downloaded the RTC casualties files

cas_temp = list.files(pattern = "*.tab")
for (i in 1:length(cas_temp)) assign(cas_temp[i], read.delim(cas_temp[i], stringsAsFactors = FALSE))

setwd("C:/Documents/road-traffic-collisions")
## Set the above to the forked repo folder

casualty1 <- rbind(casualty1998.tab, casualty1999.tab, casualty2000.tab, casualty2001.tab, casualty2002.tab, 
                   casualty2003.tab, casualty2004.tab, casualty2005.tab, casualty2006.tab, make.row.names = FALSE)
casualty2 <- rbind(casualty2007.tab, casualty2008.tab, casualty2009.tab, casualty2010.tab, make.row.names = FALSE)
casualty3 <- rbind(casualty2011.tab, casualty2012.tab, casualty2013.tab, casualty2014.tab, make.row.names = FALSE)

rm(list=cas_temp)

# Object 'casualty3' (the combined sets from 2011 onwards) has age groupings
# (nominal, as value labels), while previous datasets had the age itself as
# integers. First, lets put those age grouping in:
casualty3$c_agegroup <- factor(casualty3$c_agegroup, 
                               levels = c(1:9), 
                               labels = c("Under 10","10-16", "17-24", "25-34", "35-44", 
                                          "45-54", "55-64", "65+", "Unknown"))

# Then change the column names
colnames(casualty3) <- colnames(casualty2)
print(paste("Do the column names match now?",colnames(casualty2) == colnames(casualty3)))

# Remove the 'ped_inj' column from casualty2 & casualty3 (the data do not have this variable for 1998 to 2006)
casualty2 <- casualty2[-13]
casualty3 <- casualty3[-13]

# Create age group vectors for casualty1 and casualty2 so that they will work with casualty3
casualty1$c_age <- cut(casualty1$c_age, 
                       breaks=c(-Inf, 10, 17, 25, 35, 45, 55, 65, Inf), 
                       labels=c("Under 10", "10-16", "17-24", "25-34", "35-44", "45-54", "55-64", "65+"), 
                       right=FALSE)

casualty2$c_age <- cut(casualty2$c_age, 
                       breaks=c(-Inf, 10, 17, 25, 35, 45, 55, 65, Inf), 
                       labels=c("Under 10","10-16", "17-24", "25-34", "35-44", "45-54", "55-64", "65+"), 
                       right=FALSE)

# Now all rows can be combined
casualties <- rbind(casualty1, casualty2, casualty3)
rm(casualty1, casualty2, casualty3, cas_temp)

## Work through columns and change factors to their labels
casualties$c_class <- factor(casualties$c_class,
                             levels = c(1:7),
                             labels = c("driver", "pillion", "passenger front",
                                        "passenger rear", "pedestrian",
                                        "motorcyclist", "cyclist"))

casualties$c_sex <- factor(casualties$c_sex,
                             levels = c(1:3),
                             labels = c("male", "female", "unknown"))

casualties$c_sever <- factor(casualties$c_sever,
                             levels = c(1:3),
                             labels = c("fatal", "serious", "slight"))

casualties$c_loc <- factor(casualties$c_loc,
                             levels = c(1:11),
                             labels = c(NA, "ped xing", "in xing zigzag approach", 
                                        "in xing zigzag exit", "xing within 50m", 
                                        "crossing elsewhere", "footway or verge", 
                                        "refuge/island/reserv", "centre carriageway",
                                        "cway, not crossing", "unknown/other"))

casualties$c_move <- factor(casualties$c_move,
                             levels = c(1:10),
                             labels = c(NA, "crossing nearside", "crossing nearside behind static",
                                        "crossing offside", "crossing offside behind static",
                                        "cway stationary not crossing", "cway stationary not crossing masked",
                                        "walking cway facing", "walking cway back", "unknown/other"))

casualties$c_school <- factor(casualties$c_school,
                            levels = c(1,6:8),
                            labels = c(NA, "pupil school journey", "pupil other", "other"))

casualties$c_pcv <- factor(casualties$c_pcv,
                            levels = c(1:5),
                            labels = c(NA, "boarding", "alighting", "standing", "sitting"))

casualties$c_vtype <- factor(casualties$c_vtype,
                             levels = c(1:25), 
                             labels = c("Pedal cycle", "Motorcycle - moped", "No label 1", "Motorcycle (<125cc)", "Motorcycle (>=125cc)", 
                                        "Invalid vehicle/3-wheeler", "Car - hackney taxi", "Car", "Motor caravan", "No label2 ", 
                                        "No label3 ", "No label 4", "Tractor", "Other motor", "Goods <=3.5 tonnes", 
                                        "Goods >3.5 tonnes <7.5 tonnes", "Goods >=7.5 tonnes", "Car - taxi", "Minibus", 
                                        "Bus or coach", "Ridden horse", "Other non motor", "Motorcycle (size unknown)", 
                                        "Goods vehicles (weight unknown)", "Agri vehicle"))

write.csv(casualties, "casualties.csv", row.names=F)