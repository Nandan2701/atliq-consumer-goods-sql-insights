/*10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity
rank_order*/ 

WITH base AS (
    SELECT
        dp.division,
        dp.product_code,
        dp.product,
        SUM(fsm.sold_quantity) AS total_sold_quantity
    FROM fact_sales_monthly fsm
    INNER JOIN dim_product dp
        ON fsm.product_code = dp.product_code
    WHERE fsm.fiscal_integer = 2021
    GROUP BY
        dp.division,
        dp.product_code,
        dp.product
),

ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY division
            ORDER BY total_sold_quantity DESC
        ) AS rank_order
    FROM base
)

SELECT
    division,
    product_code,
    product,
    total_sold_quantity,
    rank_order
FROM ranked
WHERE rank_order <= 3;
