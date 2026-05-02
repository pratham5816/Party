desc product;

desc product_price;

select
	*
from
	product_price;

show tables like "%product%";

show tables like "%vendor%";

select
	COLUMN_NAME
from
	information_schema.`COLUMNS`
where
	COLUMN_NAME like "%vendor%";








select
	*
from
	order_header oh
join order_contact_mech cm on
	oh.order_id = cm.order_id;



