--Total freight Cost
Select sum(freight_value) AS Total_Freight_Cost
from Order_items;

--total number of rows(including nulls)
Select Count(*) AS No_of_rows
from Order_items;

--Most expensive item
select max(price) AS highest_Price
from Order_items;

--Top5 Sellers by revenue
Select top 5 
    seller_id,
    SUM(price) AS total_revenue
from order_items
group by seller_id
order by total_revenue DESC;

--To determine unique sellers
Select Distinct(Seller_Id)As Sales_Person
From order_items
Order By (seller_id)Asc ;

--Average Freight cost per Order
select AVG(order_freight) AS average_frieght_value_per_order
from(
    select order_id, 
    sum(freight_value) AS Order_Freight
    from order_items
    group by order_id
) AS Freight_payments;
