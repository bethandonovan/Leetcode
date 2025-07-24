DELETE FROM person
WHERE id NOT IN (
  SELECT min_id FROM (
    SELECT MIN(id) AS min_id
    FROM person
    GROUP BY email
  ) AS keep_ids
);