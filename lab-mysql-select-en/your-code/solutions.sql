-- Challenge 1
Select 
  a.au_id as AUTHOR,
  a.au_lname as 'LAST NAME',
  a.au_fname as 'FIRST NAME',
  t.title as TITLE,
  p.pub_name as PUBLISHER
FROM titleauthor as ta
INNER JOIN authors as a ON a.au_id = ta.au_id
INNER JOIN titles as t ON t.title_id = ta.title_id
INNER JOIN publishers as p ON p.pub_id = t.pub_id
ORDER BY a.au_id;

-- Challenge 2
Select 
  a.au_id as AUTHOR,
  a.au_lname as 'LAST NAME',
  a.au_fname as 'FIRST NAME',
  p.pub_name as PUBLISHER,
  COUNT(*) as 'TITLE COUNT'
FROM titleauthor as ta
INNER JOIN authors as a ON a.au_id = ta.au_id
INNER JOIN titles as t ON t.title_id = ta.title_id
INNER JOIN publishers as p ON p.pub_id = t.pub_id
GROUP BY  a.au_id, p.pub_name
ORDER BY a.au_id DESC;

-- Challenge 3
-- using sales table
Select 
  a.au_id as AUTHOR,
  a.au_lname as 'LAST NAME',
  a.au_fname as 'FIRST NAME',
  SUM(s.qty) as TOTAL
FROM titleauthor as ta
INNER JOIN authors as a ON a.au_id = ta.au_id
INNER JOIN titles as t ON t.title_id = ta.title_id
INNER JOIN sales as s ON s.title_id = ta.title_id
GROUP BY  a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- using ytd_sales field
Select 
  a.au_id as AUTHOR,
  a.au_lname as 'LAST NAME',
  a.au_fname as 'FIRST NAME',
  SUM(t.ytd_sales) as TOTAL
FROM titleauthor as ta
INNER JOIN authors as a ON a.au_id = ta.au_id
INNER JOIN titles as t ON t.title_id = ta.title_id
GROUP BY  a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4
-- using sales table
Select 
  a.au_id as AUTHOR,
  a.au_lname as 'LAST NAME',
  a.au_fname as 'FIRST NAME',
  IFNULL(SUM(s.qty), 0) as TOTAL
FROM authors as a
LEFT JOIN titleauthor as ta ON ta.au_id = a.au_id
LEFT JOIN titles as t ON t.title_id = ta.title_id
LEFT JOIN sales as s ON s.title_id = ta.title_id
GROUP BY  a.au_id
ORDER BY TOTAL DESC;

-- using ytd_sales field
Select 
  a.au_id as AUTHOR,
  a.au_lname as 'LAST NAME',
  a.au_fname as 'FIRST NAME',
  IFNULL(SUM(t.ytd_sales), 0) as TOTAL
FROM authors as a
LEFT JOIN titleauthor as ta ON ta.au_id = a.au_id
LEFT JOIN titles as t ON t.title_id = ta.title_id
GROUP BY  a.au_id
ORDER BY TOTAL DESC;