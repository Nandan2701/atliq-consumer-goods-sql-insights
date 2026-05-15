/*4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

WITH products_in_2020 AS (
    SELECT
        dp.segment,
        COUNT(DISTINCT fgp.product_code) AS total_products20
    FROM fact_gross_price fgp
    JOIN dim_product dp
        ON fgp.product_code = dp.product_code
    WHERE fgp.fiscal_year = 2020
    GROUP BY dp.segment
),

products_in_2021 AS (
    SELECT
        dp.segment,
        COUNT(DISTINCT fgp.product_code) AS total_products21
    FROM fact_gross_price fgp
    JOIN dim_product dp
        ON fgp.product_code = dp.product_code
    WHERE fgp.fiscal_year = 2021
    GROUP BY dp.segment
)

SELECT
    products_in_2020.segment,
    products_in_2020.total_products20,
    products_in_2021.total_products21,
    products_in_2021.total_products21
        - products_in_2020.total_products20 AS difference
FROM products_in_2020
JOIN products_in_2021
    ON products_in_2020.segment = products_in_2021.segment
ORDER BY difference DESC;
