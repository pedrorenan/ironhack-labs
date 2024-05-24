-- Query 1
Select client_id FROM client WHERE district_id = 1 ORDER BY client_id LIMIT 5;
-- Query 2
Select max(client_id) FROM client WHERE district_id = 72 ORDER BY client_id;
-- Query 3
Select amount FROM loan ORDER BY amount LIMIT 3;
-- Query 4
Select status FROM loan GROUP BY status ORDER BY status;
-- Query 5
Select loan_id FROM loan ORDER BY payments DESC LIMIT 1;
-- Query 6
Select account_id as id, amount FROM loan ORDER BY account_id LIMIT 5;
-- Query 7
Select account_id FROM loan WHERE duration = 60 ORDER BY amount;
-- Query 8
Select DISTINCT(k_symbol) FROM `order` WHERE k_symbol <> "" ORDER BY k_symbol;
-- Query 9
Select order_id FROM `order` WHERE account_id = 34;
-- Query 10
Select account_id FROM `order` WHERE order_id BETWEEN 29540 and 29560 group by account_id;
-- Query 11
Select amount FROM `order` where account_to = 30067122;
-- Query 12
Select trans_id, date, type, amount FROM trans WHERE account_id = 793 ORDER BY date DESC LIMIT 10;
-- Query 13
Select COUNT(*) FROM client WHERE district_id < 10 GROUP BY(district_id) ORDER BY district_id;
-- Query 14
Select type, COUNT(*) FROM card GROUP BY type ORDER BY COUNT(*) DESC;
-- Query 15
Select account_id, sum(amount) FROM loan GROUP BY account_id ORDER BY sum(amount) DESC LIMIT 10;
-- Query 16
Select date, count(*) FROM loan WHERE date < 930907 GROUP BY date ORDER BY date DESC;
-- Query 17
select date, duration, count(*) FROM loan WHERE date BETWEEN 971201 AND 971231 GROUP BY date, duration ORDER BY date, duration;
-- Query 18
Select account_id, type, sum(amount) as total_amount FROM trans WHERE account_id = 396 GROUP BY type ORDER BY type;











