/* Discount Effects */

-- Using SampleRetail database generate a report, 
-- including product IDs and discount effects 
-- on whether the increase in the discount rate positively impacts the number of orders for the products.

-- For this, statistical analysis methods can be used. 
-- However, this is not expected.

-- In this assignment, you are expected to generate a solution 
-- using SQL with a logical approach. 


-- Sample Result:
-- Product_id	Discount Effect
-- 1	        Positive
-- 2	        Negative
-- 3	        Negative
-- 4	        Neutral


WITH t1 AS(
    SELECT  product_id, 
                    discount, 
                    SUM(quantity) as sum_quantity,
                    LAG(SUM(quantity)) OVER (PARTITION BY product_id ORDER BY product_id) as previous_quantity,
                    SUM(quantity) - LAG(SUM(quantity)) OVER (PARTITION BY product_id ORDER BY product_id) as diff_quantity
    FROM sale.order_item
    GROUP BY product_id, discount
)

SELECT product_id,
        CASE 
            WHEN SUM(diff_quantity) > 0 THEN 'Positive'
            WHEN SUM(diff_quantity) < 0 THEN 'Negative'
            ELSE 'Neutral'
        END as Discount_Effect
FROM t1
GROUP BY product_id