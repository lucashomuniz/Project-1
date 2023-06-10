"
==============================
LOAD SCRIPT AND DATA CLEANING
==============================
"
# Carrega os pacotes
library(dplyr)
library(tidyr)
library(readxl)
library(readr)

"
=============
DATA LOADING
=============
"
# Loading data from Netflix
dados_netflix <- read.csv("datasets_originais/dados_netflix_Dec_2021.csv")
View(dados_netflix)

# Loading data from World Bank
dados_pib <- read.csv("datasets_originais/dados_world_bank.csv", header = FALSE)
View(dados_pib)

# Loading the wage inequality data
dados_salario <- read.csv("datasets_originais/dados_desigualdade_salarial_harvard.csv")
View(dados_salario)

# Loading data from IMDB
dados_IMDB <- read_tsv("datasets_originais/dados_imdb.tsv")
View(dados_IMDB)

# Loading Data for Top 10 Netflix Shows by Country
dados_top10 <- read_excel("datasets_originais/top_10_shows_netflix.xlsx")
View(dados_top10)

# Loading data from Netflix subscribers in July/2021
dados_sub <- read.csv("datasets_originais/assinantes_netflix_jul_2021.csv")
View(dados_sub)

# Loading country ISO code data
countrycode <- read.csv("datasets_originais/wikipedia-iso-country-codes.csv")
View(countrycode)

"
===================================================
LIMPEZA E PREPARAÇÃO DO PRIMEIRO DATASET COMBINADO
===================================================
"
# Create a column with the difference data for the bar chart (standard plan - basic plan)
dados_netflix$basic_standard_diff = (dados_netflix$Cost.Per.Month...Standard.... - dados_netflix$Cost.Per.Month...Basic....)

# Create a column with the data difference for the bar chart (premium plan - standard plan)
dados_netflix$standard_premium_diff = (dados_netflix$Cost.Per.Month...Premium.... - dados_netflix$Cost.Per.Month...Standard....)

# Combine the previous data with GDP data (Based on the columns that have the Countries)
names(dados_pib)[names(dados_pib) == 'V1'] <- 'Country'
dados_netflix_pib <- merge(dados_netflix, dados_pib, by = "Country")

# Extracts the 2020 GDP from the "data_netflix_pib" table and generates the "data_netflix_pib2020" table with only the 2020 GDP
dados_netflix_pib2020 <- dados_netflix_pib[-c(11:72, 74, 75)] 
names(dados_netflix_pib2020)[names(dados_netflix_pib2020) == 'V64'] <- "2020 GDP (World Bank)"

# Cleanup of wage inequality dataframe. Simply stating that all NA values are removed. Also deleted most unnecessary columns
dados_salario <- dados_salario[, c(1:3)]
dados_salario_ano <- dados_salario %>% group_by(country) %>% summarise(max = max(year, na.rm = TRUE))
View(dados_salario)

# Combines the dataframes, generating a new dataframe with the information of "data_netflix_pib2020" added with the columns of "Year" and "gini_disp"
dados_salario <- merge(dados_salario, dados_salario_ano, by.x = c("country", "year"), by.y = c("country", "max"))
dados_netflix_pib_salario2020 <- merge(dados_netflix_pib2020, dados_salario, by.x=c("Country"), by.y=c("country"))

# Clears the billing and subscription dataset and combines it with the previous dataframe "data_netflix_pib_salario2020", leaving only the billing and subscription of (Q4.2021)
dados_sub <- dados_sub[,c(1, 23,24)]
complete <- merge(dados_netflix_pib_salario2020, dados_sub, by=c("Country"))

# Merge the countrycode into the choropleth map. It took the column "Alpha.3.code" from the "countrycode" and transferred it to the dataframe (complete) from the column of countrynames
countrycode <- countrycode[,c(1, 3)]
complete <- merge(complete, countrycode, by.x=c("Country"), by.y=c("English.short.name.lower.case"))
View(complete)

# In summary, the 1st step was focused on selecting the 16 main columns among the 7 dataframes, so that with that I could create a new dataframe called "Complete"
write.csv(complete, "datasets_limpos/dataset1.csv", row.names = FALSE)

"
=========================================================
CLEANING AND PREPARATION OF THE SECOND COMBINED DATA SET
=========================================================
"
# Clear and filter the IMDB dataframe. Deleting the unnecessary columns and leaving only the ones we will use "titleType", "primaryTitle = show_title", "genres".
genero <- dados_IMDB[,-c(1, 4:8)]
View(genero)
names(genero)[names(genero) == 'primaryTitle'] <- 'show_title'
View(genero)

# Associate the "genre" dataframe with the Top 10 shows from the "top10_dataframe" based on the "show_title" column that both dataframes have.
topgenero <- merge(dados_top10, genero, by = "show_title")
View(topgenero)

# Clears the previous dataframe to keep only 1 entry for each top 10. Correcting the different naming they have (Movies = Movie), (TV = tvSeries)
topgenero <- topgenero[(topgenero$category == "Films" & topgenero$titleType == "movie") | (topgenero$category == "TV" & topgenero$titleType == "tvSeries"), ] 
topgenero <- distinct(topgenero, show_title, week, country_name, category, titleType,cumulative_weeks_in_top_10, .keep_all= TRUE)
View(topgenero)

# Keep only movie genre information by country. Keeping only the "country_names" and "genres" columns
topgeneropaises <- topgenero[,-c(1, 3:9)]
View(topgeneropaises)

# Pivot the dataframe. Creating a new column, in which it isolates only one genus at a time. (genres = Drama, Romance .:. genres = Drama, genres = Romance)
topgeneropaises <- separate(topgeneropaises, c("genres") , c("genero1", "genero2", "genero3"), sep = ",")
topgeneropaises <- pivot_longer(topgeneropaises, c("genero1", "genero2", "genero3"), names_to = "genero123", values_to = "genres")
View(topgeneropaises)

# Count the number of genres. Erasing the NA values. Summing the genres by total amount. Finalized the dataframe with "country_name", "genre" and "quantity"
generocount <- count(topgeneropaises, country_name, genres)
generocount <- na.omit(generocount)
generocount <-subset(generocount, genres!="\\N")
generocount$n <- as.numeric(generocount$n)
View(generocount)

# In summary, the 2nd stage focused on selecting 3 columns from the dataframe "data_IMDB, formatting them, creating a new df "generecount" aimed at the number of genres in each country
write.csv(generocount, "datasets_limpos/dataset2.csv", row.names = FALSE)

"
=======================================================
CLEANING AND PREPARATION OF THE THIRD COMBINED DATASET
=======================================================
"
# Rename the previous dataframe. In order to keep it intact, working on top of a copy.
sunburst <- rename(generocount, label = country_name)

# Remove the dashes. In order to prepare the dataframe for the next step
sunburst$genres = sub("-", " ", sunburst$genres)

# Set the name. In order to create in the next step a new column with only the totals. Creating two columns "parent" and "id".
sunburst$parent = c("total  - ")
sunburst$parent <- paste(sunburst$parent, sunburst$genres)
sunburst$id = c(" - ")
sunburst$id <- paste(sunburst$parent, sunburst$id)
sunburst$id <- paste(sunburst$id, sunburst$label)
sunburst$n <- as.numeric(sunburst$n)
View(sunburst)

# Hierarchy Aggregation. Converting to numerical values. Excluding the country column and making the global sum of each genre (label) and its respective quantity.
added <- aggregate(sunburst$n, list(sunburst$genres), FUN=sum)
added <- rename(added, label = Group.1)
added <- rename(added, n = x)
added$n <- as.numeric(added$n)
added$genres <- c(NA)
added$parent <- c("total")
added$id <- c(" - ")
added$id <- paste(added$parent, added$id)
added$id <- paste(added$id, added$label)
View(added)

# Calculate sum total of all movies of all genres
total = sum(added$n)
total

# Combine everything into the final dataframe including the countries again. Completing the Hierarchy Total > Genres > Total Genre Country
sunburst <- rbind(added, sunburst)
sunburst <- rbind(c("total", total, NA, NA, "total"), sunburst)
sunburst <- sunburst[,-c(3)]
sunburst$n <- as.numeric(sunburst$n)
View(sunburst)

# Save to disk
write.csv(sunburst, "datasets_limpos/dataset3.csv", row.names = FALSE)

"
======================================================
CLEANING AND PREPARATION OF THE COMBINED DATASET ROOM
======================================================
"
# Let's work with top 10 to avoid performance issues in graphics
top10sunburst <- sunburst[-c(1:28),]
top10sunburst$n <- as.numeric(top10sunburst$n)
View(top10sunburst)

# Top 10 genres by country
top10sunburst <- top10sunburst %>% group_by(label) %>% top_n(10,n)
View(top10sunburst)

# Recalculates the totals, adjusts and combines. Based on the top10 filter, it reduced the total from 131,497 movies to 117,551 movies. Getting similar to the original "sunburst" df.
top10add <- aggregate(top10sunburst$n, list(top10sunburst$parent), FUN = sum)
top10add <- rename(top10add, id = Group.1)
top10add <- rename(top10add, n = x)
top10add$label = sub("total  -  ", "", top10add$id)
top10add$parent = c("total")
top10add$n <- as.numeric(top10add$n)
total = sum(top10add$n)
top10sunburst <- rbind(top10add, top10sunburst)
top10sunburst <- rbind(c("total", total, NA, NA, "total"), top10sunburst)
top10sunburst$n <- as.numeric(top10sunburst$n)
View(top10sunburst)

# Save to disk
write.csv(top10sunburst, "datasets_limpos/dataset4.csv", row.names = FALSE)

"
========================================================
CLEANING AND PREPARATION OF THE FIFTH COMBINED DATA SET
========================================================
"
# Filter the previous dataframe and create a new one
nototal <- sunburst[-c(1),]
nototal$parent = sub("total  -  ", "", nototal$parent)
nototal$parent = sub("total", NA, nototal$parent)
nototal$id = sub("total  -  ", "", nototal$id)
View(nototal)

# Save to disk
write.csv(nototal, "datasets_limpos/dataset5.csv", row.names = FALSE)

"
========================================================
CLEANING AND PREPARATION OF THE SIXTH COMBINED DATA SET
========================================================
"
# Filter the previous dataframe and create a new one
countrytree <- nototal[-c(1:28),]
countrytree <- rename(countrytree, parents = label)
countrytree <- rename(countrytree, labels = parent)
countrytree$id = c(" - ")
countrytree$id <- paste(countrytree$parent, countrytree$id)
countrytree$id <- paste(countrytree$id, countrytree$label)
countries <- aggregate(countrytree$n, list(countrytree$parents), FUN = sum)
countries <- rename(countries, labels = Group.1)
countries <- rename(countries, n = x)
countries$n <- as.numeric(countries$n)
countries$id <- countries$label
countries$parents <- c(NA)
countrytree <- rbind(countrytree, countries)
View(countrytree)

# Save to disk
write.csv(countrytree, "datasets_limpos/dataset6.csv", row.names = FALSE)
