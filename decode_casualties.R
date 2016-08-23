# Import the dataset you want to decode as a dataframe 'casualties' 
# (e.g. casualties <- read.csv("C:/path/to/file/casualty2015.csv"))

casualties$c_agegroup <- factor(casualties$c_agegroup, 
                               levels = c(1:9), 
                               labels = c("under 10","10-16", "17-24", "25-34", "35-44", 
                                          "45-54", "55-64", "65+", "unknown"))


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
                             labels = c("not a pedestrian", "ped xing", "in xing zigzag approach", 
                                        "in xing zigzag exit", "xing within 50m", 
                                        "crossing elsewhere", "footway or verge", 
                                        "refuge/island/reserv", "centre carriageway",
                                        "cway, not crossing", "unknown/other"))

casualties$c_move <- factor(casualties$c_move,
                             levels = c(1:10),
                             labels = c("not a pedestrian", "crossing nearside", "crossing nearside behind static",
                                        "crossing offside", "crossing offside behind static",
                                        "cway stationary not crossing", "cway stationary not crossing masked",
                                        "walking cway facing", "walking cway back", "unknown/other"))

casualties$c_school <- factor(casualties$c_school,
                            levels = c(1,6:8),
                            labels = c(NA, "pupil other", "pupil school journey", "other"))

casualties$c_pcv <- factor(casualties$c_pcv,
                            levels = c(1:5),
                            labels = c("not a bus or coach passenger", "boarding", "alighting", "standing", "sitting"))

casualties$c_vtype <- factor(casualties$c_vtype,
                             levels = c(1:25), 
                             labels = c("pedal cycle", "motorcycle - moped", "no label 1", "motorcycle (<125cc)", "motorcycle (>=125cc)", 
                                        "invalid vehicle/3-wheeler", "car - hackney taxi", "car", "motor caravan", "no label2 ", 
                                        "no label3 ", "no label 4", "tractor", "other motor", "goods <=3.5 tonnes", 
                                        "goods >3.5 tonnes <7.5 tonnes", "goods >=7.5 tonnes", "car - taxi", "minibus", 
                                        "bus or coach", "ridden horse", "other non motor", "motorcycle (size unknown)", 
                                        "goods vehicles (weight unknown)", "agri vehicle"))

casualties$c_pedinj <- factor(casualties$c_pedinj,
                               levels = c(1:3),
                               labels = c("yes", "no", "not known"))

write.csv(casualties, file.choose(), row.names=F) # Save the file as 'casualties2015.csv' for example
