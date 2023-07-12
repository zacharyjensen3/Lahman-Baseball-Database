install.packages("Lahman")
library("Lahman")



head(People)
head(AllstarFull)
head(AwardsPlayers)

subset(AllstarFull, teamID == "SEA")

People[People$playerID == "murraed02", c("nameFirst", "nameLast")]
#What to use to convert player Ids to Real Names

subset(AwardsPlayers, awardID == "Triple Crown")

mvp <- subset(AwardsPlayers, awardID == "Most Valuable Player")
print(mvp)

MVPcount <- table(mvp$playerID)
MVPcount[MVPcount >= 1]


tallest <- subset(People, height >= 82)
print(tallest)

People[People$height >= 82, c("nameFirst", "nameLast")]

head(Appearances)

Appearances %>%
select(playerID, G_c:G_rf) %>%
rename(C = G_c, `1B` = G_1b, `2B` = G_2b, SS = G_ss,
`3B` = G_3b, LF = G_lf, CF = G_cf, RF = G_rf) %>%
gather(pos, G, C:RF) %>%
group_by(pos, playerID) %>%
summarise(G = sum(G)) %>%
arrange(desc(G)) %>%
do(head(., 1))
#Players with the most appeareances in each position.
 

totalHR <- Batting %>%
group_by(yearID) %>%
summarise(HomeRuns = sum(as.numeric(HR), na.rm=TRUE),
Games = sum(as.numeric(G), na.rm=TRUE))
#Function to determine homeruns per season   
   
ggplot(totalHR, aes(x = yearID, y = HomeRuns)) +
geom_point() +
geom_path() +
geom_smooth() +
labs(x = "Year", y = "Home runs hit")
   
   
   
   
   
   
   
   
   
   
   
 