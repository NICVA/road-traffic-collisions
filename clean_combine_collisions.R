setwd("C:/Documents/road-traffic-collisions/data-archive/collisions") #
# If you fork and clone the Github repo, set this to 
## where you have downloaded the RTC collision files

c_temp = list.files(pattern = "*.tab")
for (i in 1:length(c_temp)) assign(c_temp[i], read.delim(c_temp[i], stringsAsFactors = FALSE))

setwd("C:/Documents/road-traffic-collisions")
## Set the above to the forked repo folder

# Apply the same binding process to the collision sets
collision1 <- rbind(collision1998.tab, collision1999.tab, collision2000.tab, collision2001.tab, collision2002.tab, 
                    collision2003.tab, collision2004.tab, collision2005.tab, collision2006.tab, make.row.names = FALSE)
collision2 <- collision2007.tab
collision3 <- rbind(collision2008.tab, collision2009.tab, collision2010.tab, collision2011.tab, 
                    collision2012.tab, collision2013.tab, collision2014.tab, make.row.names = FALSE)

collision1 <- collision1[-c(18:20)]
collision2 <- collision2[-c(18:23)]
collision3 <- collision3[-c(18:20)]

collisions <- rbind(collision1, collision2, collision3, make.row.names = FALSE)

collisions$a_type <- factor(collisions$a_type, 
                            levels = c(1:3), 
                            labels = c("Fatal", "Serious", "Slight"))

collisions$a_ctype <- factor(collisions$a_ctype, 
                             levels = c(1:14), 
                             labels = c("Roundabout", 
                                        "One way", "no3", "no4", "no5", "Single track", "Single carriageway 1 lane each way", 
                                        "Single carriageway 3 lanes", "Single carriageway 4 lanes", "Other/unknown", 
                                        "Dual carriageway", "Motorway", "Single carriageway", "Slip road"))

collisions$a_jdet <- factor(collisions$a_jdet, 
                            levels = c(1:12), 
                            labels = c("Not at or within 20m of junction", 
                                       "Roundabout", "Mini roundabout", "T junction", "Y junction", "Crossroads", "Staggered junction", 
                                       "Multiple junction", "Slip road", "Private entrance", "Other junction", "T or staggered junction"))

collisions$a_jcont <- factor(collisions$a_jcont, 
                             levels = c(1:7), 
                             labels = c("Not at junction", 
                                        "Authorised person", "Automatic traffic signal", "Stop sign", "Giveway sign/markings", 
                                        "Uncontrolled", "Give way or uncontrolled"))

collisions$a_weat <- factor(collisions$a_weat, 
                            levels = c(1:8), 
                            labels = c("Fine no high winds", 
                                       "Raining no high winds", "Snowing no high winds", "Fine with high winds", "Raining with high winds", 
                                       "Snowing with high winds", "Fog/mist hazard", "Strong sun (glare)"))

collisions$a_roadsc <- factor(collisions$a_roadsc, 
                              levels = c(1:10), 
                              labels = c("Dry", "Wet/damp", "Snow", "Frost/ice", 
                                         "Flood", "Oil", "Mud", "Leaves", 
                                         "Slippery (but dry)", "Other"))

collisions$a_speccs <- factor(collisions$a_speccs, 
                              levels = c(1:7), 
                              labels = c("None", "Auto traffic signal out", 
                                         "Auto traffic signal partial defect", 
                                         "Permanent road signing defective/obscured", 
                                         "Road works", "Road surface defective", 
                                         "Railing level crossing"))

collisions$a_chaz <- factor(collisions$a_chaz, 
                            levels = c(1:9), 
                            labels = c("None", "Dislodged vehicle load in road", 
                                       "Other object in road", "Previous collision", 
                                       "Dog in road", "Other animal in road", "Smoke, dust etc", "Any animal except ridden horse", 
                                       "Pedestrian in road - not injured"))

collisions$a_scene <- factor(collisions$a_scene, 
                             levels = c(1, 2), 
                             labels = c("Yes", "No"))

rm(list=c_temp)
rm(collision1, collision2, collision3)

write.csv(collisions, "collisions.csv", row.names=F)