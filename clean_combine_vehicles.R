setwd("C:/Documents/road-traffic-collisions/data-archive/vehicles")
# If you fork and clone the Github repo, set this to 
## wherever you have downloaded the RTC vehicle files

v_temp = list.files(pattern = "*.tab")
for (i in 1:length(v_temp)) assign(v_temp[i], read.delim(v_temp[i], stringsAsFactors = FALSE))

setwd("C:/Documents/road-traffic-collisions")
## Set the above to the forked repo folder

# From 2007, the sets have the additional column 'forreg', which isn't necessary
# for general analysis purposes, so remove column 17 and then bind rows
vehicles1 <- rbind(vehicle1998.tab, vehicle1999.tab, vehicle2000.tab, vehicle2001.tab, vehicle2002.tab, 
                   vehicle2003.tab, vehicle2004.tab, vehicle2005.tab, vehicle2006.tab, make.row.names = FALSE)
vehicles2 <- rbind(vehicle2007.tab, vehicle2008.tab, vehicle2009.tab, vehicle2010.tab, make.row.names = FALSE)
vehicles3 <- rbind(vehicle2011.tab, vehicle2012.tab, vehicle2013.tab, vehicle2014.tab, make.row.names = FALSE)
vehicles2 <- vehicles2[-17]
vehicles3 <- vehicles3[-17]

# The column names of one of these sets isn't matching the others
## colnames(vehicles1) == colnames(vehicles2)
## colnames(vehicles2) == colnames(vehicles3)

# Turns out vehicles3 (the sets from 2011 onwards) has driver age groupings
# (nominal, as value labels), while previous datasets had the age itself as
# integers. First, lets create the labels for those age groupings:
vehicles3$v_agegroup <- factor(vehicles3$v_agegroup, 
                               levels = c(1:9), 
                               labels = c("Under 10", "10-16", "17-24", "25-34", 
                                          "35-44", "45-54", "55-64", "65+", "Unknown"))

# Then change the column names so the rows can be combined
colnames(vehicles3) <- colnames(vehicles2)
print(paste("Are the column names matching?", colnames(vehicles2) == colnames(vehicles3)))

vehicles <- rbind(vehicles1, vehicles2, vehicles3)

# Sort out the other value:labels
vehicles$v_type <- factor(vehicles$v_type, 
                          levels = c(0:25), 
                          labels = c("Unknown", "Pedal cycle", "Motorcycle - moped", "No label 1", "Motorcycle (<125cc)", "Motorcycle (>=125cc)", 
                                     "Invalid vehicle/3-wheeler", "Car - hackney taxi", "Car", "Motor caravan", "No label2 ", 
                                     "No label3 ", "No label 4", "Tractor", "Other motor", "Goods <=3.5 tonnes", 
                                     "Goods >3.5 tonnes <7.5 tonnes", "Goods >=7.5 tonnes", "Car - taxi", "Minibus", 
                                     "Bus or coach", "Ridden horse", "Other non motor", "Motorcycle (size unknown)", 
                                     "Goods vehicles (weight unknown)", "Agri vehicle"))

vehicles$v_tow <- factor(vehicles$v_tow, 
                         levels = c(1:6), 
                         labels = c("No towing/artic", "Artic vehicle", "Double/multiple trailer",
                                    "Caravan", "Single trailer", "Other tow"))

vehicles$v_man <- factor(vehicles$v_man, 
                         levels = c(1:19), 
                         labels = c("Reversing", "Parking", "About to go", 
                                    "Slowing/stopping", "Moving off", "U-turn", 
                                    "Left turn", "Waiting to turn left", "Right turn", 
                                    "Waiting to turn right", "Change lane to left", 
                                    "Change lane to right", "Overtake moving offside", 
                                    "Overtake stationary offside", "Overtake nearside", 
                                    "Left-hand bend", "Right-hand bend", "Ahead other", "Other/not known"))

vehicles$v_loc <- factor(vehicles$v_loc, 
                         levels = c(1:13), 
                         labels = c("Leaving main road", 
                                    "Entering main road", "On main road", "On minor road", NA, "Lay-by/hard shoulder", 
                                    "Entering lay-by", "Leaving lay-by", "On cycle lane/way", "Pedestrian and vehicle shared precinct", 
                                    "Other public place", "Bus lane/way", "Footpath"))

vehicles$v_junc <- factor(vehicles$v_junc, 
                          levels = c(1:7), 
                          labels = c("Not at junction", 
                                     "Approaching/waiting/parked at junction", "Vehicle in middle junction", "Cleared junction or waiting/parked at exit", 
                                     "Did not impact", "Entering slip road", "Exiting slip road"))

vehicles$v_skid <- factor(vehicles$v_skid, 
                          levels = c(1:6), 
                          labels = c("No skid", 
                                     "Skidded", "Skidded and overturned", "Jack-knifed", "Jack-knifed and overturned", 
                                     "Overturned"))

vehicles$v_hit <- factor(vehicles$v_hit, 
                         levels = c(1:15), 
                         labels = c("None", "Previous collision", 
                                    "Roadworks", "Parked vehicle (lit)", "Parked vehicle (unlit)", "Bridge (roof)", 
                                    "Bridge side", "Bollard/refuge", "Open door", "Central island roundabout", "Kerb", 
                                    NA, "Other", "Animal except ridden horse", "Parked vehicle"))

vehicles$v_leave <- factor(vehicles$v_leave, 
                           levels = c(1:11), 
                           labels = c("None", 
                                      "Road sign/signal", "Lamp post", "Telegraph pole", "Tree/fence/boundary", "Bus stop", 
                                      "Central crash barrier", "Near/offside barrier", "Submerged in water", "Entered ditch", 
                                      "Other perm object"))

vehicles$v_hitoff <- factor(vehicles$v_hitoff, 
                            levels = c(1:11), 
                            labels = c("None", 
                                       "Road sign/signal", "Lamp post", "Telegraph pole", "Tree/fence/boundary", "Bus stop", 
                                       "Central crash barrier", "Near/offside barrier", "Submerged in water", "Entered ditch", 
                                       "Other perm object"))

vehicles$v_impact <- factor(vehicles$v_impact, 
                            levels = c(1:5), 
                            labels = c("Did not impact", 
                                       "Front", "Back", "Nearside", "Offside"))

vehicles$v_sex <- factor(vehicles$v_sex, 
                         levels = c(1:3), 
                         labels = c("Male", "Female", 
                                    "Unknown"))

vehicles$v_hitr <- factor(vehicles$v_hitr, 
                          levels = c(1:3), 
                          labels = c("Other", "Hit and run", 
                                     "Non-stop, not hit"))

write.csv(vehicles, "vehicles.csv", row.names=F)

rm(list=v_temp)
rm(vehicles1, vehicles2, vehicles3)