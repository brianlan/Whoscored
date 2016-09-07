library(ggplot2)
library(RSQLite)
library(dplyr)

setwd('/Users/brianlan/Work/Whoscored/')
conn <- dbConnect(dbDriver("SQLite"), dbname="whoscored.db")

df<-dbGetQuery(conn, 
               "select * from player_stats;")

df %>% filter(league_name == 'Premier League')

# attack score

# defense score

# 

ggplot(df, aes(x=pass_per_match,y=def_per_match,group=pos_cur_match,colour=pos_cur_match)) + 
  geom_point(aes(size=num_presents),alpha=0.5,colour='black') + 
  geom_line() + 
  geom_text(data = df,aes(x=pass_per_match,y=def_per_match + 0.1, label=season, size=num_presents)) + 
  facet_wrap(~player_name)

dbDisconnect(conn)
