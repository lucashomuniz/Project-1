# ✅ PROJECT-1

The goal of this project is to handle data from seven distinct sources. The primary objective is to analyse, clean, organize, and merge the data, resulting on the development of an analytical dashboard web application. The focus is to comprehend the correlation between Netflix's revenues, GDP and indicators of social inequality in the countries where Netflix operates, encompassing various other analyses. Of the seven Originals Datasets, six will be attached, however one of them will need to be downloaded "title.basics.tsv.gz" from https://datasets.imdbws.com, then rename it to "dados_IMDB.tsv". This last file has approximately 9.9 Millions lines. It is important to remember that all data used in this project are completely real, based on a period from June/2021 to March/2022.

Originals Datasets: dados_IMDB.tsv, assinantes_netflix_jul_2021, dados_desigualdade_salarial_harvard, dados_netflix_Dec_2021, dados_world_bank, top_10_shows_netflix, wikipedia-iso-country-codes

Cleaned Datasets: dataset1.csv, dataset2.csv, dataset3.csv, dataset4.csv, dataset5.csv, dataset6.csv

Keywords:  R Language, Big Data, Data Analysis, Web App, Shiny Library, GDP, Social Inequality, Revenue, Growth, Netflix.

# PROCESS

It is basically a WebApp (Interactive Dashboards), developed in R language with the help of the Shiny library.

In the "Overview" part we have scatterplots based on six variables.

![Screenshot 2023-06-10 at 14 21 38](https://github.com/lucashomuniz/Project-1/assets/123151332/9bf615ea-ee2b-4f41-996c-8e5293c6af6e)

The First Variable represents Netflix Revenue in the year 2021 based on GDP (USD). As the GDP of the country where Netflix is present increases, revenue also increases. In theory it is totally predictable, however, the predictable also needs to be explained. It is important to remember that it is not enough to catalog a statement as predictable or obvious, it is strictly necessary to develop the analysis to validate the statement. 

Sequentially, that a small button was developed, which represents the addition of Outliers within the chart. It was chosen to insert it as an optional item due to the fact that it will be up to the user to use this information or not. With that, when we analyze the Outliers, it is seen that the United States of America has absurd numbers, incredibly high, completely fleeing the pattern of other countries. In this case, the Outlier is not necessarily a problem or an error. This is totally valid data, without any kind of problem, but because it is an incredibly high value, it tends to affect the analysis of other countries.

The Second Variable represents the number of Netflix Subscriptions in the year 2021. Similar to the previous one, as the country's GDP increases, the number of subscriptions also increases.

The Third Variable is Total Catalog Size. It is possible to see that there is no relationship with the country's GDP. Countries with a high number of films and series in the catalog do not necessarily have a high GDP.

The Fourth, Fifth and Sixth Variable are Basic, Standard and Premium Subscription Pricing. Similar to the previous variable, they do not show a direct relationship with GDP.

In the "Wage Inequality" section, we have a bar chart based on the comparison between Social Inequality and the Difference in Prices for Basic, Standard and Premium Subscriptions. With this, we can analyze that there is not a very high disparity between these variables.

![Screenshot 2023-06-10 at 14 22 25](https://github.com/lucashomuniz/Project-1/assets/123151332/449770c5-46b0-41b1-bd93-39fc25293c62)

In the "Popular Genres" part we have a tree-map chart. This section of the WebApp, as the name implies, shows the main movie genres in each country. In Brazil, for example, the genres of Drama/Comedy/Adventure/Action are the main ones chosen by the audience.

![Screenshot 2023-06-10 at 14 22 41](https://github.com/lucashomuniz/Project-1/assets/123151332/7281224b-8cc2-4742-9ca1-87fffa4532d3)

In the last part, we have "Netlfix Subscribers". Which shows a global map associated with a color map, illustrating how the Revenue and Subscription variables behave in each country on the planet. Finally, we have a last scatter plot illustrating the relationship between Revenue and Subscriptions, where it is. possible to identify a positive relationship. As the number of new subscribers increases, the total billing value also increases.

![Screenshot 2023-06-10 at 14 22 45](https://github.com/lucashomuniz/Project-1/assets/123151332/4918d85f-3f96-4d82-9147-4ca7ee60024f)

As a final result, the WebApp allows you to perform an analysis quickly, usefully and professionally. Fully fulfilling its purpose. In this way, you can make decisions based on data.

# DATASETS SOURCES:

Netflix Data: https://www.comparitech.com/blog/vpn-privacy/countries-netflix-cost/

GDP Data: https://data.worldbank.org/indicator/

Wage Inequality Dataset: https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/LM4OWF

Top 10 Netflix: https://top10.netflix.com/

Netflix Subscriber Data: https://www.comparitech.com/tv-streaming/netflix-subscribers/

Country Code Data: https://www.kaggle.com/andradaolteanu/iso-country-codes-global
