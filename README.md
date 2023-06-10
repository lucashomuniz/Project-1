✅ PROJECT-1

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INTRO:

The goal of this project is to handle data from seven distinct sources. The primary objective is to analyse, clean, organize, and merge the data, resulting on the development of an analytical dashboard web application. The focus is to comprehend the correlation between Netflix's revenues, GDP and indicators of social inequality in the countries where Netflix operates, encompassing various other analyses. Of the seven datasets, six will be attached, however one of them will need to be downloaded "title.basics.tsv.gz" from https://datasets.imdbws.com, then rename it to "dados_IMDB.tsv".

Originals Datasets: dados_IMDB.tsv, assinantes_netflix_jul_2021, dados_desigualdade_salarial_harvard, dados_netflix_Dec_2021, dados_world_bank, top_10_shows_netflix, 

Importante lembrar que todos os dados utilizados nesse projeto são totalmente reais, com base em um período de Junho/2021 a Março/2022.

Keywords:  R Language, Big Data, Data Analysis, Web App, Shiny Library, GDP, Social Inequality, Billing, Growth, Netflix.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CONCLUSION:

Trata-se basicamente de uma WebApp (Dashboards Interativos), desenvolvida em linguagem R com ajuda da biblioteca Shiny.

Na parte de "Visão Geral" temos gráficos de dispersão com base em seis variáveis.

A primeira variável, repreesenta o Faturamento da Netflix no ano de 2021 com base no PIB (USD). A medida que o PIB do pais onde a Netflix está presente aumenta, o faturamento também aumenta. Em teoria é algo totalmente previsível, entretanto, o previsível também necessita ser explicado. Importante lembrar que não basta catalogar uma afirmação como previsível ou obvia, é extritamente necessário desenvolver a análise para validar a afirmação.

A segunda variável, representa a quantidade de Assinaturas da Netflix no ano de 2021. De forma semelhante à anterior conforme o PIB do país aumenta, a quantidade de assinaturas também aumenta. 

A terceira variável é o Tamanho Total do Catálogo. É possível ver que não existe nenhuma relaçào com o PIB do país. Os paises com alta quantidade de filmes e séries no catálogo não apresentam necessariamente um alto PIB.

A quarta, quinta e sexta variável são os Precos de Assinaturas Basic, Standard e Premium. Semelhante à variável anterior, eles não apresentam uma relação direta com o PIB.

Na parte de "Desigualdade Salarial" temos um gráfico de barras com base na comparação entre a Desigualdade Social e a Diferença nos Preços da Assinatura Basic, Standard e Premium. Com isso podemos analiasr que não há uma disparidade muito elevada entre essas variáveis. 

Na parte de Gêneros Populares temos um gráfico de tree-map. Essa seção da WebApp, como o próprio nome diz, mostra os principais gêneros de Filmes em cada país. No Brazil por exemplo, os gêneros de Drama/Comédia/Aventura/Ação são os principais escolhidos pela audiência.

Na última parte, temos "Assinantes Netlfix". O qual mostra um mapa global associado a um mapa de cores, ilustrando como as variáveis de Faturamento e Assinaturas Se comportam em cada país do planeta. Por fim temos um último gráfico de dispersão ilustrando a relação entre Faturamento e Assinaturas, onde é. possível identificar uma relação positiva. Na medidade que se aumenta a quantidade novos assinantes o valor do faturamento total também aumenta.

Importante ressaltar que foi desenvolvido um pequeno botão, o qual representa a adição dos Outliers dentro do gráfico. Foi optado por inseri-lo como um item optativo pelo fato de que ficará a cargo do usuário usar essa informação ou não. Com isso, ao analisar os Outliers, é visto que os Estados Unidos da America possui números absurdos, incrivelmente altos, fugindo completamente do padrão de outros países. Nesse caso, o Outlier não é necessariamente um problema ou um erro. Trata-se de um dado totalmente válido, sem nenhum tipo de problema, porém por ser um valor incrivelmente alto, isso tende a afetar a análise dos outros países.

Como resultado final, a WebApp permite realizar uma análise de forma rápida, útil e profissional. Cumprindo totalmente seu propósito. Dessa forma, é possível tomar decisões com base em dados.





