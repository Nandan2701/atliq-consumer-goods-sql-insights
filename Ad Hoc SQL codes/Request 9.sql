/*9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/

with first_third_column as (
select * from dim_customer dc
inner join fact_sales_monthly fm
on dc.customer_code = fm.customer_code
)

,
finalTable as
(
select * from first_third_column  ftc
inner join fact_gross_price fgm
on ftc.product_code = fgm.product_code
)
select channel ,
       sum(gross_price * sold_quantity) as gross_sales_mln ,
       ROUND(
       100.0 * SUM(gross_price * sold_quantity)
       / SUM(SUM(gross_price * sold_quantity)) OVER (),
       2
       ) AS percentage_share

from finalTable
where fiscal_year = 2021
group by channel ;
