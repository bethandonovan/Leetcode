WITH daily_amount AS (
  SELECT visited_on, SUM(amount) AS amount
  FROM customer
  GROUP BY visited_on
),
rolling_window AS (
  SELECT 
    visited_on,
    SUM(amount) OVER (
      ORDER BY visited_on 
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    ROUND(AVG(amount) OVER (
      ORDER BY visited_on 
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS average_amount,
    ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
  FROM daily_amount
)
SELECT visited_on, amount, average_amount
FROM rolling_window
WHERE rn >= 7;