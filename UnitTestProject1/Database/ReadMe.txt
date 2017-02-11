01) What is the difference between unique and primary key?
	Unique keys can have nulls, primary keys cannot
	You can create multiple unique keys on a table, you can only have one primary key on a table
	Unique creates a non-clustered index by default, primary key creates a clustered index
	Both unique and primary keys can be foreign keys
02) What is the difference between clustered and non-clustered index?
	a) Clustered:
	b) Non-clustered: 
03) What are your index creation guidelines?
04) What is the difference between inner, left join, right join, left outer join, right outer join, full outer join, cross join? 
05) What is ACID?
06) Views vs Stored Procedures
07) What are ways to do batch inserts, updates?
08) Describe all three normal forms?
09) What is the difference between ISNULL and Coalesce?
10) What is the difference between table variable and temp table?
	a) Table variable:
	b) Temp table:
11) What is a CTE?
12) What is a table valued parameter?
13) What is a pivot?
14) What is cross apply?
15) What's the difference between union and unionall?
16) What is EAV?
	Means Entity-Attribute-Value, storing data in DB non-relationally, name/value pair really, Reddit uses this heavily, Things table, everything is a Thing
17) What are triggers good for?
18) What is OLTP and OLAP?
	a) OLTP: Online Transaction Processing is characterized by a large number of short on-line transactions (INSERT, UPDATE, DELETE). 
		The main emphasis for OLTP systems is put on very fast query processing, maintaining data integrity in multi-access environments and an effectiveness measured by number of transactions per second. In OLTP database there is detailed and current data, and schema used to store transactional databases is the entity model (usually 3NF). 
	b) OLAP: Online Analytical Processing performs multidimensional analysis of business data, data warehouse, cubes
19) What is the UPDATE_STATISTICS command used for?
20) What is Log Shipping?
21) What is parameter sniffing?
22) What does it mean to have QUOTED_IDENTIFIER ON?
23) What is the CHECK constraint?
24) What are linked servers? Can SQL Server be linked to Oracle?
