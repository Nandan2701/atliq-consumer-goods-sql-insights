/*2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg*/

with products_in_2020 as (
SELECT COUNT(DISTINCT product_code) AS unique_2020_products
    FROM fact_sales_monthly
    WHERE "date" >= DATE '2019-09-01'
        AND "date" <= DATE '2020-08-31'
)
,
products_in_2021 as (
SELECT COUNT(DISTINCT product_code) AS unique_2021_products
    FROM fact_sales_monthly
    WHERE "date" >= DATE '2020-09-01'
        AND "date" <= DATE '2021-08-31'
)
select products_in_2020.unique_2020_products ,
       products_in_2021.unique_2021_products ,
       ROUND(
            (products_in_2021.unique_2021_products - products_in_2020.unique_2020_products)
            * 100.0
            / products_in_2020.unique_2020_products,
            2
       ) AS percentage_chg
from  products_in_2020 ,products_in_2021 ;

