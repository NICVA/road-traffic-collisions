# Import the dataset you want to decode as a dataframe 'collisions' 
# (e.g. collisions <- read.csv("C:/path/to/file/collision2015.csv"))

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

collisions$a_pedhum <- factor(collisions$a_pedhum, 
                             levels = c(1:3), 
                             labels = c("None within 50m", "Control by school crossing patrol", "Control by other authorised person"))

collisions$a_pedphys <- factor(collisions$a_pedphys, 
                             levels = c(1:2,9:12), 
                             labels = c("None within 50m", "Zebra crossing", "Central refuge - no control", "Footbridge or subway",
                                        "Pedestrian phase at traffic signal junction", "Non junction pedestrian light crossing"))

collisions$a_light <- factor(collisions$a_light, 
                             levels = c(1:7), 
                             labels = c("Daylight: street lights present", "Daylight: no street lighting", "Daylight: street lighting unknown",
                                        "Darkness: street lights present and lit", "Darkness: street lights present but unlit", "Darkness: no street lighting",
                                        "Darkness: street lighting unknown"))

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

write.csv(collisions, file.choose(), row.names=F) # Save the file as 'collisions2015.csv' for example
