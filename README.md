# ✅ PROJECT-10

In this project, a renowned toy store, sought to modernize its **Business Analytics** platform to capitalize on the upcoming **Children's Day** and drive **sales growth**. The **Commercial Manager** requested an **interactive dashboard** to evaluate the store's performance and support **data-driven strategies** based on historical data. Our approach began by integrating data directly from **Super Brinquedos' ERP system** through database queries, exporting the results as **CSV files**. These datasets provided essential information, including **product details**, **salesperson data**, and **sales transaction history**, forming the foundation for the dashboard prototype.

The primary objective was to design a user-friendly, **data-rich dashboard** that met the requirements outlined in the project scope. We leveraged our expertise in **data visualization** to propose optimized charts and layouts for actionable analysis. Additionally, we explored integrating external data sources to uncover **new insights**, such as correlations between **product performance** and **seasonality**, opportunities for **cross-selling** and **up-selling**, and emerging **consumer behavior trends**. The resulting dashboard equips **Super Brinquedos** with a **competitive advantage**, enabling the company to respond quickly to **market dynamics** and **customer needs**, ensuring agile and informed decision-making.

**Keywords**: PowerBI, PowerQuery, DAX, Google Cloud Plataform, Business Analytics, Python Language, Data Visualization, Data Analysis.

# ✅ PROCESS

In this project, we adopted a **comprehensive, multidisciplinary approach** to address the proposed challenges. Using the **Python** programming language and the **Pandas library**, we conducted the initial **data analysis**, enabling complex **data manipulation** and **processing**. This allowed us to integrate datasets such as **dim_produto** (product data), **dim_vendas** (sales), and **fato_vendas** (transactions), which were critical to understanding **Super Brinquedos'** operational scenario.

To enhance the analysis, we utilized **Excel**, leveraging its robust **data manipulation** and **visualization capabilities** to explore the characteristics of variables in detail. This approach helped identify **patterns**, **trends**, and potential **relationships** within the data, adding depth to the insights generated.

The processed datasets were then imported into **Power BI**, where we created **interactive dashboards** to visualize and explore insights dynamically. By utilizing **DAX** and **M languages**, we developed **custom measures** and **calculations** tailored to meet **Super Brinquedos' analytical needs**, providing actionable and comprehensive insights.

Throughout the project, we adopted an **iterative and collaborative approach**, involving the **Super Brinquedos team** in each phase to ensure the solutions aligned with the company's **objectives** and **specific needs**. This combination of **data analysis**, **spreadsheet manipulation**, and **interactive visualization** resulted in customized, action-oriented solutions designed to empower **Super Brinquedos** with informed decision-making capabilities and a competitive edge in the **toy market**.

# ✅ CONCLUSION

The initial analysis focused on identifying the **top-selling products**, using the variables **valor_total** and **dim_produto_id**. The results revealed that the three main products are **items 26, 77, and 92**. However, when analyzing the **quantidade** variable, we observed that while **product 26** leads in total sales value, its **quantity sold** is nearly **19% lower** than that of **product 77**. This indicates that **product 26** likely has a **higher unit profit margin** compared to **product 77**. Specifically, **product 26** has a profit margin of **50.51%**, slightly higher than **product 77's** margin of **50.13%**. This difference could theoretically compensate for the lower sales volume of **product 26**. These findings highlight that a product's status as a sales leader may not solely depend on **sales volume**, but also on factors such as **profit margin**, **unit price**, **specific demand**, **product lifecycle**, and **marketing strategies**. This underscores the importance of evaluating multiple metrics to gain a holistic view of **product performance**.

![Screen-Recording-2025-03-11-at-15 08 01](https://github.com/user-attachments/assets/74edf943-c651-4a37-8c40-40be9cb3d9e4)

The second analysis focused on identifying **products with the best and worst profit margins**. Using a specific **mathematical formula**, we calculated this new variable and identified the **top three products with the highest margins**: **items 58, 95, and 22**, and the **top three products with the lowest margins**: **items 87, 25, and 56**. A product's **profit margin** is influenced by multiple factors, with **production cost** and **selling price** being the most critical. Products with **lower production costs** typically achieve higher profit margins, as a smaller share of revenue is allocated to **manufacturing expenses**. Similarly, the **selling price** plays a significant role; products sold at prices significantly above their production costs tend to yield higher margins. Conversely, when the selling price is close to or below the production cost, the profit margin is **low** or even **negative**. This analysis underscores the essential interplay between **production cost** and **selling price** in determining **profitability**, providing a simple yet effective framework for evaluating product performance.

![Screen-Recording-2025-03-11-at-15 08 30](https://github.com/user-attachments/assets/0fd60283-d5c1-4645-b47d-25bd6d5a75b4)

The third analysis examined the evolution of sales in terms of volume, value, and margin for the product with the highest profit margin during 2023. The analysis revealed significant insights regarding the product's performance over time. The sales volume, represented by the quantity of units sold, exhibited monthly variations, indicating fluctuations in customer demand throughout the year. Correspondingly, the sales value reflected these changes, showing different revenue levels month by month. These trends suggest a dynamic sales environment influenced by factors such as seasonality, market conditions, or promotional efforts.

Despite the observed fluctuations in both sales volume and value, the profit margin for the product demonstrated remarkable stability, consistently remaining around 50% over the analyzed period. This indicates effective cost management and a well-structured pricing strategy, enabling the company to maintain consistent profitability regardless of variations in sales performance. This stability in margin underscores the importance of aligning production costs and pricing strategies to ensure sustained financial performance, even in the face of shifting market dynamics.

![Screen-Recording-2025-03-11-at-15 08 50](https://github.com/user-attachments/assets/878811d5-c71b-4fe4-89a2-c2846a4cc0e6)

The fourth analysis focused on identifying the **optimal product mix** to maximize both **sales value** and **profit margin**. The results highlighted products that achieve the best balance between **high total sales value** and **proportionally high profit margins**, making them key contributors to the company’s financial success. Products that excel in this regard appear on both lists: those with the **highest profit margins** and those generating **substantial total sales value**. Examples include items with IDs **20, 70, 72, 83, and 97**. These products represent a favorable combination of **profitability** and **revenue generation**, aligning well with the company’s goals. These products are particularly noteworthy as they not only generate significant sales revenue but also maintain strong profit margins. This indicates that they are in **high demand**, providing the company with both **strong financial returns** and a solid foundation for future **growth and profitability**.

![Screen-Recording-2025-03-11-at-15 09 08](https://github.com/user-attachments/assets/3f493192-dcb9-40c8-b3e6-b426734c08b9)

The analysis addressed the question: **"What was the percentage variation in sales month by month and year-to-date?"** Using the available data, we examined sales fluctuations throughout 2023. In **January**, total sales reached approximately **106,520 monetary units**. In **February**, sales decreased by **9.85%**, totaling around **96,029 monetary units**. **March** saw a significant recovery with a growth of **19.40%** compared to February. However, **April** experienced a decline of **-15.56%**, followed by a growth of **10.39%** in **May**.

In the subsequent months, fluctuations continued: **June** saw a slight decrease of **-2.61%**, **July** recorded a larger drop of **-11.27%**, and **August** experienced a sharp decline of **-42.86%** compared to July. When analyzing the **year-to-date sales growth**, a gradual decline was observed throughout 2023. The annual growth rate decreased from **90.15%** in February to **7.36%** in August. This trend indicates a **slowdown in sales growth** over the year, offering critical insights for **strategic planning** aimed at improving sales performance and addressing potential market challenges.

![Screen Recording 2025-03-11 at 15 09 34](https://github.com/user-attachments/assets/2171dbc9-6c15-4576-bb85-17516413cdaf)

**Dashboard**: https://app.powerbi.com/view?r=eyJrIjoiYzNkYjlmOGEtOTE3Mi00ODM1LTg3YzktNjI1ZmNjNmM3OTM1IiwidCI6ImQ2OWE3NzgzLWU5MzctNDIzMi1iYTg1LTIwOTg0MDgzODJjOCJ9

