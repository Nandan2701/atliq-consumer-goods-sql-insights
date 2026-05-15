/*5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost*/

with highest_price as (
select fmc.product_code ,
       product,
       manufacturing_cost
from fact_manufacturing_cost fmc
inner join dim_product dm
on fmc.product_code = dm.product_code
order by manufacturing_cost desc
limit 1 )

,
lowest_price as (
select fmc.product_code ,
       product,
       manufacturing_cost
from fact_manufacturing_cost fmc
inner join dim_product dm
on fmc.product_code = dm.product_code
order by manufacturing_cost asc
limit 1
)
SELECT * FROM highest_price
UNION ALL
SELECT * FROM lowest_price;
