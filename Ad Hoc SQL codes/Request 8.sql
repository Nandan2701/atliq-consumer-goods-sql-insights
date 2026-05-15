/*8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity*/

select case
        when Extract(month from date) in (9,10,11) then 'Q1'
        when Extract(month from date) in (12,1,2) then 'Q2'
        when Extract(month from date) in (3,4,5) then 'Q3'
        when Extract(month from date) in (6,7,8) then 'Q4'
    End as Quarter ,
sum(sold_quantity) as total_sold_quatity
from fact_sales_monthly
where fiscal_integer = 2020
group by quarter
ORDER BY total_sold_quatity DESC;
