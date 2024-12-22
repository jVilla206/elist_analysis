# Overview of Elist E-Commerce Analysis
Founded in 2018, Elist is an e-commerce company that provides customers with popular electronics such as Apple, Samsung, and Thinkpad products globally. In this project, I collaborated with the Head of Operations to perform an analysis to surface insights on Elist's performance across different areas of the business to drive improvements in the sales, product, and marketing teams. 

I used Excel and a combination of conditional formatting, aggregation functions, Pivot Tables, and statistical analysis to clean, analyze, and summarize these insights to deliver to the marketing, finance, operations, and product teams. I augmented and performed a more thorough analysis with SQL using CTEs, windows functions, inner and left joins, and case-when statements. I also built a dashboard in Power BI to visually showcase differences from year to year on the AOV, revenue, and order count.

* An Excel spreadsheet with more in-depth insights can be found [here](https://github.com/jVilla206/elist_analysis/blob/main/elist_full_table.csv)
* SQL queries used to clean and analyze this dataset can be found [here](https://github.com/jVilla206/elist_analysis/blob/main/elist_analysis.sql)
* The Power BI dashboard can be found [here](https://github.com/jVilla206/elist_analysis/blob/main/Elist%20Dashboard.pbix) to view a breakdown of the key performance indicators (KPIs).

### Entity Relationship Diagram (ERD)
<img width="650" alt="image" src="https://github.com/user-attachments/assets/95b11f60-e17c-4d72-9e53-8bc788bde96f">

# **Executive Summary**
From 2019 to 2022, the average annual sales reached 21K orders with a yearly sales of $5.6 million and an average order value of $227. Notably, 2021 had the highest number of sales ($36,000), while 2020 exhibited the highest average order value ($300). Spring and winter months tend to have higher sales, possibly due to holiday gift-buying and promotions, and there was a spike in average sale price in January and February 2020, possibly related to pandemic purchases. Apple Airpods Headphones consistently ranked as the best-selling product, and in 2022, the top three products accounted for 70% of sales, while the Bose Headphones had the lowest number of sales across most years. The team recommends continuing with the loyalty program, as these customers make more purchases on average and purchase more expensive items even with their program discount. 

# Insights Deep-Dive
### **Breakdown of Analysis**
* **Yearly Summary:** From 2019 to 2022, the average number of sales per year was 27k, with an average yearly sale revenue of $7M and an average order value (AOV) of $254. 2021 saw the highest number of sales (36K), but 2020 had on average the most expensive (AOV of $300).
* **Growth rates:** 2020 had by far the highest growth rate, with more than double the number of sales and the total sales revenue than 2019. On average, 2020 sales were also 31% more expensive than 2019 sales. While 2021 exhibited positive growth in the number of sales, total sales revenue went down, as people purchased items that were on average 15% cheaper than in 2021.
* **Seasonality:** Typically winter months (November and December) have a higher number of sales than summer months, likely due to holiday gift buying and seasonal promotions. Usually, the average order value does not have a strong seasonal pattern, though in January and February of 2020, there was a 12-13% rise in average sale price, perhaps related to pandemic purchases. We could break down the total sales by product type to see if a specific product drove this increase.
* **Products:** Across all 4 years, Apple Airpod Headphones have been the best-selling product, with an average of 12K orders a year (note: we are using order count, instead of total sales, to determine the best-selling product. This would need to be checked with stakeholders.) In 2022, 70% of sales came from the top 3 products: the Apple headphones, the gaming monitor, and the charging cable pack.

<img width="750" alt="image" src=image.png>

**Effectiveness of the loyalty program**
* **Findings:** During 2019 and 2020, loyalty program customers made fewer purchases than non-loyalty program customers, and their purchases were less expensive than non-loyalty customers. However, in more recent years (2021-2022), loyalty customers not only made more purchases than non-loyalty customers but also purchased about $30 more on average in 2022.
* **Recommendation:** Considering the fact that in recent years, loyalty customers are not only making more purchases but also more expensive purchases than non-loyalty customers, we would recommend continuing with the loyalty program.

# Recommendations
Based on these insights, the team would like to make several recommendations across several areas:

* Products:
  * Elist should consider making cuts to the Bose Soundsport Headphones product line. This product line has contributed less than 1% of total sales each year and has not shown any positive growth in either number of orders or sales. If we need to consider further aggressive cuts to product lines, Apple iPhone and the Samsung Charging Cable Packs should be next as these products contributed less than 3% of sales each year and took the longest to deliver to customers on average, which impacts customers' perception of our service negatively.

* Loyalty Program:
  * The team recommends continuing with the loyalty program as customers in the loyalty program have shown to make more purchases on average and contribute to higher sales.

* Operational Effectiveness:
  * As Elist continues to grow globally, consider assessing whether there are better national delivery partners we can work with. While our shipping times are on par with our largest e-commerce competitors, customers on average are increasingly expecting faster delivery times. Improvements can be made to our delivery network to align with growing consumer expectations.

* Marketing Channels:
  * The team recommends continuing to make investments in the direct and email marketing channels. These will continue to provide strong growth and contributions to sales. Consider decreasing marketing efforts on social media channels as sales attributed to these channels have accounted for less than 2% of total sales traditionally and are declining even further in recent years.

* Platform Improvements:
  * Our website continues to see strong demand for new accounts. We recommend continuing to enhance the website and mobile apps as both platforms continue to see strong growth.

# Future Considerations
Further analysis can be performed in the future by breaking down the geographic and regional trends, and how performance varies across these dimensions with the same metrics from this project.
