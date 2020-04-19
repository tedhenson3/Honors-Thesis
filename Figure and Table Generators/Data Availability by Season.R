# ggplot(boxplots, aes(y = ws, x = group)) + 
#   geom_boxplot(aes(group = group),
#                colour = 'skyblue') + 
#   theme_bw() + 
#   facet_grid(rows = vars(Season)) + ggtitle('WS by Amount of Data')


# ggplot(data, aes(y = ws)) + 
#   geom_violin(aes(x = group),
#               colour = 'skyblue') + 
#   theme_bw() + 
#   facet_grid(rows = vars(Season)) + 
#   ggtitle('WS by Amount of Data')


#### Data Availability by Season ####
group.freq = unique(data.for.graph[, c('Season', 'group', 'group.num')])
colnames(group.freq) = c('Season', 'Partition', 'Freq')
group.freq = group.freq[order(-group.freq$Freq),]



data.by.season = ggplot(group.freq, aes(Partition,  Freq)) + 
  geom_bar(stat = 'identity',
           fill = 'skyblue') + 
  theme_bw() + theme(panel.grid.major.x = element_blank(),
                     panel.grid.minor.y = element_blank()) + 
  facet_grid(rows = vars(Season)) + 
  ggtitle('Data Availability by Season') + 
  ylab('Number of Players') + 
  xlab('')

group.freq  = spread(group.freq, Partition , Freq)

group.freq[is.na(group.freq)] = 0

library(pander)

#### End ####