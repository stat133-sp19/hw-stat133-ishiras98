##Title: Data Preparation
##Description: The purpose of this script is to prepare shots data from provided NBA data 
##Input: shots_data
##Output: cleaned up shots_data (csv file)

iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
iguodala$name = "Andre Iguodala"

green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
green$name = "Draymond Green"

durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
durant$name = "Kevin Durant"

thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
thompson$name = "Klay Thompson"

curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
curry$name = "Stephen Curry"

curry$shot_made_flag[curry$shot_made_flag == 'n'] = 'shot_no'
curry$shot_made_flag[curry$shot_made_flag == 'y'] = 'shot_yes'

green$shot_made_flag[green$shot_made_flag == 'n'] = 'shot_no'
green$shot_made_flag[green$shot_made_flag == 'y'] = 'shot_yes'

durant$shot_made_flag[durant$shot_made_flag == 'n'] = 'shot_no'
durant$shot_made_flag[durant$shot_made_flag == 'y'] = 'shot_yes'

thompson$shot_made_flag[thompson$shot_made_flag == 'n'] = 'shot_no'
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] = 'shot_yes'

iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] = 'shot_no'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] = 'shot_yes'


curry$minute = (curry$period * 12) - (curry$minutes_remaining)
green$minute = (green$period * 12) - (green$minutes_remaining)
durant$minute = (durant$period * 12) - (durant$minutes_remaining)
thompson$minute = (thompson$period * 12) - (thompson$minutes_remaining)
iguodala$minute = (iguodala$period * 12) - (iguodala$minutes_remaining)

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

binded_df = rbind(iguodala, green, durant, thompson, curry)
binded_df

write.csv(
  x = binded_df,
  file = '../data/shots-data.csv')

sink(file = '../output/shots-data-summary.txt')
summary(binded_df)
sink()

