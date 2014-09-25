require(downloader)

### Load data
# Load reference profiles and samples
download("https://www.dropbox.com/s/5spahf44lea9sdo/Lab_reference_data.zip?dl=0", "../data/Lab_reference_data.zip", mode="wb")
unzip("../data/Lab_reference_data.zip", exdir="../data", overwrite=T)
prof <- read.table("../data/Profiles.csv",  header=T, sep=",")
prof <- na.omit(prof)
samp <- read.table("../data/Samples.csv", header=T, sep=",")
samp_prof <- merge(samp, prof, by="PID")
samp_prof_top <- samp_prof[samp_prof$Depth=="Topsoil", ]
samp_prof_bot <- samp_prof[samp_prof$Depth=="Subsoil", ]


isric <- read.table("../data/AfSIS_Sentinel_Site.csv", sep=",", header=T)
comparison_top <- merge(samp_prof_top, isric, by="ICRAFPID")
comparison_bot <- merge(samp_prof_bot, isric, by="ICRAFPID")



