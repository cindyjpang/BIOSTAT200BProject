rise_dat <- read.csv("data/rise.csv")

value_mapping <- c("Lumpectomy" = 1, "Mastectomy" = 2)

rise_dat$SURGTYPE_ENROLLMENT_BINARY[rise_dat$SURGTYPE_ENROLLMENT_BINARY == ""] <- NA

rise_numerics <- data.frame(ID = rise_dat$ID, 
                            
                            # outcome var
                            CESD_BL = rise_dat$CESD_BL, 
                            
                            # demographic chars
                            AGE_BL = rise_dat$AGE_BL,
                            RACE5 = rise_dat$RACE5, 
                            INCOME3 = as.numeric(sub("^([0-9]+).*", "\\1", rise_dat$INCOME3)), 
                            EDUC3 = as.numeric(sub("\\D+", "", rise_dat$EDUC3)), 
                            EMPLOY3 = as.numeric(sub("\\D+", "", rise_dat$EMPLOY3)),
                            MARRIED2 = rise_dat$MARRIED2, 
                            
                            # disease and treatment related vars
                            STAGEDX_PG = rise_dat$STAGEDX_PG, 
                            SURGTYPE_ENROLLMENT_BINARY = ifelse(is.na(rise_dat$SURGTYPE_ENROLLMENT_BINARY), 0, value_mapping[rise_dat$SURGTYPE_ENROLLMENT_BINARY]),
                            
                            # biobehavioral risk factors
                            BMI_BL = rise_dat$BMI_BL, 
                            CHARLSON = rise_dat$CHARLSON, 
                            CTQ_WALKER_CAT_BL = as.numeric(sub("\\D+", "", rise_dat$CTQ_WALKER_CAT_BL)),
                            SCID_PHMDD = rise_dat$SCID_PHMDD,
                            GODIN2 = rise_dat$GODIN2, 
                            ALC_DRINKS_PAST_YEAR = rise_dat$ALC_DRINKS_PAST_YEAR)

write.csv(rise_numerics, "data/rise_numerics.csv")
                                                        
