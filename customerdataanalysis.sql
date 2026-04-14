use project_customer_segmentation;
select*from customer;
desc customer;
select 
sum(case when invoice_no is null then 1 else 0 end) as invoice_no_null,
sum(case when customer_id is null then 1 else 0 end) as customer_id_null,
sum(case when gender is null then 1 else 0 end) as gender_null,
sum(case when age is null then 1 else 0 end) as age_null,
sum(case when category is null then 1 else 0 end) as category_null,
sum(case when quantity is null then 1 else 0 end) as quantity_null,
sum(case when price is null then 1 else 0 end) as price_null,
sum(case when payment_method is null then 1 else 0 end) as payment_method_null,
sum(case when invoice_date is null then 1 else 0 end) as invoice_date_null,
sum(case when shopping_mall is null then 1 else 0 end) as shopping_mall_null
from customer;

select count(*) as total_rows from customer;

select price*quantity as total_revenue from customer;
#total revenue calculation
select sum(price*quantity) as revenue from customer;

#How is the shopping distribution according to gender?
select gender,
count(*) as total_distribution 
from customer
group by gender;

#Which gender did we sell more products to?
select gender, 
sum(quantity) as total_products 
from customer
group by gender order by total_products desc limit 1;

#Which gender generated more revenue?
select gender,
sum(price*quantity) as total_revenue
from customer
group by gender order by total_revenue desc limit 1;

#Distribution of purchase categories relative to other columns?
select category, gender,
sum(quantity) as total_quantity,
sum(price*quantity) as total_revenue
from customer
group by category,gender
order by total_revenue desc;

#How is the shopping distribution according to age?
select 
case 
when age between 18 and 25 then '18-25'
when age between 26 and 35 then '26-35'
when age between 36 and 45 then '36-45'
when age between 46 and 55 then '46-55'
when age between 56 and 65 then '56-65'
else '65+' end as age_group,
count(quantity) as total_quantity
from customer
group by age_group
order by total_quantity desc;

#Which age cat did we sell more products to?
select 
case
when age between 18 and 25 then '18-25'
when age between 26 and 35 then '26-35'
when age between 36 and 45 then '36-45'
when age between 46 and 55 then '46-55'
when age between 56 and 65 then '56-65'
else '65+' end as age_group,
sum(quantity) as total_quantity
from customer
group by age_group
order by total_quantity;

#Which age cat generated more revenue?
select 
case 
when age between 18 and 25 then '18-25'
when age between 26 and 35 then '26-35'
when age between 36 and 45 then '36-45'
when age between 46 and 55 then '46-55'
when age between 56 and 65 then '56-65'
else '65+' end as age_group,
sum(quantity*price) as total_revenue
from customer
group by age_group
order by total_revenue desc;

#Distribution of purchase categories relative to other columns?
select 
case
when age between 18 and 25 then '18-25'
when age between 26 and 35 then '26-35'
when age between 36 and 45 then '36-45'
when age between 46 and 55 then '46-55'
when age between 56 and 65 then '56-65'
else '65+' end as age_group,
sum(quantity) as total_quantity,
sum(price*quantity) as total_revenue
from customer
group by category,age_group
order by total_revenue desc;

#Does the payment method have a relation with other columns?
select payment_method,category,gender,
sum(quantity) as total_quantity,
sum(price*quantity) as total_revenue
from customer
group by payment_method,category,gender
order by total_revenue desc;

#How is the distribution of the payment method?
select payment_method,
count(*) as total_quantity,
sum(price*quantity) as total_revenue
from customer
group by payment_method;





