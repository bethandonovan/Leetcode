# Write your MySQL query statement below
select * from users 
where mail COLLATE utf8mb3_bin REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$' > 0
