
select max(n.num) as num
from(
SELECT num
FROM mynumbers
GROUP BY num
HAVING COUNT(num) = 1) as n