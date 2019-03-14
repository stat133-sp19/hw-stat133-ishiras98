##Title: Data Analysis and Visualization
##Description: The purpose of this script is to make plots of the prepared shots data  
##Input: cleaned_shots_data
##Output: shots_charts (in png and pdf)

library(jpeg)
library(grid)
library(ggplot2)

# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"

# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

binded = read.csv('../data/shots-data.csv', stringsAsFactors = FALSE)

curry = binded[binded$name == 'Stephen Curry', ]
iguodala = binded[binded$name == 'Andre Iguodala', ]
durant = binded[binded$name == 'Kevin Durant', ]
green = binded[binded$name == 'Draymond Green', ]
thompson = binded[binded$name == 'Klay Thompson', ]

# Stephen Curry shot chart
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
ggsave ('../images/stephen-curry-shot-chart.pdf', plot = curry_shot_chart, width = 6.5, height = 5)

#Andre Iguodala shot chart

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
ggsave ('../images/andre-iguodala-shot-chart.pdf', plot = iguodala_shot_chart, width = 6.5, height = 5)

# Kevin Durant shot chart

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
ggsave ('../images/kevin-durant-shot-chart.pdf', plot = durant_shot_chart, width = 6.5, height = 5)

# Draymond Green shot chart

green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
ggsave ('../images/draymond-green-shot-chart.pdf', plot = green_shot_chart, width = 6.5, height = 5)

# Klay Thompson shot chart

thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
ggsave ('../images/klay-thompson-shot-chart.pdf', plot = thompson_shot_chart, width = 6.5, height = 5)

# Faceted Shot Charts 

all_data_shot_chart = ggplot(data = binded) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal() + facet_wrap(~ name)
ggsave ('../images/gsw-shot-charts.pdf', plot = all_data_shot_chart, width = 8, height = 7)
ggsave ('../images/gsw-shot-charts.png', plot = all_data_shot_chart, width = 8, height = 7)


