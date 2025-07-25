# Write your MySQL query statement below
select 
round(
    (
 select count(distinct a2.player_id) from 
(select min(event_date) as first_login, player_id from activity
group by player_id) as firstlog
join activity a2
on firstlog.player_id = a2.player_id and
firstlog.first_login = date_add(a2.event_date , interval -1 day))
/(select count(distinct player_id) from activity), 2) as fraction