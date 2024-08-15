#1a

load(house_prices)
library(ggplot2)
head(house_prices)

ggplot(house_prices, aes(x=date, y = house_price_index, group = state))+
  geom_line() + facet_wrap(~ state, ncol = 3, scales = "free_y")+
  scale_x_continuous(breaks = c(1980, 2000, 2020), labels = c("80", "00", "20"))+
  labs(x = "Year", y = "House Price Index", title = "House Price Trend by state")+
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 10))

#1b
library(tidyr)
house_reshaped <- house_prices %>%
  gather(key = "measure", value = "value" , house_price_index, unemploy_perc,
         -date, -state)
head(house_reshaped)

#1c

ggplot(house_reshaped) + geom_line(aes(x=date, y=value, color=measure, group=measure))
+ xlab('year') + ylab('value')
facet_wrap(~state, ncol = 3, scales = "free_y")+
  scale_x_continuous(breaks = c(1980, 2000, 2020), labels = c("80","00","20"))+
  labs(x = "Year", y = "House Price Index", title = "House Price Trend by state")+
  theme_minimal()+
  theme(axis.title.x = element_text(angle = 45, hjust = 1))+
  scale_color_manual(values = c( "blue", "red"), labels = c("House Price Index", "unemployment %"))
ggplot(data=flights)+ geom_line(aes(x=year, y= month)) + xlab('year') + ylab('Passengers')

#do not seem to flow well



