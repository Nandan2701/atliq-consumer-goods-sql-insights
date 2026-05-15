/*6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage*/

select fd.customer_code,
       dc.customer,
       avg(pre_invoice_discount_pct) as average_discount_percentage
from fact_pre_invoice_deductions fd
inner join dim_customer dc
on fd.customer_code = dc.customer_code
where fiscal_year = 2021 and market = 'India'
group by fd.customer_code, dc.customer
order by avg(pre_invoice_discount_pct) desc
limit 5
;
